/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vehicle.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vehicle.dao.Page;
import com.vehicle.dao.VideoDao;
import com.vehicle.dao.VideoTypeDao;
import com.vehicle.domain.Video;
import com.vehicle.domain.Videotype;
/**
 *
 * @author liu.huazhou <khzliu@163.com>
 */
@Service
public class VideoService {
   @Autowired
   private VideoTypeDao videoTypeDao;
   @Autowired 
   VideoDao videoDao;
   private List<Videotype> videoTypeList;
   
   
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
    public void addPriase(Long id){
        Video video = videoDao.get(id);
        video.setPriase(video.getPriase() + 1);
        videoDao.save(video);
    }
    
    public List<Videotype> getAllVideoType(){
        videoTypeList = videoTypeDao.getAllVideoType();
        return videoTypeList;
    }
    
        
   /**
	 * 获取论坛版块某一页主题帖
	 * @param videoId
	 * @return
	 */

    public Page getPagedVideosByType(String type,int pageNo,int pageSize){
		return videoDao.getPagedVideoByType(type,pageNo,pageSize);
    }
     public List<Video> getAllVideosByType(String type){
	return videoDao.getAllVideoByType(type);              
    }
}
