package services;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import DAO.CollectionDAO;
import DAO.PostDAO;
import PO.Collection;
import PO.Post;
import PO.User;

/**
 * @author Yang Qun
 *
 */
public class UserIndexAction {
	private List<Post> posts;
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public String execute() {
		PostDAO postDAO = new PostDAO();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		User user = (User) session.getAttribute("duser");
		if (user!=null) {
//			System.out.println(user.getMail());
			posts = postDAO.findPostByMail(user.getMail());
			int postNum = posts.size();
			session.setAttribute("upostNum", postNum);
			session.setAttribute("uposts", posts);
			CollectionDAO collectionDAO = new CollectionDAO();
			List<Collection> collections = collectionDAO.findPostByMail(user.getMail());
			int collecNum = collections.size();
			session.setAttribute("ucollecNum", collecNum);
			session.setAttribute("ucollections", collections);
			for(Post post:posts) {
				post.setYear(post.getTime().get(Calendar.YEAR));
				post.setMonth(post.getTime().get(Calendar.MONTH));
				post.setDate(post.getTime().get(Calendar.DAY_OF_MONTH));
				post.setHour(post.getTime().get(Calendar.HOUR_OF_DAY));
				post.setMinute(post.getTime().get(Calendar.MINUTE));
				post.setSecond(post.getTime().get(Calendar.SECOND));
			}
//			for (int i = 0; i < posts.size(); i++) {
//				posts.get(i).setYear(year);
//			}
//			System.out.println(posts.get(0).getTime().get(Calendar.YEAR));
			return "su";
		} else {
			System.out.println("user is null");
			return "fa";
		}
	}
}
