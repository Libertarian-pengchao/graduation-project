package cn.pcbs.ocarinamanage.dao;

import java.util.List;

import cn.pcbs.ocarinamanage.model.Permission;

public class PermissionDaoImpl extends BaseDaoImpl<Permission> implements PermissionDao{

	@Override
	public List<Permission> getAllPermissions() {
		String hql = "from Permissoin";
		return super.list(hql, null, null);
	}

}
