package cn.pcbs.ocarinamanage.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Comment;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao{

	@Override
	public void deleteComments(int[] ids) {
		Session session = getSession();
		Query< Comment> query = null;
		for(int id : ids) {
			String hql = "delete Comment c where c.postId =" + id;
			query = session.createQuery(hql);
			query.executeUpdate();
		}	
	}

}
