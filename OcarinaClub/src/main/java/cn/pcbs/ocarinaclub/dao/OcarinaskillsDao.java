package cn.pcbs.ocarinaclub.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.Ocarinaskills;

public interface OcarinaskillsDao extends BaseDao{
	
	public List<Ocarinaskills> getAllOcarinaskills();
	
	public Ocarinaskills getOcarinaskillsById(@Param("id")int id);
}
