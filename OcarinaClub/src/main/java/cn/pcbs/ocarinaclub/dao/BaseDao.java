package cn.pcbs.ocarinaclub.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import cn.pcbs.ocarinaclub.model.User;

public interface BaseDao {
	
	/**
	 * 添加
	 * @param tableName 表名
	 * @param objects  参数
	 */
	public void add(@Param("tableName")String tableName,@Param("objects")Object[] objects);
	
	/**
	 * 根据ID删除
	 * @param tableName 表名
	 * @param id  主键ID
	 */
	public void delete(@Param("tableName") String tableName, @Param("id") int id);
	
	/**
	 * 更新
	 * @param tableName
	 * @param objects
	 * @param id 主键ID
	 */
	public void update(@Param("tableName")String tableName,@Param("id")Integer id,@Param("objects")Object[] objects);
	
	/**
	 * 根据ID查询
	 * @param tableName
	 * @param id
	 * @return
	 */
	public Map<Object,Object> select(@Param("tableName") String tableName,@Param("id")Integer id);
	
	/**
	 * 查询所有记录
	 * @param tableName
	 * @return
	 */
	public List<Map<Object,Object>> selectAll(@Param("tableName") String tableName);
}
