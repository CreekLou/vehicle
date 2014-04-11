package com.vehicle.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.domain.Video;
import com.vehicle.domain.Voice;
import com.vehicle.service.VehicleService;
import com.vehicle.service.VideoService;
import com.vehicle.service.VoiceService;

@Controller
public class VideoController extends BaseController {
	@Autowired
	private VideoService videoService;
	@Autowired
	private VoiceService voiceService;
	@Autowired
	private VehicleService vehicleService;
	@RequestMapping(value = "/video-{type}", method = RequestMethod.GET)
	public ModelAndView listVideoTopics(@PathVariable String type) {
		System.out.println("进来了 type=" + type);
		String countId = "video";
		// vehicleService.updateCountNum(countId);
		ModelAndView view = new ModelAndView();
		List<Video> videos = videoService.getAllVideoByType(type);
		view.addObject("videos", videos);
		view.addObject("type", type);
		view.setViewName("/listVideo");
		return view;
	}

	@RequestMapping(value = "/video2-{type}", method = RequestMethod.GET)
	public ModelAndView listVideo2Topics(@PathVariable String type) {
		System.out.println("进来了 type=" + type);
		String countId = "video";
		// vehicleService.updateCountNum(countId);
		ModelAndView view = new ModelAndView();
		List<Video> videos = videoService.getAllVideoByType(type);
		view.addObject("videos", videos);
		view.addObject("type", type);
		view.setViewName("/listVideo");
		return view;
	}
	@RequestMapping(value = "/voice-{type}", method = RequestMethod.GET)
	public ModelAndView listVoiceTopics(@PathVariable String type) {
		System.out.println("进来了 type=" + type);
		String countId = "voice";
		// vehicleService.updateCountNum(countId);
		ModelAndView view = new ModelAndView();
		List<Voice> voices = voiceService.getAllVoiceByType(type);
		view.addObject("voices", voices);
		view.addObject("type", type);
		view.setViewName("/listVoice");
		return view;
	}
	@RequestMapping(value = "/media/addClicks-{type}-{id}", method = RequestMethod.POST)
	public String listBoardCityTopics(@PathVariable String type,
			@PathVariable Long id) {
		System.out.println(" ===============进增加点击数");
		System.out.println(type + " 进来了 bbbb 增加点击数");
		String targetUrl = null;
		if (type.equals("videos")) {
			videoService.addClicks(id);
			System.out.println("视频");
			targetUrl = "/video-" + type + ".html";
		}
		if (type.equals("voice")) {
			voiceService.addClicks(id);
			targetUrl = "/voice-" + type + ".html";
		}

		return "redirect:" + targetUrl;
	}
}
