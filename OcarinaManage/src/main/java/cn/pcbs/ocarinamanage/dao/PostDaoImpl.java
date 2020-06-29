package cn.pcbs.ocarinamanage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Post;

@Repository("postDao")
public class PostDaoImpl extends BaseDaoImpl<Post> implements PostDao{
	
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public Pager<Post> getAllPagerPost(Post post) {		
		String hql = "from Post p where 1=1";
		if(post.getPostName() != null && !"".equals(post.getPostName()))
				hql += " and p.postName like '%"+post.getPostName()+"%'";
		return super.find(hql, null, null);
	}

	@Override
	public void deletePost(int[] ids) {
		for(int id : ids) {
			super.delete(id);
		}
	}

}
