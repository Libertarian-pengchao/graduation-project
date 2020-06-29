package cn.pcbs.ocarinaclub.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Role implements Serializable{
	
	/**
	 * 角色ID
	 */
	private int id;
	
	/**
	 * 角色名：超级管理员admin、普通管理员（授权）adminuser、普通用户user
	 */
	private	String rname;
	
	/**
	 * 角色编码：admin、adminuser、user
	 */
	private String code;
	
	/**
	 * 角色对应的权限
	 */
	private Set<Permission> permissions = new HashSet<>();
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Set<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}
	@Override
	public String toString() {
		return "Role [id=" + id + ", rname=" + rname + ", code=" + code + ", permissions=" + permissions + "]";
	}
	
	
}
