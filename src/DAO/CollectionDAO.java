package DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import PO.Collection;

/**
 * @author Yang Qun
 *
 */
public class CollectionDAO {
	public void addCollection(Collection collection) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.save(collection);
		transaction.commit();
		HibernateUtil.closeSession();
	}
	
	public int getNumByMail(String mail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String hql = "select count(*) from Collection where mail=:umail";
		Query query = session.createQuery(hql);
		query.setParameter("umail", mail);
		int num = (int) query.uniqueResult();
		HibernateUtil.closeSession();
		return num;
	}
	
	public List<Collection> findPostByMail(String mail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String hql = "select p from Collection p where p.mail=:umail";
		Query query = session.createQuery(hql);
		query.setParameter("umail", mail);
		@SuppressWarnings("unchecked")
		List<Collection> collections = query.list();
		HibernateUtil.closeSession();
		return collections;
	}
	
	
	
}
