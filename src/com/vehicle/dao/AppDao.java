package com.vehicle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.App;

@Repository
public class AppDao extends BaseDao<App>{
	protected final String GET_PAGED_APPS = "from App where type=?";
	protected final String GET_APPS = "from App where type=?";
	protected final String GET_APP = "from App where id=?";
	/**
	 * 分页查询对象
	 * 
	 * @param type
	 *            App的类型
	 */
	public Page getPagedAppByType(String type, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_APPS, pageNo, pageSize, type);
	}

	public List getAllAppByType(String type) {
		return find(GET_APPS, type);
	}
	public App getAppById(int id) {
		return (App)find(GET_APP, id).get(0);
	}
}
