package cn.pcbs.ocarinamanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinamanage.dao.CommentDao;
import cn.pcbs.ocarinamanage.model.Comment;

@Service("commentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService{
	
	@Autowired
	private CommentDao commentDao;
	@Override
	public void deleteComments(int[] ids) {
		commentDao.deleteComments(ids);
	}

}
