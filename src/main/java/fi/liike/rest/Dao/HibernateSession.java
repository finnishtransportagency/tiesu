package fi.liike.rest.Dao;

import fi.liike.rest.util.HibernateUtil;
import org.hibernate.Session;

public class HibernateSession {
    private Session session;
    private String confPath;
    private boolean useDefault = true;

    public HibernateSession() {}

    protected Session getSession() {
        if (session == null || !session.isOpen() || !session.isConnected()) {
            session = HibernateUtil.getSessionFactory(confPath, useDefault).openSession();
        }
        return session;
    }

    //TODO is closing after every transaction commit okay?
    protected void closeSession() {
        if (session != null || session.isOpen()) {
            getSession().close();
        }
    }
}
