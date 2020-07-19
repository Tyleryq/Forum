package DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import PO.User;

/**
 * @author Yang Qun
 *
 */
public class UserDAO implements IUserDAO {

	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.save(user);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void removeUser(User user) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.delete(user);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.update(user);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public User findUserByMail(String mail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		User user= session.get(User.class, mail);
		HibernateUtil.closeSession();
		return user;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAllUser() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Query query = session.createQuery("from User");
		HibernateUtil.closeSession();
		return query.list();
	}

}
