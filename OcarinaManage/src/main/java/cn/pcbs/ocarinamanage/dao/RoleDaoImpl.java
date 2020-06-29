package cn.pcbs.ocarinamanage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{

	@Override
	public List<Role> getAllRoles() {
		String hql = "from Role ";
		return super.list(hql, null, null);
	}

}
