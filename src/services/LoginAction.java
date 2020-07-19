package services;
/**
 * @author Yang Qun
 *
 */

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import DAO.UserDAO;
import PO.User;
import common.MD5_Test;

public class LoginAction {
	private User user;
	private String checkcode;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public String execute() {
		//System.out.println(user.getMail());
//		Configuration cfg = new Configuration();
//		cfg.configure();
//		SessionFactory sessionFactory=cfg.buildSessionFactory();
//		Session session=null;
//		session=sessionFactory.openSession();
//		String hql="select pwd from User where mail=:umail";
//		Query query=session.createQuery(hql);
		String dbPwd="";
		User duser = null;
		if(user!=null) {
//			Session session = HibernateUtil.getSession();
//			duser = session.get(User.class, user.getMail());
//			HibernateUtil.closeSession();
			UserDAO userDAO = new UserDAO();
			duser = userDAO.findUserByMail(user.getMail());
			if(duser!=null)
				dbPwd=(String) duser.getPwd();
			else 
				return "fa";
		}
//			query.setParameter("umail", user.getMail());
		
//		if(session!=null)	session.close();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession httpsession=request.getSession();
		String dcheck = (String) httpsession.getAttribute("checkcode");
		if(checkcode!=null&&checkcode.equals(dcheck)) {
			if (dbPwd!=null) {
				String upwd = MD5_Test.MD5(user.getPwd());
				if(dbPwd.equals(upwd)) {
					httpsession.setAttribute("duser", duser);
					return "su";
				} else {
					System.out.println("密码错误:"+user.getPwd());
				}
			} else {
				System.out.println("该用户不存在!");
			}
		}else {
			System.out.println("验证码不正确!");
		}
		HttpServletResponse response=(HttpServletResponse) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		try {
			//System.out.println("sendre");
			response.sendRedirect(request.getContextPath()+"/fly/html/user/login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println("ret su");
		return "fa";
	}
}
