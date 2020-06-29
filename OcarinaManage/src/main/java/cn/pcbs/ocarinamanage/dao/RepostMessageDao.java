package cn.pcbs.ocarinamanage.dao;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.ReportMessage;

public interface RepostMessageDao extends BaseDao<ReportMessage>{
	public Pager<ReportMessage> getAllPagerReportMess(ReportMessage repotMessage);
	
	public void ChangeReportDone(int[] ids,String userNmae);
}
