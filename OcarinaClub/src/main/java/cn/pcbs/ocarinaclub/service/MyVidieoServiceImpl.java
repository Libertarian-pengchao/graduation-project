package cn.pcbs.ocarinaclub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.MyVidieoDao;
import cn.pcbs.ocarinaclub.model.MyVidieo;

@Service("myVidieoService")
public class MyVidieoServiceImpl extends BaseServiceImpl<MyVidieo> implements MyVidieoService{

	@Autowired
	private MyVidieoDao myVidieoDao;
	
	@Override
	public BaseDao getBaseDao() {
		return myVidieoDao;
	}

	@Override
	public List<MyVidieo> getAllMyVideos(int id) {
		
		return myVidieoDao.getAllMyVideos(id);
	}

	@Override
	public void deleteById(int id) {
		myVidieoDao.deleteById(id);	
	}

	@Override
	public void deleteMiddleTable(int id) {
		myVidieoDao.deleteMiddleTable(id);	
	}

	@Override
	public void uploadMyVideo(MyVidieo myVideo) {
		myVidieoDao.uploadMyVideo(myVideo);		
	}

	@Override
	public void updateMiddleTable(int uid, int vid) {
		myVidieoDao.updateMiddleTable(uid, vid);	
	}

}
