package cn.pcbs.ocarinamanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.pcbs.ocarinamanage.dao.RepostMessageDao;
import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.ReportMessage;

@Service("reportMessageService")
public class ReportMessageServiceImpl extends BaseServiceImpl<ReportMessage> implements ReportMessageService{

	@Autowired
	private RepostMessageDao repostMessageDao;
	
	@Override
	public Pager<ReportMessage> getAllPagerReportMess(ReportMessage repotMessage) {
		return repostMessageDao.getAllPagerReportMess(repotMessage);
	}

	@Override
	public void ChangeReportDone(int[] ids,String userNmae) {
		repostMessageDao.ChangeReportDone(ids,userNmae);
	}

}
