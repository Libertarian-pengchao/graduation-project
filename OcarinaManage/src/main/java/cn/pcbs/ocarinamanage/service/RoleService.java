package cn.pcbs.ocarinamanage.service;

import java.util.List;

import cn.pcbs.ocarinamanage.model.Role;

public interface RoleService extends BaseService<Role>{
	public List<Role> getAllRoles();
}
