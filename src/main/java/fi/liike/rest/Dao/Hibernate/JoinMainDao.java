package fi.liike.rest.Dao.Hibernate;

import fi.liike.rest.Dao.HibernateSession;
import fi.liike.rest.Model.JoinHistory;
import fi.liike.rest.Model.JoinTable;
import fi.liike.rest.api.HistoryType;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Calendar;
import java.util.List;

public class JoinMainDao extends HibernateSession {

	public String remoteUser;
	private final Logger LOG = LoggerFactory.getLogger(JoinMainDao.class);

	public void createEntry(Session session, JoinTable content,
			JoinHistory newHistory) {
		LOG.info("Saving join entry {} with parentId {} and childId {}, ", content.getClass(), content.getParentNode(), content.getChildNode());
		List<JoinTable> joinTableList;


			joinTableList = getJoin(session, content);

		
		if (!joinTableList.isEmpty()) {
			throw new RuntimeException();
		}
		session.save(content);
		saveHistory(session, content, newHistory, HistoryType.ADD);
	}

	private void saveHistory(Session session, JoinTable content, JoinHistory newHistory, HistoryType historyType) {
		newHistory.setChildNode(content.getChildNode());
		newHistory.setParentNode(content.getParentNode());
		newHistory.setRivimuokkaajatunnus(remoteUser);
		setCreationTimestamp(newHistory);
		newHistory.setHistoriatyyppi(historyType);

		session.save(newHistory);
	}

	@SuppressWarnings("unchecked")
	private List<JoinTable> getJoin(Session session, JoinTable content) {
		Criteria criteria = session.createCriteria(content.getClass());
		criteria.add(Restrictions.eq("childNode", content.getChildNode()));
		criteria.add(Restrictions.eq("parentNode", content.getParentNode()));
		return criteria.list();
	}

	public void update(Session session, JoinTable content, JoinHistory newHistory) {
		// search current entry with child node id
		Criteria criteria;


		criteria = getJoinCriteriaWithChildNodeId(session, content);


		// if found update parent id row
		@SuppressWarnings("unchecked")
		List<JoinTable> joinEntries = criteria.list();
		if (joinEntries == null || joinEntries.isEmpty()) {
			createEntry(session, content, newHistory);
			return;
		}

		JoinTable joinEntry = joinEntries.get(0);

		joinEntry.setParentNode(content.getParentNode());

		session.update(joinEntry);
		saveHistory(session, content, newHistory, HistoryType.MOD);
	}

	public void delete(Session session, JoinTable content, JoinHistory newHistory) {
		List<JoinTable> joinList;

		joinList = getJoin(session, content);

		if (joinList.isEmpty())
			throw new RuntimeException();
		session.delete(joinList.get(0));
		saveHistory(session, content, newHistory, HistoryType.DEL);
	}

	private void setCreationTimestamp(JoinHistory history) {
		history.setRiviluotupvm(new java.sql.Timestamp(Calendar.getInstance().getTime().getTime()));
	}

	public Integer getParentNodeId(JoinTable content) {
		Session session = getSession();
		Criteria criteria = getJoinCriteriaWithChildNodeId(session, content);
		@SuppressWarnings("unchecked")
		List<JoinTable> results = criteria.list();
		closeSession();
		if (results == null || results.isEmpty())
			return null;
		return results.get(0).getParentNode();
	}

	private Criteria getJoinCriteriaWithChildNodeId(Session session, JoinTable content) {
		Criteria criteria = session.createCriteria(content.getClass());
		criteria.add(Restrictions.eq("childNode", content.getChildNode()));
		return criteria;
	}

	private Criteria getJoinCriteria(Session session, Class<? extends JoinTable> joinTableClass,  String propertyName,
									 Integer propertyValue) {
		Criteria criteria = session.createCriteria(joinTableClass);
		criteria.add(Restrictions.eq(propertyName, propertyValue));
		return criteria;
	}

}
