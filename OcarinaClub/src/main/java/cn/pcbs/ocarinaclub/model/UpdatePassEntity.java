package cn.pcbs.ocarinaclub.model;

public class UpdatePassEntity {
	private int id;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 旧密码
	 */
	private String oldpass;
	
	/**
	 * 新密码
	 */
	private String password;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOldpass() {
		return oldpass;
	}
	public void setOldpass(String oldpass) {
		this.oldpass = oldpass;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "UpdatePassEntity [id=" + id + ", userName=" + userName + ", oldpass=" + oldpass + ", password="
				+ password + "]";
	}
	
	
}
