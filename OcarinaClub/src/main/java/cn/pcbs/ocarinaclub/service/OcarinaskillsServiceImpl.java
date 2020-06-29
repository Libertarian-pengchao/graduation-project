package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.OcarinaskillsDao;
import cn.pcbs.ocarinaclub.model.Ocarinaskills;

@Service("ocarinaskillsService")
public class OcarinaskillsServiceImpl extends BaseServiceImpl<Ocarinaskills> implements OcarinaskillsService{

	@Autowired
	private OcarinaskillsDao ocarinaskillsDao;
	
	@Override
	public BaseDao getBaseDao() {
		return ocarinaskillsDao;
	}

	@Override
	public List<Ocarinaskills> getAllOcarinaskills() {
		return ocarinaskillsDao.getAllOcarinaskills();
	}

	@Override
	public Ocarinaskills getOcarinaskillsById(int id) {
		return ocarinaskillsDao.getOcarinaskillsById(id);
	}

}
