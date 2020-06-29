package cn.pcbs.ocarinamanage.service;

import cn.pcbs.ocarinamanage.model.Comment;

public interface CommentService extends BaseService<Comment> {
	/**
	 * 根据帖子ID删除评论
	 * @param ids
	 */
	public void deleteComments(int ids[]);
}
