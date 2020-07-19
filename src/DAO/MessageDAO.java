package DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import PO.Message;

/**
 * @author Yang Qun
 *
 */
public class MessageDAO {
	public void addMessage(Message message) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.save(message);
		transaction.commit();
		HibernateUtil.closeSession();
		
	}
	
	public List<Message> findMessagesByPostid(int postid) {
		Session session = HibernateUtil.getSession();
		String hql = "select m from Message m where m.postid=:upostid";
		Query query = session.createQuery(hql);
		query.setParameter("upostid", postid);
		@SuppressWarnings("unchecked")
		List<Message> messages = query.list();
		return messages;
	}
}
