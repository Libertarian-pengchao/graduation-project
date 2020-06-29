package cn.pcbs.ocarinamanage.dao;

import java.util.List;
import java.util.Map;

import cn.pcbs.ocarinamanage.model.Role;

public interface RoleDao extends BaseDao<Role> {
	public List<Role> getAllRoles();
}
