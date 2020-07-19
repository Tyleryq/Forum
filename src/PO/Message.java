package PO;
/**
 * @author Yang Qun
 *
 */

import java.util.Calendar;

public class Message {
	private int id;
	private int postid;
	private String mail;
	private String message;
	private Calendar sendTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Calendar getSendTime() {
		return sendTime;
	}
	public void setSendTime(Calendar sendTime) {
		this.sendTime = sendTime;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
