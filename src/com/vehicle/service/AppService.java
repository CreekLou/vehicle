package com.vehicle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.Page;
import com.vehicle.dao.AppDao;
import com.vehicle.domain.App;

@Service
public class AppService {
	@Autowired
	private AppDao appDao;

	/**
	 * 增加app的点击数
	 * 
	 * @param id
	 */
	public void addDownload_num(Integer id) {
		App app = appDao.get(id);
		app.setDownload_num(app.getDownload_num() + 1);
		appDao.save(app);
	}

	/**
	 * 根据类型查询所有的app
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<App> getAllAppByType(String type) {
		return appDao.getAllAppByType(type);
	}
	public App getAppById(int id) {
		return appDao.getAppById(id);
	}
	/**
	 * 根据类型分页查询app
	 * 
	 * @param type
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPageAppByType(String type, int pageNo, int pageSize) {
		return appDao.getPagedAppByType(type, pageNo, pageSize);
	}
}
