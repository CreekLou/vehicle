package com.vehicle.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * @author louxuezheng
 */
@Entity
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Table(name = "ad")
public class Ad extends BaseDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ad_id")
	private Long adId;
	@Column(name = "ad_site_id")
	private int adSiteId;
	@Column(name = "ad_site_index")
	private int adSiteIndex;
	@Column(name = "suf_name")
	private String sufName;
	private String md5;

	public int getAdSiteIndex() {
		return adSiteIndex;
	}

	public void setAdSiteIndex(int adSiteIndex) {
		this.adSiteIndex = adSiteIndex;
	}

	public Long getAdId() {
		return adId;
	}

	public void setAdId(Long adId) {
		this.adId = adId;
	}

	public int getAdSiteId() {
		return adSiteId;
	}

	public void setAdSiteId(int adSiteId) {
		this.adSiteId = adSiteId;
	}

	public String getSufName() {
		return sufName;
	}

	public void setSufName(String sufName) {
		this.sufName = sufName;
	}

	public String getMd5() {
		return md5;
	}

	public void setMd5(String md5) {
		this.md5 = md5;
	}
}
