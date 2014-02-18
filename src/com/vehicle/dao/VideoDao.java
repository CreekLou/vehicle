package com.vehicle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Video;

@Repository
public class VideoDao extends BaseDao<Video> {
	protected final String GET_PAGED_VIDEOS = "from Video where type=?";
	protected final String GET_VIDEOS = "from Video where type=?";

	/**
	 * 分页查询对象
	 * 
	 * @param type Video的类型
	 */
	public Page getPagedVideoByType(String type, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_VIDEOS, pageNo, pageSize, type);
	}

	public List getAllVideoByType(String type) {
		return find(GET_VIDEOS, type);
	}
}
