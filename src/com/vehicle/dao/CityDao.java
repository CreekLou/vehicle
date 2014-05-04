package com.vehicle.dao;

import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.City;

/**
 * @author louxuezheng
 */
@Repository
public class CityDao extends BaseDao<City> {
	protected final String GET_CITY_NUM = "select count(f.cityId) from City f";
	protected final String GET_CITY = "select cityId,nickName,cityName,intro from City";

	// 获取城市数目
	public long getCityNum() {
		Iterator iter = getHibernateTemplate().iterate(GET_CITY_NUM);
        return ((Long)iter.next());
	}

	// 获取所有City
	public List getAllCitys() {
		return find(GET_CITY);
	}
}
