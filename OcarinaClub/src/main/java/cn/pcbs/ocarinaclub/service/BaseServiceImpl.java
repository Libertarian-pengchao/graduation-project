package cn.pcbs.ocarinaclub.service;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.pcbs.ocarinaclub.dao.BaseDao;
import cn.pcbs.ocarinaclub.utils.MapToEntityTool;

public abstract class BaseServiceImpl<T> implements BaseService<T> {
	
	/**
	 * 由子类去实现获取BaseDao的方法
	 * @return BaseDao 对象
	 */
	public abstract BaseDao getBaseDao();
	
	private Class<?> clazz;
	private String tableName;
	
	public BaseServiceImpl() {
		Type type = this.getClass().getGenericSuperclass();
		ParameterizedType type1 = (ParameterizedType) type;
		clazz = (Class<?>) type1.getActualTypeArguments()[0];
		tableName = "t_" + clazz.getSimpleName().toLowerCase();
	}

	@Override
	public void add(T t) {
		List<Object> list = new ArrayList<>();
		for(Field field : clazz.getDeclaredFields()) {
			field.setAccessible(true);
			try {
				list.add(field.get(t));
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		getBaseDao().add(tableName, list.toArray());
	}

	@Override
	public void delete(int id) {
		getBaseDao().delete(tableName, id);	
	}

	@Override
	public void update(T t) {
		List<Object> list = new ArrayList<>();
		int id = 0;
		for(Field field : clazz.getDeclaredFields() ) {
			field.setAccessible(true);
			try {
				if(field.get(t) == null) continue;
				
				if("id".equals(field.getName())) {
					id = (int) field.get(t);
					continue;
				}
				
				list.add(field.getName() + "=" + "'" + field.get(t) + "'");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}

	@Override
	public T select(int id) {
		Map<Object, Object> map = getBaseDao().select(tableName, id);
		return (T) MapToEntityTool.map2entity(map, clazz);
	}

	@Override
	public List<T> selectAll() {
		List<Map<Object, Object>> resList = getBaseDao().selectAll(tableName);
		List<T> list = new ArrayList<>();
		T t = null;
		for(Map<Object, Object> rs : resList) {
			t = (T) MapToEntityTool.map2entity(rs, clazz);
			list.add(t);
		}
		return list;
	}
	
	
}
