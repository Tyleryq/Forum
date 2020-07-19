package services;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import com.opensymphony.xwork2.ActionContext;

import DAO.MessageDAO;
import PO.Message;

/**
 * @author Yang Qun
 *
 */
public class SendAction {
	private String message;
	private String mail;
	private int postid;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public void execute() {
		MessageDAO messageDAO = new MessageDAO();
		Message message = new Message();
		message.setPostid(postid);
		message.setMessage(this.message);
		message.setMail(mail);
		messageDAO.addMessage(message);
		HttpServletResponse response=(HttpServletResponse) ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_RESPONSE);
		try {
			response.sendRedirect("jie_detail?postid="+postid);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
