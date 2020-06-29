package cn.pcbs.ocarinamanage.service;

import java.util.List;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Post;

public interface PostService extends BaseService<Post>{
	public Pager<Post> getAllPagerPost(Post post);
	
	public void deletePost(int[] ids);
}
