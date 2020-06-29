package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.MyVidieo;

public interface MyVidieoService extends BaseService<MyVidieo>{
	public List<MyVidieo> getAllMyVideos(int id);
	
	/**
	 * 根据ID删除
	 * @param id
	 */
	public void deleteById(@Param("id") int id);
	
	/**
	 * 根据ID删除中间表记录
	 * @param id
	 */
	public void deleteMiddleTable(@Param("id") int id);
	
	/**
	 * 上传视频
	 * @param myVideo
	 */
	public void uploadMyVideo(MyVidieo myVideo);
	
	/**
	 * 上传视频更新中间表
	 * @param myVideo
	 */
	public void updateMiddleTable(@Param("uid")int uid,@Param("vid")int vid);
}
