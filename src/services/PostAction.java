package services;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import DAO.PostDAO;
import PO.Post;
import PO.User;

/**
 * @author Yang Qun
 *
 */
public class PostAction {
	private Post post;
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	public String execute() throws IOException {
		Calendar calendar = Calendar.getInstance();
		post.setTime(calendar);
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		HttpServletResponse response=ServletActionContext.getResponse();
		User user = null;
		user = (User) session.getAttribute("duser");
		post.setMail(user.getMail());
		PostDAO postDAO = new PostDAO();
		postDAO.addPost(post);
		return "su";
	}
}
