package cn.pcbs.ocarinamanage.service;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.User;

public interface UserService extends BaseService<User>{
	/**
	 * 根据用户名查去数据
	 */
	public User getUserByUsername(String username);
	
	public Pager<User> getAllPagerUsers(User user);
	
	public void updateUser(User user);
	
	public void userForbidden(int[] ids);
	
	public void userStart(int[] ids);
	
	public void userDelete(int[] ids);
}
