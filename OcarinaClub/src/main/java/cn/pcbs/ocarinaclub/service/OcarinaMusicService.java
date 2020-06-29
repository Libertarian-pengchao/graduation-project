package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.OcarinaMusic;

public interface OcarinaMusicService extends BaseService<OcarinaMusic>{
	/**
	 * 根据音乐家获取音乐
	 * @return
	 */
	public List<OcarinaMusic> getMusicByMusician(String musicianName);
	
	public List<OcarinaMusic> getAllMusic();
}
