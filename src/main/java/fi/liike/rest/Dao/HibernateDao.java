package fi.liike.rest.Dao;

import fi.liike.rest.Dao.Hibernate.KatalogiComparator;
import fi.liike.rest.Model.*;
import fi.liike.rest.api.DaoContent;
import fi.liike.rest.api.HistoryType;
import fi.liike.rest.api.KasiteArvoContent;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import static java.lang.String.format;

public class HibernateDao extends HibernateSession {
	private final Logger LOG = LoggerFactory.getLogger(HibernateDao.class);

	public HibernateDao() {
	}

	public Criteria luoHaku(Class<? extends Haettava> clazz) {
		getSession().beginTransaction();
		Criteria crit = getSession().createCriteria(clazz);
		return crit;
	}


	public List<Haettava> getAll(Class<? extends Haettava> className) {
		Criteria crit = luoHaku(className);
		List<Haettava> entries = list(crit);
		closeSession();
		return entries;
	}

	public Haettava get(Class<? extends Haettava> className, int id) {
		return get(className, id, Collections.<Criterion>emptyList());
	}

	public Haettava get(Class<? extends Haettava> className, int id, List<Criterion> criterionList) {
		Criteria crit = luoHaku(className);
		crit.add(Restrictions.eq("tunnus", id));
		for (Criterion criterion : criterionList) {
			crit.add(criterion);
		}
		List<Haettava> entries = list(crit);
		closeSession();
		return getLatest(entries);
	}

	@SuppressWarnings("unchecked")
	protected <T> List<T> list(Criteria criteria) {
		return criteria.list();
	}

	/*
	 * In theory there should never be more than one active version of entry. If
	 * for some reason there is more then use the latest version.
	 */
	protected Haettava getLatest(List<Haettava> entries) {
		if (entries.isEmpty())
			return null;
		Collections.sort(entries, new KatalogiComparator());
		return entries.get(0);
	}

	protected void setCreationTimestamp(Haettava content) {
		content.setRiviluotupvm(new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
	}

	protected void setModificationInformation(Haettava content, HaettavaHistory history) {
		java.sql.Timestamp timestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
		content.setRivimuokattupvm(timestamp);
		history.setRiviluotupvm(timestamp);
		history.setRivimuokkaajatunnus(content.getRivimuokkaajatunnus());
	}

	protected <T extends Haettava> Haettava save(Session passedSession, DaoContent saveContent, String sequence, HaettavaHistory history)
			throws SQLException {
		LOG.info("Saving content {} with name: {}", saveContent.getContent().getClass(), saveContent.getContent().getNimi());

		Haettava content = saveContent.getContent();
		if (content.getTunnus() != null) {
			throw new SQLException("Uusi rivi voidaan luoda vain jos id:ta ei ole maaritelty.");
		}
		Session session = passedSession;
		if (session == null) {
			session = getSession();
		}

		// Update sequence.
		// If db imported data happens to have same value with sequence, search
		// next free number.
		int id = getFreeId(content, session, sequence);
		content.setTunnus(id);
		setCreationTimestamp(content);
		if (!createHistoryEntry(content, history, HistoryType.ADD)) {
			return null;
		}

		if (passedSession == null) {
			Transaction transaction = null;
			try {
				transaction = session.beginTransaction();
				session.save(content);
				session.save(history);
				for (JoinPublicDao joinDao : saveContent.getJoinDaos()) {
					joinDao.save(session, content.getTunnus());
				}
				transaction.commit();
			} catch (RuntimeException e) {
				try {
					LOG.error("Unable to do a transaction. Error message: " + e.getMessage());
					content = null;
					transaction.rollback();
				} catch (RuntimeException ex) {
					LOG.error("Cannot roll back transaction! Error Message: " + ex.getMessage());
				}
			} finally {
				if (session != null)
					session.close();
			}
		} else {
			session.save(content);
			session.save(history);
			for (JoinPublicDao joinDao : saveContent.getJoinDaos()) {
				joinDao.save(session, content.getTunnus());
			}
		}

		return content;
	}

	private int getFreeId(Haettava content, Session session, String sequence) {
		int id = 0;
		boolean freeIdFound = false;

		while (!freeIdFound) {
			SQLQuery increaseSeqQuery = session.createSQLQuery("select tiesu." + sequence + ".nextval from dual");
			BigDecimal newValue = (BigDecimal) increaseSeqQuery.uniqueResult();
			id = newValue.intValue();

			Criteria criteria = session.createCriteria(content.getClass());
			criteria.add(Restrictions.eq("tunnus", id));
			List<Haettava> list = list(criteria);
			if (list.isEmpty())
				freeIdFound = true;

		}
		return id;
	}

	protected void testSimpleSQLquery() {
		//Just testing connection
		getSession().createSQLQuery("SELECT 1 FROM dual").uniqueResult();
		closeSession();
	}

	private boolean createHistoryEntry(Haettava content, HaettavaHistory history, HistoryType historyType) {
		PropertyUtilsBean beanUtil = new PropertyUtilsBean();
		try {
			beanUtil.copyProperties(history, content);
			if (content.getRivimuokattupvm() != null)
				history.setRiviluotupvm(content.getRivimuokattupvm());
			history.setHistoriatyyppi(historyType);
		} catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
			LOG.error("Could not copy properties to BeanUtils! Error Message: " + e.getMessage());
			return false;
		}
		return true;
	}

