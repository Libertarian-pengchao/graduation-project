package cn.pcbs.ocarinaclub.service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.UserRoleDao;
import cn.pcbs.ocarinaclub.model.User;

@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService{

	@Autowired
	private UserRoleDao userRoleDao;
	
	@Override
	public void addUserRole(int uid, int rid) {
		userRoleDao.addUserRole(uid, rid);
	}

}
