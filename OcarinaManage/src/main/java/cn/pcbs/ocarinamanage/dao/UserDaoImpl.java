package cn.pcbs.ocarinamanage.dao;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Override
	public User getUserByUsername(String username) {
		String hql = "from User u where u.userName = ?";
		Session session = getSession();
		Query<User> query = session.createQuery(hql);
		query.setParameter(0, username);
		return query.uniqueResult();
	}

	@Override
	public Pager<User> getAllPagerUsers(User user) {
		String hql = "from User u where 1=1";
		if(user.getUserName() != null && !"".equals(user.getUserName()))
				hql += " and u.userName like '%"+user.getUserName()+"%'";
		return super.find(hql, null, null);
	}

}
