package cn.pcbs.ocarinamanage.dao;

import java.util.List;

import cn.pcbs.ocarinamanage.model.Permission;

public interface PermissionDao extends BaseDao<Permission>{
	public List<Permission> getAllPermissions();
}
