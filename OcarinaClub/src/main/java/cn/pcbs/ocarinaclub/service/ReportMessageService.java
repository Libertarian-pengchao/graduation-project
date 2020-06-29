package cn.pcbs.ocarinaclub.service;

import cn.pcbs.ocarinaclub.model.ReportMessage;

public interface ReportMessageService extends BaseService<ReportMessage>{
	
	public void insertReportMessage(ReportMessage reportMessage);
}
