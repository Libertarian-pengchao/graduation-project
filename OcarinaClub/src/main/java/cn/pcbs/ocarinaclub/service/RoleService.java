package cn.pcbs.ocarinaclub.service;

import java.util.List;

import cn.pcbs.ocarinaclub.model.Role;

public interface RoleService extends BaseService<Role>{
	public List<Role> getAllRoles();
}
