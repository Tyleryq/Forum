package PO;
/**
 * @author Yang Qun
 *
 */

import java.io.Serializable;
import java.util.Calendar;

public class Collection implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String mail;
	Calendar collectTime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public Calendar getCollectTime() {
		return collectTime;
	}
	public void setCollectTime(Calendar collectTime) {
		this.collectTime = collectTime;
	}
}
