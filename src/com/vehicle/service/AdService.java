package com.vehicle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.AdDao;
import com.vehicle.domain.Ad;

/**
 * @author louxuezheng
 */
@Service
public class AdService {
	@Autowired
	private AdDao adDao;

	public Ad getRandomAd(int adSiteId) {
		return adDao.getRandomAd(adSiteId);
	}
}
