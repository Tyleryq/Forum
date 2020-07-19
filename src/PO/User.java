package PO;

import java.util.HashSet;
import java.util.Set;

/**
 *@author Yang Qun 
 * 
 */
public class User {
	private String name;
	private String pwd;
	private String sex;
	private String city;
	private String mail;
	private int VIPRank;		//VIP等级
	private int credit;		//签到积分
	private String sign;	//个人签名 	
	private Set<Post> posts=new HashSet<Post>();
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getVIPRank() {
		return VIPRank;
	}
	public void setVIPRank(short vIPRank) {
		VIPRank = vIPRank;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public Set<Post> getPosts() {
		return posts;
	}
	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}
	public void setVIPRank(int vIPRank) {
		VIPRank = vIPRank;
	}

	
}
