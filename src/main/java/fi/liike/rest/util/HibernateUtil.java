package fi.liike.rest.util;

import java.io.File;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


	
public class HibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	private static SessionFactory buildSessionFactory(String path, boolean useDefault) {
		try {
			if (!useDefault){
				Configuration c = new Configuration();
				File f = new File(path);
				sessionFactory = c.configure(f).buildSessionFactory();
			} else{
				sessionFactory = new Configuration().configure().buildSessionFactory();
			}
			// Create the SessionFactory from hibernate.cfg.xml			
			//return new AnnotationConfiguration().configure().buildSessionFactory();
			//return new Configuration().configure().buildSessionFactory();
			//sessionFactory = c.configure(f).buildSessionFactory();
			return sessionFactory;
		} catch (Throwable ex) {
			// Make sure you log the exception, as it might be swallowed
			System.err.println("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
	}
 
	public static SessionFactory getSessionFactory(String path, boolean useDefault) {
		if (sessionFactory == null){
			sessionFactory = buildSessionFactory(path, useDefault);
		}
		return sessionFactory;
	}
 
	public static void shutdown() {
		// Close caches and connection pools
		if(sessionFactory != null){
			sessionFactory.close();
		}
	}
}
