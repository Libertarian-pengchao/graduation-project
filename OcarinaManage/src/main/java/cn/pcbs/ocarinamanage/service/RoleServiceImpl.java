package cn.pcbs.ocarinamanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinamanage.dao.RoleDao;
import cn.pcbs.ocarinamanage.model.Role;

@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService{

	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> getAllRoles() {
		return roleDao.getAllRoles();
	}

}
