package cn.pcbs.ocarinaclub.model;

public class Phone {
	/**
	 * 旧手机号
	 */
	private String oldphone;
	
	/**
	 * 新手机号
	 */
	private String newphone;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	private String phoneNumber;
	
	public String getOldphone() {
		return oldphone;
	}
	public void setOldphone(String oldphone) {
		this.oldphone = oldphone;
	}
	public String getNewphone() {
		return newphone;
	}
	public void setNewphone(String newphone) {
		this.newphone = newphone;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "Phone [oldphone=" + oldphone + ", newphone=" + newphone + ", userName=" + userName + ", phoneNumber="
				+ phoneNumber + "]";
	}
	
}
