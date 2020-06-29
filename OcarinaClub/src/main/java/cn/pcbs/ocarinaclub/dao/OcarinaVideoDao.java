package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.OcarinaVideo;

public interface OcarinaVideoDao extends BaseDao{
	
	public List<OcarinaVideo> getAllOcarinaVideo();
	
	public List<OcarinaVideo> getOcarinaVideoByauthorName(@Param("authorName")String authorName);
	
	
}
