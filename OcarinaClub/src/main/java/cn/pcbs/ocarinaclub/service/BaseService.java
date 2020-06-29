package cn.pcbs.ocarinaclub.service;

import java.util.List;

public interface BaseService<T> {
	
	/**
	 * 增加
	 * @param t
	 */
	public void add(T t);
	
	/**
	 * 根据ID删除
	 * @param id
	 */
	public void delete(int id);
	
	/**
	 * 更新
	 * @param t
	 */
	public void update(T t);
	
	/**
	 * 根据ID查询
	 * @param id
	 * @return
	 */
	public T select(int id);
	
	/**
	 * 查询所有记录
	 * @return
	 */
	public List<T> selectAll();
}
