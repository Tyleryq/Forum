package DAO;

import java.util.List;

import PO.Post;

/**
 * @author Yang Qun
 *
 */
public interface IPostDAO {
	public void addPost(Post post);
	public void removePost(Post post);
	public void updatePost(Post post);
	public Post findPostById(int id);
	public int getNumByMail(String mail);
	public List<Post> findAllPost();
	public List<Post> findPostByMail(String mail);
}
