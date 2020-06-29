package cn.pcbs.ocarinamanage.service;

import org.springframework.beans.factory.annotation.Autowired;

import cn.pcbs.ocarinamanage.dao.BaseDao;

public class BaseServiceImpl<T> implements BaseService<T> {
	
	@Autowired
	private BaseDao<T> baseDao;
	
	@Override
	public void add(T t) {
		baseDao.add(t);
	}

	@Override
	public void delete(int id) {
		baseDao.delete(id);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);
		
	}

	@Override
	public T load(int id) {
		return baseDao.load(id);
	}

}
