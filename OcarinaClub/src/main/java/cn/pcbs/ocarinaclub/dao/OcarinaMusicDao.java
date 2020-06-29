package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.OcarinaMusic;

public interface OcarinaMusicDao extends BaseDao{
	
	/**
	 * 根据音乐家获取音乐
	 * @return
	 */
	public List<OcarinaMusic> getMusicByMusician(@Param("musicianName")String musicianName);
	
	public List<OcarinaMusic> getAllMusic();
}
