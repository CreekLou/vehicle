package com.vehicle.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.Page;
import com.vehicle.dao.VoiceDao;
import com.vehicle.domain.Voice;

@Service
public class VoiceService {
	@Autowired
	private VoiceDao voiceDao;

	/**
	 * 增加音频的点击数
	 * 
	 * @param id
	 */
	public void addClicks(Long id) {
		Voice voice = voiceDao.get(id);
		voice.setClicks(voice.getClicks() + 1);
		voiceDao.save(voice);
	}

	/**
	 * 根据类型查询所有的音频
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Voice> getAllVoiceByType(String type) {
		return voiceDao.getAllVoiceByType(type);
	}

	/**
	 * 根据类型分页查询音频
	 * 
	 * @param type
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Page getPageVoiceByType(String type, int pageNo, int pageSize) {
		return voiceDao.getPagedVoiceByType(type, pageNo, pageSize);
	}
}
