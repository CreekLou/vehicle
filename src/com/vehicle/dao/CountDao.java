package com.vehicle.dao;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Count;

/**
 * @author louxuezheng
 */
@Repository
public class CountDao extends BaseDao<Count> {
	/*
	 * protected final String GET_COUNT_NUM =
	 * "select countNum from Count where countId=?"; protected final String
	 * UPDATE_COUNT_NUM =
	 * "update Count count set count.countNum=? where count.countId=?";
	 * 
	 * // 获取CountNum数目 public long getCountNum() { Iterator iter =
	 * getHibernateTemplate().iterate(GET_COUNT_NUM); return ((Long)
	 * iter.next()); }
	 * 
	 * // 修改CountNum数目 public void updateCountNum() {
	 * getHibernateTemplate().update(UPDATE_COUNT_NUM); }
	 */
}
