package cn.pcbs.ocarinamanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinamanage.dao.PostDao;
import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Post;

@Service("postService")
public class PostServiceImpl extends BaseServiceImpl<Post> implements PostService {

	@Autowired
	private PostDao postDao;
	@Override
	public Pager<Post> getAllPagerPost(Post post) {
		return postDao.getAllPagerPost(post);
	}
	@Override
	public void deletePost(int[] ids) {
		postDao.deletePost(ids);
	}
	
}
