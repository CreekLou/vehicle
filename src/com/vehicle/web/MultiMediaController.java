/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vehicle.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.cons.CommonConstant;
import com.vehicle.dao.Page;
import com.vehicle.domain.Ad;
import com.vehicle.domain.Video;
import com.vehicle.domain.Videotype;
import com.vehicle.domain.Voicetype;
import com.vehicle.service.AdService;
import com.vehicle.service.VideoService;
import com.vehicle.service.VoiceService;
import com.vehicle.util.AdClickCount;
/**
 *
 * @author liu.huazhou <khzliu@163.com>
 */
@Controller
public class MultiMediaController{
    @Autowired
    private VideoService videoService;
    @Autowired
    private VoiceService voiceService;
	@Autowired
	private AdService adService;
    private Videotype videotype;
    private List<Videotype> videoTypeList;
    
    private Voicetype voicetype;
    private List<Voicetype> voiceTypeList;
    
    private Video video;
    private List<Video> videoList;
    
    @RequestMapping(value = "/video.html")
	public ModelAndView video(HttpServletRequest request) {
        videoTypeList = videoService.getAllVideoType();
        ModelAndView modelAndView = new ModelAndView("video");
		Ad ad = adService.getRandomAd(1);
		String ad_url = ad.getAdId() + "." + ad.getSufName();
		new AdClickCount(ad.getAdId().intValue(), 1, request.getRemoteAddr())
				.start();
		if (ad.getAdId() == 0) {
			modelAndView.addObject("ad_url", "default_1.jpg");
		} else {
			modelAndView.addObject("ad_url", ad_url);
		}
        modelAndView.addObject("typeList", videoTypeList);
        return modelAndView;
    }
    
    @RequestMapping(value = "/videoplayer.html")
	public ModelAndView videoPlayer(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("videoPlayer");
		Ad ad = adService.getRandomAd(2);
		String ad_url = ad.getAdId() + "." + ad.getSufName();
		new AdClickCount(ad.getAdId().intValue(), 2, request.getRemoteAddr())
				.start();
		System.out.println("video ad.id = " + ad.getAdId());
		if (ad.getAdId() == 0) {
			modelAndView.addObject("ad_url", "default_2.jpg");
		} else {
			modelAndView.addObject("ad_url", ad_url);
		}
        modelAndView.addObject("typeList");
        return modelAndView;
    }
    @RequestMapping(value = "/voice.html")
	public ModelAndView voice(HttpServletRequest request) {
        voiceTypeList = voiceService.getAllVoiceType();
        ModelAndView modelAndView = new ModelAndView("voice");
		Ad ad = adService.getRandomAd(1);
		String ad_url = ad.getAdId() + "." + ad.getSufName();
		new AdClickCount(ad.getAdId().intValue(), 1, request.getRemoteAddr())
				.start();
		if (ad.getAdId() == 0) {
			modelAndView.addObject("ad_url", "default_1.jpg");
		} else {
			modelAndView.addObject("ad_url", ad_url);
		}
        modelAndView.addObject("typeList", voiceTypeList);
        return modelAndView;
    }
    
    @RequestMapping(value = "/voiceplayer.html")
    public ModelAndView voicePlayer() {
        ModelAndView modelAndView = new ModelAndView("voicePlayer");
        modelAndView.addObject("typeList");
        return modelAndView;
    }
    
    @RequestMapping(value = "/listMoreVideos-{type}-{pageNo}.html", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listMoreVideos(@PathVariable String type,@PathVariable Integer pageNo) {
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedVideos = null;
                pagedVideos = videoService.getPagedVideosByType(type,pageNo,CommonConstant.PAGE_SIZE);
                
                //转换为json包
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("pageNo", pageNo);
		modelMap.put("pagedVideos", pagedVideos);
		return modelMap;
	}
    @RequestMapping(value = "/listAllVideos-{type}.html", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listMoreVideos(@PathVariable String type) {
                videoList = null;
                videoList = videoService.getAllVideosByType(type);
                //转换为json包
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("videoList", videoList);
		return modelMap;
	}
    
    @RequestMapping(value = "/listMoreVoice-{type}-{pageNo}.html", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listMoreVoice(@PathVariable String type,@PathVariable Integer pageNo) {
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedVoice = null;
                pagedVoice = voiceService.getPagedVoiceByType(type,pageNo,CommonConstant.PAGE_SIZE);
                
                //转换为json包
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("pageNo", pageNo);
		modelMap.put("pagedVoice", pagedVoice);
		return modelMap;
	}
    
	// @RequestMapping(value = "/videoAdClicks", method = RequestMethod.POST)
	// public void adAddClicks(HttpServletRequest request) {
	// new AdClickCount(1, 1, request.getRemoteAddr()).start();
	// System.out.println("视频广告次数增加");
	// }
    @RequestMapping(value = "/addClicks-{type}-{id}.html", method = RequestMethod.POST)
	public String addClicks(@PathVariable String type,@PathVariable Long id) {
                String targetUrl = null;
		if (type.equals(CommonConstant.VIDEO_CONTENTS)) {
			videoService.addClicks(id);
			targetUrl = "/videoplayer.html";
		}
		if (type.equals(CommonConstant.VOICE_CONTENTS)) {
			voiceService.addClicks(id);
			targetUrl = "/voiceplayer.html";
			System.out.println("id voice add-----------------" + id);
		}
		return "redirect:" + targetUrl;
	}
    @RequestMapping(value = "/addPriase-{type}-{id}.html", method = RequestMethod.POST)
	public String addPriase(@PathVariable String type,@PathVariable Long id) {
                String targetUrl = null;
		if (type.equals(CommonConstant.VIDEO_CONTENTS)) {
			videoService.addPriase(id);
                        targetUrl = "/videoplayer.html";
		}
		if (type.equals(CommonConstant.VOICE_CONTENTS)) {
			voiceService.addPriase(id);
                        targetUrl = "/voiceplayer.html";
		}
                return "redirect:" + targetUrl;
	}
   
}