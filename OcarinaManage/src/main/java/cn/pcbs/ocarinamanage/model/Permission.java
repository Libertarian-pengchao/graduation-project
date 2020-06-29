package cn.pcbs.ocarinamanage.model;

import java.io.Serializable;

public class Permission implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 权限ID
	 */
	private int id;
	
	/**
	 * 权限名：使用shiro即是anon这种shiro权限
	 */
	private String pname;
	
	/**
	 * 权限对应的可访问URL资源地址
	 */
	private String url;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Permission [id=" + id + ", pname=" + pname + ", url=" + url + "]";
	}
	
}
