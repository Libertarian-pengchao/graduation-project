package cn.pcbs.ocarinaclub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.dao.ReportMessageDao;
import cn.pcbs.ocarinaclub.model.ReportMessage;

@Service("reportMessageService")
public class ReportMessageServiceImpl extends BaseServiceImpl<ReportMessage> implements ReportMessageService{

	@Autowired
	private ReportMessageDao reportMessageDao;
	
	@Override
	public BaseDao getBaseDao() {
		return reportMessageDao;
	}

	@Override
	public void insertReportMessage(ReportMessage reportMessage) {
		reportMessageDao.insertReportMessage(reportMessage);	
	}

}
