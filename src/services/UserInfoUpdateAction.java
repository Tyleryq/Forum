package services;
/**
 * @author Yang Qun
 *
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import DAO.UserDAO;
import PO.User;
import common.MD5_Test;

public class UserInfoUpdateAction {
	private User user;
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpSession session=request.getSession();
	private User duser = (User) session.getAttribute("duser");
	private UserDAO userDAO = new UserDAO();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String execute() {
		duser.setName(user.getName());
		duser.setSex(user.getSex());
		duser.setCity(user.getCity());
		duser.setSign(user.getSign());
		userDAO.updateUser(duser);
		return "su";
	}
	
	public String updatePwd() {
		String pwd = MD5_Test.MD5(user.getPwd());
		duser.setPwd(pwd);
		userDAO.updateUser(duser);
		return "su";
	}
	
}
