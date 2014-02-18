package com.vehicle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.Page;
import com.vehicle.dao.VideoDao;
import com.vehicle.domain.Video;

@Service
public class VideoService {
	@Autowired
	private VideoDao videoDao;

	/**
	 * 增加视频的点击数
	 * 
	 * @param id
	 */
	public void addClicks(Long id) {
		Video video = videoDao.get(id);
		video.setClicks(video.getClicks() + 1);
		videoDao.save(video);
	}

	/**
	 * 根据类型查询所有的视频
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Video> getAllVideoByType(String type) {
		return videoDao.getAllVideoByType(type);
	}

	/**
	 * 根据类型分页查询视频
	 * 
	 * @param type
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPageVideoByType(String type, int pageNo, int pageSize) {
		return videoDao.getPagedVideoByType(type, pageNo, pageSize);
	}
}
