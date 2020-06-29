package cn.pcbs.ocarinaclub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.UserDao;
import cn.pcbs.ocarinaclub.model.User;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Override
	public BaseDao getBaseDao() {		
		return userDao;
	}
	@Override
	public void addUser(User user,int id) {
		userDao.addUser(user);	
		userRoleService.addUserRole(user.getId(), id);
	}
	@Override
	public User getUserByUserName(String userName) {
		return userDao.getUserByUserName(userName);
	}
	@Override
	public void updateUserMessage(User user) {
		userDao.updateUserMessage(user);
	}
	@Override
	public void updateUserImg(User user) {
		userDao.updateUserImg(user);
	}
	@Override
	public void updatePassword(User user) {
		userDao.updatePassword(user);
	}
	@Override
	public void updatePhone(User user) {
		userDao.updatePhone(user);
	}

}
