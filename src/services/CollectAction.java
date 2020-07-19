package services;

import java.util.Calendar;

import DAO.CollectionDAO;
import PO.Collection;

/**
 * @author Yang Qun
 *
 */
public class CollectAction {
	private int id;
	private String mail;
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
	public String execute() {
		Calendar calendar = Calendar.getInstance();
		Collection collection = new Collection();
		collection.setId(id);
		collection.setMail(mail);
		collection.setCollectTime(calendar);
		CollectionDAO collectionDAO = new CollectionDAO();
		collectionDAO.addCollection(collection);
		return "su";
	}
}
