package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.OcarinaMusicDao;
import cn.pcbs.ocarinaclub.model.OcarinaMusic;

@Service("ocarinaMusicService")
public class OcarinaMusicServiceImpl extends BaseServiceImpl<OcarinaMusic> implements OcarinaMusicService{

	@Autowired
	private OcarinaMusicDao ocarinaMusicDao;
	
	@Override
	public BaseDao getBaseDao() {
		return ocarinaMusicDao;
	}

	@Override
	public List<OcarinaMusic> getMusicByMusician(String musicianName) {
		return ocarinaMusicDao.getMusicByMusician(musicianName);
	}

	@Override
	public List<OcarinaMusic> getAllMusic() {
		return ocarinaMusicDao.getAllMusic();
	}

}
