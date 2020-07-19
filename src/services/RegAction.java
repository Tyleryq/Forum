package services;
/**
 * @author Yang Qun
 *
 */

import DAO.UserDAO;
import PO.User;
import common.MD5_Test;

public class RegAction {
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String execute() {
//		Configuration cfg = new Configuration();
//		cfg.configure();
//		SessionFactory sessionFactory=cfg.buildSessionFactory();
//		Session session=null;
//		Transaction tx=null;
		
		user.setPwd(MD5_Test.MD5(user.getPwd()));
		UserDAO userDAO = new UserDAO();
		userDAO.addUser(user);
		
		//System.out.println(user.getMail());
//		try {
//			session=sessionFactory.openSession();
//			tx=session.beginTransaction();
//			session.save(user);
//			tx.commit();
//		} catch (Exception e) {
//			// TODO: handle exception
//			if(tx!=null) {
//				tx.rollback();
//				e.printStackTrace();
//				return "fa";
//			}
//		} finally {
//			// TODO: handle finally clause
//			if(session!=null)	session.close();
//			
//		}
//		HttpServletResponse response=(HttpServletResponse) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
//		try {
//			//System.out.println("sendre");
//			response.sendRedirect("//fly/html/user/login.jsp");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println("ret su");
		return "su";
	}
}