	private boolean copyEditedContentToExistingEntry(Haettava content, Haettava existing) {
		content.setRiviluotupvm(existing.getRiviluotupvm());
		content.setRivimuokattupvm(existing.getRivimuokattupvm());
		PropertyUtilsBean beanUtil = new PropertyUtilsBean();
		try {
			beanUtil.copyProperties(existing, content);
		} catch (NoSuchMethodException | InvocationTargetException | IllegalAccessException e) {
			LOG.error("Could not copy properties to BeanUtils! Error Message: " + e.getMessage());
			return false;
		}
		return true;
	}

	public Haettava update(Session passedSession, DaoContent saveContent, HaettavaHistory history) {
		Haettava content = saveContent.getContent();
		Session session = passedSession;
		if (session == null) {
			session = getSession();
		}
		Criteria crit = session.createCriteria(saveContent.getContent().getClass());
		crit.add(Restrictions.eq("tunnus", saveContent.getContent().getTunnus()));

		List<Haettava> list = list(crit);
		Haettava existing = getLatest(list);
		if (existing == null) {
			return null;
		}

		copyEditedContentToExistingEntry(content, existing);
		setModificationInformation(existing, history);
		if (!createHistoryEntry(existing, history, HistoryType.MOD)) {
			return null;
		}

		if (passedSession == null) {
			Transaction transaction = null;
			try {
				transaction = session.beginTransaction();
				session.saveOrUpdate(existing);
				session.save(history);
				for (JoinPublicDao joinDao : saveContent.getJoinDaos()) {
					joinDao.update(session, content.getTunnus());
				}
				transaction.commit();
			} catch (RuntimeException e) {
				try {
					LOG.error("Unable to do a transaction. Error message: " + e.getMessage());
					existing = null;
					transaction.rollback();
				} catch (RuntimeException ex) {
					LOG.error("Cannot roll back transaction! Error Message: " + ex.getMessage());
				}
			} finally {
				if (session != null) {
					session.close();
				}
			}
		} else {
			session.saveOrUpdate(existing);
			session.save(history);
			for (JoinPublicDao joinDao : saveContent.getJoinDaos()) {
				joinDao.update(session, content.getTunnus());
			}
		}

		return existing;
	}

