package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.RoleDao;
import cn.pcbs.ocarinaclub.model.Role;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService{

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public BaseDao getBaseDao() {
		return roleDao;
	}

	@Override
	public List<Role> getAllRoles() {
		return roleDao.getAllRoles();
	}

}
