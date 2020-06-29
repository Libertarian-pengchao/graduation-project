package cn.pcbs.ocarinaclub.service;

import java.util.LinkedList;
import java.util.List;


import cn.pcbs.ocarinaclub.model.Comment;

public interface CommentService extends BaseService<Comment>{

	/**
	 * 根据帖子Id查询帖子评论
	 */
	public  LinkedList<Comment> getAllCommentByPid(int pid);
	
	public void insertComment(Comment comment);
}
