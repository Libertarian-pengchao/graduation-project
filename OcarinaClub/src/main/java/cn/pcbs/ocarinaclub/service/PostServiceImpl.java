package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.PostDao;
import cn.pcbs.ocarinaclub.model.Post;

@Service("postService")
public class PostServiceImpl extends BaseServiceImpl<Post> implements PostService{

	@Autowired
	private PostDao postDao;
	
	@Override
	public BaseDao getBaseDao() {
		return postDao;
	}

	@Override
	public List<Post> getAllPost() {
		return postDao.getAllPost();
	}

	@Override
	public List<Post> getPostByType(int type) {
		return postDao.getPostByType(type);
	}

	@Override
	public List<Post> getPostByName(String name) {
		name = "%" +name + "%"; 
		return postDao.getPostByName(name);
	}

	@Override
	public void publishPost(Post post) {
		postDao.publishPost(post);
	}

	@Override
	public Post getPostById(Integer id) {
		return postDao.getPostById(id);
	}

}
