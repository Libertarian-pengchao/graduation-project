package cn.pcbs.ocarinaclub.model;

public class LoginEntity {
	private String userName;
	private String password;
	private String phoneNumber;
	private String code;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "LoginEntity [userName=" + userName + ", password=" + password + ", phoneNumber=" + phoneNumber
				+ ", code=" + code + "]";
	}
	
	
}
