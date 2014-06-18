package com.vehicle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Ad;

/**
 * @author louxuezheng
 */
@Repository
public class AdDao extends BaseDao<Ad> {

	// protected final String GET_RANDOM_AD =
	// "from Ad a where a.adSiteId = ? ORDER BY RAND() LIMIT 1 ";
	protected final String GET_RANDOM_AD = "from Ad a where a.adSiteId = ? ORDER BY RAND()";

	public Ad getRandomAd(int adSiteId) {
		List<Ad> ads = getHibernateTemplate().find(GET_RANDOM_AD, adSiteId);
		if (ads.size() == 0) {
			return null;
		} else {
			return ads.get(0);
		}
	}
}
