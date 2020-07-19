package services;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import DAO.PostDAO;
import DAO.UserDAO;
import PO.Post;
import PO.User;

/**
 * @author Yang Qun
 *
 */
public class JieDetailAction {
	private int postid;
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String execute() {
//		System.out.println("postid:"+postid);
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.findPostById(postid);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		Calendar calendar = post.getTime();
		post.setYear(calendar.get(Calendar.YEAR));
		post.setMonth(calendar.get(Calendar.MONTH)+1);
		post.setDate(calendar.get(Calendar.DATE));
		session.setAttribute("post", post);
		UserDAO userDAO = new UserDAO();
		User author = userDAO.findUserByMail(post.getMail());
		session.setAttribute("author", author);
		return "su";
	}
}
