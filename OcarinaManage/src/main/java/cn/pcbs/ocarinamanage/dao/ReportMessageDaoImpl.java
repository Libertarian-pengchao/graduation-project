package cn.pcbs.ocarinamanage.dao;

import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.ReportMessage;

@Repository("reportMessageDao")
public class ReportMessageDaoImpl extends BaseDaoImpl<ReportMessage> implements RepostMessageDao{

	@Override
	public Pager<ReportMessage> getAllPagerReportMess(ReportMessage repotMessage) {
		String hql = "from ReportMessage r where 1 = 1";
		if(repotMessage.getTitle() != null && !"".equals(repotMessage.getTitle())) {
			hql += " and r.title like '%"+repotMessage.getTitle()+"%'";
		}
		if(repotMessage.getIsDeal() !=null) {
			if(repotMessage.getIsDeal() == 1) {
				hql += " and r.isDeal = 1";
			}else if(repotMessage.getIsDeal() == 0) {
				hql += " and r.isDeal = 0";
			}
		}
		return super.find(hql, null, null);
	}

	@Override
	public void ChangeReportDone(int[] ids,String userNmae) {
		ReportMessage rm = null;
		for(int id : ids) {
			rm = super.load(id);
			rm.setIsDeal(1);
			rm.setDealName(userNmae);
			super.update(rm);
		}
	}

}
