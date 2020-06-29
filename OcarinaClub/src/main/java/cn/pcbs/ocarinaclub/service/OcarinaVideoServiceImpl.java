package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.OcarinaVideoDao;
import cn.pcbs.ocarinaclub.model.OcarinaVideo;

@Service("ocarinaVideoService")
public class OcarinaVideoServiceImpl extends BaseServiceImpl<OcarinaVideo> implements OcarinaVideoService{

	@Autowired
	private OcarinaVideoDao ocarinaVideoDao;
	
	@Override
	public BaseDao getBaseDao() {
		return ocarinaVideoDao;
	}

	@Override
	public List<OcarinaVideo> getAllOcarinaVideo() {
		return ocarinaVideoDao.getAllOcarinaVideo();
	}

	@Override
	public List<OcarinaVideo> getOcarinaVideoByauthorName(String authorName) {
		return ocarinaVideoDao.getOcarinaVideoByauthorName(authorName);
	}

}
