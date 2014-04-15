package com.vehicle.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.domain.App;
import com.vehicle.service.AppService;
@Controller
public class AppController {
	@Autowired
	private AppService appService;
	@RequestMapping(value = "/app-{type}", method = RequestMethod.GET)
	public ModelAndView listAppTopics(@PathVariable String type) {
		System.out.println("进来了 type=好地方哈撒地方哈");
		ModelAndView view = new ModelAndView();
		List<App> apps = appService.getAllAppByType(type);
		for (App v : apps) {
			System.out.println("App------App=" + v.getName());
		}
		view.addObject("apps", apps);
		view.addObject("type", type);
		view.setViewName("/listApp");
		return view;
	}
	@RequestMapping(value = "/appDetail-{id}", method = RequestMethod.GET)
	public ModelAndView listAppTopics(@PathVariable Integer id) {
		System.out.println("进来了 ccccc id ="+id);
		ModelAndView view = new ModelAndView();
		App app = appService.getAppById(id);
		view.addObject("app", app);
		view.setViewName("/appDetail");
		return view;
	}
	
	@RequestMapping(value = "/mediasss/addClicks-{type}-{id}", method = RequestMethod.POST)
	public String listBoardCityTopics(@PathVariable String type,
			@PathVariable Integer id) {
		System.out.println(" ===============进增加点击数");
		System.out.println(type + " 进来了 bbbb 增加点击数");
		String targetUrl = null;
		if (type.equals("apps")) {
			appService.addClicks(id);
			System.out.println("------App------");
			targetUrl = "/app-" + type + ".html";
		}
		
		return "redirect:" + targetUrl;
	}
}
