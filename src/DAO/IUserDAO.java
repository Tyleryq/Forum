package DAO;

import java.util.List;

import PO.User;

/**
 * @author Yang Qun
 *
 */
public interface IUserDAO {
	public void addUser(User User);
	public void removeUser(User User);
	public void updateUser(User User);
	public User findUserByMail(String mail);
	public List<User> findAllUser();
}
