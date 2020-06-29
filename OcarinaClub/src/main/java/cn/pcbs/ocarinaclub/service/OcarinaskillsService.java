package cn.pcbs.ocarinaclub.service;

import java.util.List;
import cn.pcbs.ocarinaclub.model.Ocarinaskills;

public interface OcarinaskillsService extends BaseService<Ocarinaskills>{
	public List<Ocarinaskills> getAllOcarinaskills();
	
	public Ocarinaskills getOcarinaskillsById(int id);
}
