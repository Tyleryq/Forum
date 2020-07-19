package services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import DAO.UserDAO;
import PO.User;

/**
 * @author Yang Qun
 *
 */
public class AuthorHomeAction {
	private String mail;
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAO();
		User user = userDAO.findUserByMail(mail);
		session.setAttribute("author", user);
		return "su";
	}
}
