package cn.pcbs.ocarinamanage.dao;

import java.util.List;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Post;

public interface PostDao extends BaseDao<Post>{
	public Pager<Post> getAllPagerPost(Post post);
	
	public void deletePost(int[] ids);
}
