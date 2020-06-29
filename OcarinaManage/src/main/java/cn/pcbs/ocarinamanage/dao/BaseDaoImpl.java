package cn.pcbs.ocarinamanage.dao;

import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.pcbs.ocarinamanage.model.Pager;
import cn.pcbs.ocarinamanage.model.SystemContext;

@Repository("baseDao")
public class BaseDaoImpl<T> implements BaseDao<T> {
	
	@Autowired
	private SessionFactory sessionFactory;
	private Class<?> clazz;
	
	public Class<?> getClazz() {
		if (clazz == null) {
			clazz = ((Class<?>) ((((ParameterizedType) (this.getClass().getGenericSuperclass()))
					.getActualTypeArguments())[0]));
		}
		return clazz;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void add(T t) {
		getSession().save(t);
	}

	@Override
	public void delete(int id) {
		 getSession().delete(load(id));
	}

	@Override
	public void update(T t) {
		getSession().update(t);
		
	}

	@Override
	public T load(int id) {
		return (T) getSession().load(getClazz(), id);
	}
	
	/**
	 * 查询多条数据，支持分页
	 * @param hql
	 * @param objs
	 * @param alias
	 * @return
	 */
	public Pager<T> find(String hql,Object []objs, Map<String,Object> alias){
		hql = initSort(hql);
		Query< T> query = getSession().createQuery(hql);
		setParameter(query, objs);
		setAliasParameter(query, alias);
		Pager<T> pager = new Pager<>();
		setPager(query,pager);
		pager.setRows(query.list());
		
		//查询总条数
		String countHql = getCountHql(hql);
		Query countQuery = getSession().createQuery(countHql);
		long total = (long) countQuery.uniqueResult();
		pager.setTotal(total);
		return pager;
	}
	
	private String getCountHql(String hql) {
		String hhql = hql.substring(hql.indexOf("from"));
		String countHql = " select count(*) " + hhql;
		countHql = countHql.replace("fetch", "");
		return countHql;
	}

	private void setPager(Query<T> query, Pager<T> pager) {
		Integer pageSize = SystemContext.getPageSize();
		Integer pageOffset = SystemContext.getPageOffset();
		if(pageSize == null || pageSize < 0) {
			pageSize = 10;
		}
		if(pageOffset == null || pageOffset < 0) {
			pageOffset = 0;
		}
		pager.setOffset(pageOffset);
		pager.setSize(pageSize);
		query.setFirstResult(pageOffset);
		query.setMaxResults(pageSize);
	}

	/**
	 * 用hql语句查询多条记录，没有分页，lsit返回
	 * @param hql
	 * @param objs  替换hql语句中？占位符的实参
	 * @param alias   替换hql语句中:name占位符的实参
	 * @return
	 */
	public List<T> list(String hql,Object[] objs,Map<String,Object>alias){
		hql = initSort(hql);
		Query<T> query = getSession().createQuery(hql);
		setParameter(query,objs);
		setAliasParameter(query,alias);
		return query.list();
	}

	private void setAliasParameter(Query<T> query, Map<String, Object> alias) {
		if(alias != null) {
			for(Entry<String, Object> entry : alias.entrySet()) {
				if(entry instanceof Collection) {
					query.setParameter(entry.getKey(), (Collection)entry.getValue());
				}else {
					query.setParameter(entry.getKey(), entry.getValue());
				}
			}
		}
		
	}

	private void setParameter(Query<T> query, Object[] objs) {
		if(objs != null && objs.length > 0) {
			for(int i = 0 ; i < objs.length ; i++) {
				query.setParameter(i, objs[i]);
			}
		}
		
	}

	private String initSort(String hql) {
		String sort = SystemContext.getSort();
		String order = SystemContext.getOrder();
		if(sort != null && "".equals(sort)) {
			hql += " order by " + sort;
			if("desc".equals(order)) {
				hql += " desc ";
			}else {
				hql += " asc ";
			}
		}
		return hql;
	}

	/**
	 * 针对一些特殊的查询，返回不受泛型的制约，返回object
	 * @param hql
	 * @param objs
	 * @param alias
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object queryByHql(String hql, Object[] objs, Map<String, Object> alias) {
		Query query = getSession().createQuery(hql);
		setParameter(query,objs);
		setAliasParameter(query,alias);
		
		return query.uniqueResult();
	}
	
	/**
	 * 应对某些特殊情况要用hql语句，来做更新
	 * @param hql
	 * @param objs
	 * @param alias
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void updateByHql(String hql, Object[] objs, Map<String, Object> alias) {
		Query query = getSession().createQuery(hql);
		setParameter(query,objs);//将hql里？占位符替换
		setAliasParameter(query,alias);
		query.executeUpdate();
	}
}
