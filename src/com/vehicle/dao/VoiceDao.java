package com.vehicle.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.vehicle.domain.Voice;

@Repository
public class VoiceDao extends BaseDao<Voice> {
	protected final String GET_PAGED_VOICES = "from Voice where type=?";
	protected final String GET_VOICES = "from Voice where type=?";

	/**
	 * 分页查询对象
	 * 
	 * @param type
	 *            Video的类型
	 */
	public Page getPagedVoiceByType(String type, int pageNo, int pageSize) {
		return pagedQuery(GET_PAGED_VOICES, pageNo, pageSize, type);
	}

	public List getAllVoiceByType(String type) {
		return find(GET_VOICES, type);
	}
}
