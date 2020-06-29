package cn.pcbs.ocarinamanage.dao;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.User;

public interface UserDao extends BaseDao<User>{
	/**
	 * 根据用户名查去数据
	 */
	public User getUserByUsername(String username);
	
	public Pager<User> getAllPagerUsers(User user);
}
