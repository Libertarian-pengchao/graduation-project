package cn.pcbs.ocarinaclub.service;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.User;

public interface UserService extends BaseService<User>{
	public void addUser(User user,int id);
	
	public User getUserByUserName(String userName);
	
	public void updateUserMessage(User user);
	
	public void updateUserImg(User user);
	
	/**
	 * 找回密码
	 * @param user
	 */
	public void updatePassword(User user);
	
	/**
	 * 修改手机号
	 */
	public void updatePhone(User user);
}
