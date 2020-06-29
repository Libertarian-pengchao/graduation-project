package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.Post;

public interface PostDao extends BaseDao{
	
	public List<Post> getAllPost();
	
	/**
	 * 帖子的类型：1-技术帖 2-提问帖 3-主题帖
	 */
	public List<Post> getPostByType(@Param("type")int type);
	
	/**
	 * 模糊查询，根据名字查询帖子
	 */
	public List<Post> getPostByName(@Param("name")String name);
	
	/**
	 * 发表新帖
	 * @param post
	 */
	public void publishPost(Post post);
	
	public Post getPostById(@Param("id")Integer id);
}
