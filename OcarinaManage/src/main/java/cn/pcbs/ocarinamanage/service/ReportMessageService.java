package cn.pcbs.ocarinamanage.service;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.ReportMessage;

public interface ReportMessageService extends BaseService<ReportMessage>{
	public Pager<ReportMessage> getAllPagerReportMess(ReportMessage repotMessage);
	
	public void ChangeReportDone(int[] ids,String userNmae);
}
