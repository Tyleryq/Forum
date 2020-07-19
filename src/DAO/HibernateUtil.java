package DAO;
/**
 * @author Yang Qun
 *
 */

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	private static Session session;
	private HibernateUtil() {
		// TODO Auto-generated constructor stub
	}
	static {
		Configuration cfg = new Configuration();
		cfg.configure();
		sessionFactory = cfg.buildSessionFactory();
	}
	
	public static Session getSession() {
		session = sessionFactory.openSession();
		return session;
	}
	
	public static void closeSession() {
		if (session!=null) {
			session.close();
		}
	}
}
