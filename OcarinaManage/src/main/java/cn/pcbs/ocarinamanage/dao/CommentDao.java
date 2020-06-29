package cn.pcbs.ocarinamanage.dao;

import cn.pcbs.ocarinamanage.model.Comment;

public interface CommentDao extends BaseDao<Comment>{
	/**
	 * 根据帖子ID删除评论
	 * @param ids
	 */
	public void deleteComments(int ids[]);
}
