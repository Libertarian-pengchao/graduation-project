package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.MyVidieo;

public interface MyVidieoDao extends BaseDao{
	public List<MyVidieo> getAllMyVideos(@Param("id")int id);
	
	public void deleteById(@Param("id") int id);
	
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
