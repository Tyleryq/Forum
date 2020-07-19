package services;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

/**
 * @author Yang Qun
 *
 */
public class LogOutAction {

	public String execute() {
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		session.removeAttribute("duser");
		return "su";
	}
}
