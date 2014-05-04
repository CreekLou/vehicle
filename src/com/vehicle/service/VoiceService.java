/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vehicle.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.Page;
import com.vehicle.dao.VoiceDao;
import com.vehicle.dao.VoiceTypeDao;
import com.vehicle.domain.Voice;
import com.vehicle.domain.Voicetype;
/**
 *
 * @author liu.huazhou <khzliu@163.com>
 */
@Service
public class VoiceService {
    @Autowired
    private VoiceTypeDao voiceTypeDao;
    @Autowired 
    private VoiceDao voiceDao;
    
    private List<Voicetype> voiceTypeList;
    
    public void addClicks(Long id) {
        Voice voice = voiceDao.get(id);
        voice.setClicks(voice.getClicks() + 1);
        voiceDao.save(voice);
    }
    public void addPriase(Long id){
        Voice voice = voiceDao.get(id);
        voice.setPriase(voice.getPriase() + 1);
        voiceDao.save(voice);
    }
    
     public List<Voicetype> getAllVoiceType(){
        voiceTypeList = voiceTypeDao.getAllVoiceType();
        return voiceTypeList;
    }
    /**
	 * 获取论坛版块某一页主题帖
	 * @param videoId
	 * @return
	 */
    public Page getPagedVoiceByType(String type,int pageNo,int pageSize){
		return voiceDao.getPagedVoiceByType(type,pageNo,pageSize);
    }
}
