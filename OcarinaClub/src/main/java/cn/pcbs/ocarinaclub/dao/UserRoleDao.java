package cn.pcbs.ocarinaclub.dao;

import org.apache.ibatis.annotations.Param;

public interface UserRoleDao {
	public void addUserRole(@Param("uid") int uid,@Param("rid") int rid);
}
