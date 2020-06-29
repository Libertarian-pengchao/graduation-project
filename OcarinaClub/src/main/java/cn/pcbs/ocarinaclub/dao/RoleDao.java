package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import cn.pcbs.ocarinaclub.model.Role;

public interface RoleDao extends BaseDao{
	public List<Role> getAllRoles();
}
