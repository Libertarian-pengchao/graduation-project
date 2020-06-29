package cn.pcbs.ocarinamanage.dao;

public interface BaseDao<T> {
	/**
	 * 添加
	 */
	public void add(T t);

	/**
	 * 删除
	 */
	public void delete(int id);

	/**
	 * 修改
	 */
	public void update(T t);

	/**
	 * 查询
	 */
	public T load(int id);
}
