package cn.pcbs.ocarinaclub.service;

import java.util.List;


import cn.pcbs.ocarinaclub.model.OcarinaVideo;

public interface OcarinaVideoService extends BaseService<OcarinaVideo>{
	
	public List<OcarinaVideo> getAllOcarinaVideo();
	
	public List<OcarinaVideo> getOcarinaVideoByauthorName(String authorName);
}
