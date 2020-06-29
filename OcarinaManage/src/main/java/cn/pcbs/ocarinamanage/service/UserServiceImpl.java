package cn.pcbs.ocarinamanage.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinamanage.dao.RoleDao;
import cn.pcbs.ocarinamanage.dao.UserDao;
import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.Role;
import cn.pcbs.ocarinamanage.model.User;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	@Override
	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	@Override
	public Pager<User> getAllPagerUsers(User user) {
		return userDao.getAllPagerUsers(user);
	}

	@Override
	public void updateUser(User user) {
		int id = user.getId();
		User userDB = userDao.load(id);
		Set<Role> roles = new HashSet<>();
		Role role = null;
		for(Role re : user.getRoles()) {
			role = roleDao.load(re.getId());
			roles.add(role);
		}
		userDB.setRoles(roles);
		userDao.update(userDB);
	}

	@Override
	public void userForbidden(int[] ids) {
		User user = null;
		for(int id : ids) {
			user = userDao.load(id);
			user.setState(0);
			userDao.update(user);
		}	
	}

	@Override
	public void userStart(int[] ids) {
		User user = null;
		for(int id : ids) {
			user = userDao.load(id);
			user.setState(1);
			userDao.update(user);
		}	
		
	}

	@Override
	public void userDelete(int[] ids) {
		for(int id : ids) {
			userDao.delete(id);
		}	
	}

}
