package cn.pcbs.ocarinaclub.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class User implements Serializable{
	/**
	 * 用户ID
	 */
	private Integer id;
	
	/**
	 * 用户名
	 */
	private String userName;
	
	/**
	 * 用户密码
	 */
	private String password;
	
	/**
	 * 用户性别
	 */
	private String sex;
	
	/**
	 * 用户状态
	 */
	private Integer state;
	
	/**
	 * 用户头像
	 */
	private String img;
	
	/**
	 * 个性签名
	 */
	private String personalsign;
	
	/**
	 * 用户电话号码，可用于找回密码、修改密码
	 */
	private String phoneNumber;
	
	/**
	 * 用户注册日期
	 */
	@JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regeDate;
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPersonalsign() {
		return personalsign;
	}

	public void setPersonalsign(String personalsign) {
		this.personalsign = personalsign;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public Date getRegeDate() {
		return regeDate;
	}

	public void setRegeDate(Date regeDate) {
		this.regeDate = regeDate;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", sex=" + sex + ", state="
				+ state + ", img=" + img + ", personalsign=" + personalsign + ", phoneNumber=" + phoneNumber
				+ ", regeDate=" + regeDate + "]";
	}

	
	
}
