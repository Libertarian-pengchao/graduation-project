package cn.pcbs.ocarinaclub.service;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.CommentDao;
import cn.pcbs.ocarinaclub.model.Comment;

@Service("commentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService{
	
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public BaseDao getBaseDao() {
		return commentDao;
	}

	@Override
	public  LinkedList<Comment> getAllCommentByPid(int pid) {	
		return commentDao.getAllCommentByPid(pid);
	}

	@Override
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);	
	}

}
