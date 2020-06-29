package cn.pcbs.ocarinaclub.dao;

import java.util.LinkedList;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.Comment;

public interface CommentDao extends BaseDao{
	
	/**
	 * 根据帖子Id查询帖子评论
	 */
	public LinkedList<Comment> getAllCommentByPid(@Param("pid")int pid);
	
	public void insertComment(Comment comment);
}