	public void delete(Class<? extends Haettava> className, Class<? extends HaettavaHistory> historyClassName, int id,
			HaettavaHistory history, DaoContent deleteContent, String remoteUser) throws SQLException {
		Session session = getSession();
		Criteria criteria = session.createCriteria(className);
		criteria.add(Restrictions.eq("tunnus", id));

		List<Haettava> list = list(criteria);
		Haettava entry = getLatest(list);
		if (entry == null)
			throw new SQLException("Poistettavaa ei loydy");
		setModificationInformation(entry, history);
		createHistoryEntry(entry, history, HistoryType.DEL);

		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.delete(entry);
			session.save(history);
			if (deleteContent != null)
				for (JoinPublicDao joinDao : deleteContent.getJoinDaos()) {
					joinDao.delete(session, id);
				}
			transaction.commit();
		} catch (RuntimeException e) {
			try {
				LOG.error("Unable to do a transaction. Error message: " + e.getMessage());
				transaction.rollback();
			} catch (RuntimeException ex) {
				LOG.error("Cannot roll back transaction! Error Message: " + ex.getMessage());
			}
		} finally {
			if (session != null)
				session.close();
		}
	}

	public List<KasiteArvoContent> getResources(Class<? extends KasiteArvo> className) {
		Criteria crit = getSession().createCriteria(className);
		List<KasiteArvo> resources = list(crit);
		closeSession();
		return createKasiteArvoContent(resources);
	}

	private List<KasiteArvoContent> createKasiteArvoContent(List<KasiteArvo> resources) {
		ArrayList<KasiteArvoContent> content = new ArrayList<KasiteArvoContent>();
		for (KasiteArvo kasiteArvo : resources) {
			content.add(new KasiteArvoContent(kasiteArvo.getId(), kasiteArvo.getKasite(), kasiteArvo.getArvo()));
		}
		return content;
	}

	public void saveTempTableAndMergeTables(
			List<Object> objList, String tempTable, String targetTable, String targetTableIdSequence, String idColumn,
			String matchingColumn, String updateColumn, Integer updateValue,
			List<String> updateColumns, List<String> insertColumns) {
		Session session = getSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			//Clear temp table
			String clearTempTableSql = format("DELETE FROM %s", tempTable);
			executeBasicSqlUpdate(clearTempTableSql, session);
			session.flush();
			for (Object object : objList) {
				//Populate Sovellus Temp table
				session.save(object);
			}
			session.flush();

			mergeTables(targetTable, targetTableIdSequence, idColumn, tempTable,
					matchingColumn, updateColumns, insertColumns, updateColumn, updateValue, session);
			transaction.commit();
		} catch (RuntimeException e) {
			try {
				LOG.error(format("Could not merge tables %s %s", targetTable, tempTable));
				transaction.rollback();
				throw new RuntimeException();
			} catch (RuntimeException ex) {
				LOG.error("Cannot roll back transaction! Error Message: " + ex.getMessage());
				throw new RuntimeException();
			}
		} finally {
			if (session != null)
				session.close();
		}
	}

	private void mergeTables(String targetTable, String targetTableIdSequence, String idColumn, String sourceTable,
							String matchingColumn, List<String> updateColumns, List<String> insertColumns,
							String mergeUnmatchUpdateColumn, Object mergeUnmatchUpdateValue, Session session) {
		String mergeSql = getMergeTablesSql(targetTable, targetTableIdSequence, idColumn, sourceTable, matchingColumn,
				updateColumns, insertColumns);

		executeBasicSqlUpdate(mergeSql, session);
		session.flush();
		updateTargetTableAfterMerge(targetTable, sourceTable, mergeUnmatchUpdateColumn, mergeUnmatchUpdateValue,
				matchingColumn, session);
		session.flush();
	}

	private int updateTargetTableAfterMerge(String targetTable, String sourceTable, String mergeUnmatchUpdateColumn,
											Object mergeUnmatchUpdateValue, String matchingColumn, Session session) {
		String sql = format("UPDATE %s SET %s = %s WHERE %s NOT IN (SELECT %s FROM %s) ",
				targetTable, mergeUnmatchUpdateColumn, mergeUnmatchUpdateValue, matchingColumn,
				matchingColumn, sourceTable);
		executeBasicSqlUpdate(sql, session);
		//HOX! Be careful with this hard coded value.... TODO make this better
		Integer oppositeValue = ((Integer) mergeUnmatchUpdateValue) == 1 ? 0 : 1;
		sql = format("UPDATE %s SET %s = %s WHERE %s IN " +
						"(SELECT %s FROM %s) ",
				targetTable, mergeUnmatchUpdateColumn, oppositeValue, matchingColumn, matchingColumn, sourceTable);
		return executeBasicSqlUpdate(sql, session);
	}

	//Transaction has been started
	public int executeBasicSqlUpdate(String sql, Session session) {
		if (session == null) {
			throw new RuntimeException();
		}
		SQLQuery query = session.createSQLQuery(sql);
		int updated = query.executeUpdate();

		return updated;
	}

	public String getMergeTablesSql(String targetTable, String targetTableIdSequence, String idColumn,
									String sourceTable, String matchingColumn,
									List<String> updateColumns, List<String> insertColumns) {
		String lineEnding = ",\n";
		StringBuilder updateSql = new StringBuilder();
		for (String updateColumn : updateColumns) {
			updateSql.append(format("T.%s = S.%s%s", updateColumn, updateColumn, lineEnding));
		}
		updateSql.replace(updateSql.length() - lineEnding.length(), updateSql.length() - 1, "");

		StringBuilder insertSql = new StringBuilder("(");
		for (String insertColumn : insertColumns) {
			insertSql.append(format("T.%s,", insertColumn));
		}
		insertSql.replace(insertSql.length() - 1, insertSql.length(), ")\n");
		insertSql.append("VALUES (");
		for (String insertColumn : insertColumns) {
			if (insertColumn.equals(idColumn)) {
				insertSql.append(format("%s.nextval, ", targetTableIdSequence));
			} else {
				insertSql.append(format("S.%s, ", insertColumn));
			}

		}
		insertSql.replace(insertSql.length() - 2, insertSql.length(), ")");

		return format(
				"MERGE INTO %s T\n" +
						"USING %s S\n" +
						"ON (S.%s = T.%s)\n" +
						"WHEN MATCHED THEN UPDATE\n" +
						"SET %s" +
						"WHEN NOT MATCHED\n" +
						"THEN INSERT %s",
				targetTable, sourceTable, matchingColumn, matchingColumn, updateSql.toString(), insertSql.toString());
	}

}
