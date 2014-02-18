package com.vehicle.dao;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.LoginLog;

/**
 * Post的DAO类
 *
 */
@Repository
public class LoginLogDao extends BaseDao<LoginLog> {
	@Override
	public void save(LoginLog loginLog) {
		this.getHibernateTemplate().save(loginLog);
	}

}
