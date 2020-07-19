package DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import PO.Post;

/**
 * @author Yang Qun
 *
 */
public class PostDAO implements IPostDAO {

	@Override
	public void addPost(Post post) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.save(post);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void removePost(Post post) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.delete(post);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public void updatePost(Post post) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction transaction = null;
		session = HibernateUtil.getSession();
		transaction = session.beginTransaction();
		session.update(post);
		transaction.commit();
		HibernateUtil.closeSession();
	}

	@Override
	public Post findPostById(int id) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Post post= session.get(Post.class, id);
		HibernateUtil.closeSession();
		return post;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Post> findAllPost() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		Query query = session.createQuery("from Post");
		List<Post> posts = query.list();
		HibernateUtil.closeSession();
		return posts;
	}

	@Override
	public int getNumByMail(String mail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String hql = "select count(*) from Post where mail=:umail";
		Query query = session.createQuery(hql);
		query.setParameter("umail", mail);
		int num = (int) query.uniqueResult();
		HibernateUtil.closeSession();
		return num;
	}

	@Override
	public List<Post> findPostByMail(String mail) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSession();
		String hql = "select p from Post p where p.mail=:umail";
		Query query = session.createQuery(hql);
		query.setParameter("umail", mail);
		@SuppressWarnings("unchecked")
		List<Post> posts = query.list();
		return posts;
	}
}
