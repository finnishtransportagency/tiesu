package fi.liike.testutils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

import fi.liike.rest.Dao.Hibernate.HistoryComparator;
import fi.liike.rest.Dao.Hibernate.KatalogiComparator;
import fi.liike.rest.Model.Haettava;
import fi.liike.rest.Model.HaettavaHistory;
import fi.liike.rest.Model.JoinHistory;
import fi.liike.rest.Model.JoinTable;
import fi.liike.rest.api.Catalogue;
import fi.liike.rest.api.HistoryType;
import fi.liike.rest.api.JoinCategory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class TestDbUtil {

	private static final Logger LOG = LoggerFactory.getLogger(TestDbUtil.class);
	private static Session session;
	private static SessionFactory sessionFactory;

	public static void init() {
		sessionFactory = new Configuration().configure("testhibernate.cfg.xml").buildSessionFactory();
	}

	private static Session getSession() {

		if (session == null || !session.isOpen())
			session = sessionFactory.openSession();
		return session;
	}

	public void clearTestTable(String table) {
		String sql = "DELETE FROM " + table;
		Query query = getSession().createSQLQuery(sql);
		query.executeUpdate();
		Transaction tx = getSession().beginTransaction();
		tx.commit();
		closeSession();
	}

	public static void writeDb(JSONArray testData) {
		try {
			for (int i = 0; i < testData.length(); i++) {
				JSONObject json;
				json = testData.getJSONObject(i);
				String sql = TestUtil.jsonToSql(json);
				SQLQuery query = getSession().createSQLQuery(sql);
				query.executeUpdate();
			}
		} catch (JSONException e) {
			LOG.error("There was an error: " + e.getMessage());
		} catch (Exception e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		Transaction tx = getSession().beginTransaction();
		tx.commit();
		closeSession();
	}

	private static void closeSession() {
		if (session != null)
			session.close();
	}

	public static void setupDB(Catalogue catalogue) {
		List<String> sequences = new ArrayList<String>();
		switch (catalogue) {
		case JARJESTELMA:
			sequences.add("jarjestelma");
			sequences.add("jarjestelmahist");
			sequences.add("joinjarjestelmalinkkaus");
			sequences.add("joinjlinkhist");
			break;
		case PALVELU:
			sequences.add("palvelu");
			sequences.add("palveluhist");
			break;
		case LOOGINEN:
			sequences.add("looginentv");
			sequences.add("looginentvhist");
			sequences.add("joinlooginenfyysinen");
			sequences.add("joinloogfyyshistoria");
			break;
		case FYYSINEN:
			sequences.add("fyysinentv");
			sequences.add("fyysinentvhist");
			break;
		case PAATIETORYHMA:
			sequences.add("paatietoryhma");
			sequences.add("paatietoryhmahist");
			break;
		case TIETORYHMA:
			sequences.add("tietoryhma");
			sequences.add("tietoryhmahist");
			sequences.add("jointietorpaatietor");
			sequences.add("jtietorpaatietorhist");
			break;
		case TIETOLAJI:
			sequences.add("tietolaji");
			sequences.add("tietolajihist");
			sequences.add("jointietolajilooginen");
			sequences.add("jointietolooghistoria");
			sequences.add("jointietolajitietoryhma");
			sequences.add("jtietotietoryhmahist");
			break;
		case MOLEKYYLILINKKI:
			setupDB(Catalogue.TIETORYHMA);
			setupDB(Catalogue.PAATIETORYHMA);
			setupDB(Catalogue.TIETOLAJI);
			setupDB(Catalogue.FYYSINEN);
			setupDB(Catalogue.LOOGINEN);
			break;
		case TIETOARKKITEHTUURI:
            setupDB(Catalogue.PAATIETORYHMA);
            setupDB(Catalogue.TIETORYHMA);
			setupDB(Catalogue.TIETOLAJI);
			setupDB(Catalogue.LOOGINEN);
			setupDB(Catalogue.FYYSINEN);
			break;
		case HENKILO:
			setupDB(Catalogue.JARJESTELMA);
			sequences.add("henkilo");
			sequences.add("rooli");
			sequences.add("joinjarjhenkrooli");
			break;
		case SOVELLUS:
			sequences.add("sovellus");
			sequences.add("sovellus_hist");
			sequences.add("joinsovellushenkrooli");
			sequences.add("sovhenkroolihist");
			break;
		default:
			return;
		}
		Session session = getSession();
		for (String sequence : sequences) {
			session.createSQLQuery("drop sequence " + sequence + "_id_seq").executeUpdate();
			session.createSQLQuery("create sequence " + sequence + "_id_seq start with 1").executeUpdate();
			session.createSQLQuery("drop sequence " + sequence + "_seq").executeUpdate();
			session.createSQLQuery("create sequence " + sequence + "_seq start with 1").executeUpdate();
		}
	}

	public static void setupJoinTableDB(JoinCategory category) {
		String sequence;
		switch (category) {
		case LOOGINENFYYSINEN:
			sequence = "joinlooginenfyysinen";
			break;

		default:
			return;
		}
		Session session = getSession();
		session.createSQLQuery("drop sequence " + sequence + "_id_seq").executeUpdate();
		session.createSQLQuery("create sequence " + sequence + "_id_seq start with 1").executeUpdate();

	}

	public static void clearDB(Catalogue catalogue) {
		List<String> dbNames = new ArrayList<String>();
		switch (catalogue) {
		case JARJESTELMA:
			dbNames.add("tietojarjestelmasalkku");
			dbNames.add("tietojarjestelmasalkkuhistoria");
			dbNames.add("tietojarjestelma_kasite_arvo");
			dbNames.add("jarjestelmalinkkaus");
			dbNames.add("jarjestelmaLinkkaushistoria");
			break;
		case PALVELU:
			dbNames.add("palvelu");
			dbNames.add("palveluhistoria");
			dbNames.add("palvelu_kasite_arvo");
			break;
		case LOOGINEN:
			dbNames.add("looginentietovaranto");
			dbNames.add("looginentietovarantohistoria");
			dbNames.add("fyysinentietovaranto");
			dbNames.add("fyysinentietovarantohistoria");
			break;
		case FYYSINEN:
			dbNames.add("fyysinentietovaranto");
			dbNames.add("fyysinentietovarantohistoria");
			break;
		case PAATIETORYHMA:
			dbNames.add("paatietoryhma");
			dbNames.add("paatietoryhmahistoria");
			break;
		case TIETORYHMA:
			dbNames.add("tietoryhma");
			dbNames.add("tietoryhmahistoria");
			dbNames.add("paatietoryhma");
			dbNames.add("paatietoryhmahistoria");
			dbNames.add("tietoryhmapaatietoryhma");
			dbNames.add("tietoryhmapaatietohistoria");
			break;
		case TIETOLAJI:
			dbNames.add("tieto");
			dbNames.add("tietohistoria");
			dbNames.add("looginentietovaranto");
			dbNames.add("looginentietovarantohistoria");
			dbNames.add("tietoryhma");
			dbNames.add("tietoryhmahistoria");
			dbNames.add("tietolooginentietovaranto");
			dbNames.add("tietolooginenhistoria");
			dbNames.add("tietotietoryhma");
			dbNames.add("tietotietoryhmahistoria");
			break;
		case TIETOARKKITEHTUURI:
			clearDB(Catalogue.PAATIETORYHMA);
			clearDB(Catalogue.TIETORYHMA);
			clearDB(Catalogue.TIETOLAJI);
			clearDB(Catalogue.LOOGINEN);
			clearDB(Catalogue.FYYSINEN);
			break;
		case MOLEKYYLILINKKI:
			clearDB(Catalogue.TIETORYHMA);
			clearDB(Catalogue.PAATIETORYHMA);
			clearDB(Catalogue.TIETOLAJI);
			clearDB(Catalogue.LOOGINEN);
			clearDB(Catalogue.FYYSINEN);
			break;
		case HENKILO:
			dbNames.add("jarjestelma_henkilo_rooli");
			dbNames.add("jarjestelma_henkilo_rooli_hist");
			dbNames.add("henkilo");
			dbNames.add("henkilo_temp");
			dbNames.add("rooli");
			break;
		case SOVELLUS:
			dbNames.add("sovellus_henkilo_rooli_hist");
			dbNames.add("sovellus_henkilo_rooli");
			dbNames.add("rooli");
			dbNames.add("henkilo_temp");
			dbNames.add("henkilo");
			dbNames.add("sovellus_temp");
			dbNames.add("sovellus_history");
			dbNames.add("sovellus");
			break;
		default:
			return;
		}
		for (String dbName : dbNames) {
			SQLQuery query = getSession().createSQLQuery("delete from " + dbName);
			query.executeUpdate();
		}
		Transaction tx = getSession().beginTransaction();
		tx.commit();
		closeSession();
	}

	public static void clearJoinTableDB(JoinCategory category) {
		List<String> dbNames = new ArrayList<String>();
		switch (category) {
		case LOOGINENFYYSINEN:
			dbNames.add("looginentietovarantofyysinenti");
			dbNames.add("looginenfyysinenhistoria");
			break;
		default:
			return;
		}
		for (String dbName : dbNames) {
			SQLQuery query = getSession().createSQLQuery("delete from " + dbName);
			query.executeUpdate();
		}
		Transaction tx = getSession().beginTransaction();
		tx.commit();
		closeSession();
	}

	public static void close() {
		sessionFactory.close();
	}

	public static boolean isRowActiveInDb(Class<? extends Haettava> className, int id) {
		Session session = sessionFactory.openSession();
		Criteria crit = session.createCriteria(className);
		crit.add(Restrictions.eq("tunnus", id));
		crit.add(Restrictions.eq("aktiivinen", 1));
		@SuppressWarnings("unchecked")
		List<Haettava> result = crit.list();
		session.close();
		if (result.size() == 1)
			return true;
		return false;
	}

	public static boolean isRowInDb(Class<? extends Haettava> className, int id) {
		Session session = sessionFactory.openSession();
		Criteria crit = session.createCriteria(className);
		crit.add(Restrictions.eq("tunnus", id));
		@SuppressWarnings("unchecked")
		List<Haettava> result = crit.list();
		session.close();
		if (result.size() == 1)
			return true;
		return false;
	}

	public static boolean isRowInHistoryTableDb(Class<? extends HaettavaHistory> className, int id,
			HistoryType historyType) {
		Session session = sessionFactory.openSession();
		Criteria crit = session.createCriteria(className);
		crit.add(Restrictions.eq("tunnus", id));
		crit.add(Restrictions.eq("historiatyyppi", historyType));
		@SuppressWarnings("unchecked")
		List<HaettavaHistory> result = crit.list();
		session.close();
		if (result.size() == 1)
			return true;
		return false;
	}

	public static <T extends Haettava> List<T> getHaettavaRowsFromDb(Class<T> className) {
		Criteria criteria = sessionFactory.openSession().createCriteria(className);
		@SuppressWarnings("unchecked")
		List<T> list = criteria.list();
		Collections.sort(list, new KatalogiComparator());
		return list;
	}

	public static <T extends HaettavaHistory> List<T> getHaettavaHistoryRowsFromDb(Class<T> className) {
		Criteria criteria = sessionFactory.openSession().createCriteria(className);
		@SuppressWarnings("unchecked")
		List<T> list = criteria.list();
		Collections.sort(list, new Comparator<HaettavaHistory>() {

			@Override
			public int compare(HaettavaHistory o1, HaettavaHistory o2) {
				return o2.getRiviluotupvm().compareTo(o1.getRiviluotupvm());
			}
		});
		return list;
	}

	public static <T extends JoinTable> List<T> getJoinRowsFromDb(Class<T> className) {
		Criteria criteria = sessionFactory.openSession().createCriteria(className);
		@SuppressWarnings("unchecked")
		List<T> list = criteria.list();
		return list;
	}

	public static Haettava getJarjestelmaRowFromDb(Class<? extends Haettava> className, int originalRowId) {
		return (Haettava) sessionFactory.openSession().get(className, originalRowId);
	}

	public static void writeToDb(JSONArray jsonArr) {
		Session session = sessionFactory.openSession();
		try {
			for (int i = 0; i < jsonArr.length(); i++) {
				JSONObject json;
				json = jsonArr.getJSONObject(i);
				String sql = TestUtil.jsonToSql(json);
				SQLQuery query = session.createSQLQuery(sql);
				query.executeUpdate();
			}
		} catch (Exception e) {
			LOG.error("There was an error: " + e.getMessage());
		}
		Transaction tx = session.beginTransaction();
		tx.commit();
		session.close();
	}

	public static <T extends JoinHistory> List<T> getJoinHistoryRowsFromDb(Class<T> className) {
		Criteria criteria = sessionFactory.openSession().createCriteria(className);
		@SuppressWarnings("unchecked")
		List<T> list = criteria.list();
		Collections.sort(list, new HistoryComparator());
		return list;
	}

	public static BigDecimal getNextSequenceVal(String sequenceName) {
		Session session = sessionFactory.openSession();
		String sql = "select nextval('" + sequenceName +"')";
//		String sql = "select " + sequenceName + ".nextval from dual";

		try {
			Query query = session.createSQLQuery(sql);
			return (BigDecimal) query.uniqueResult();
		} catch(Exception e) {
			return new BigDecimal(42);
		}

	}

}
