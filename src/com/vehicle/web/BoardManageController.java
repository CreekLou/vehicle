/*
 * Template path: templates/java/JavaClass.vtl
 */
package com.vehicle.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.cons.CommonConstant;
import com.vehicle.dao.Page;
import com.vehicle.domain.Board;
import com.vehicle.domain.Comment;
import com.vehicle.domain.Descr;
import com.vehicle.domain.Topic;
import com.vehicle.domain.Users;
import com.vehicle.service.VehicleService;

@Controller
public class BoardManageController extends BaseController {
	@Autowired
	private VehicleService vehicleService;

	/**
	 * 列出论坛模块下的主题帖子
	 * @param boardId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/board/listBoardTopics-{boardId}", method = RequestMethod.GET)
	public ModelAndView listBoardTopics(@PathVariable Integer boardId,@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view =new ModelAndView();
		Board board = vehicleService.getBoardById(boardId);
		pageNo = pageNo==null?1:pageNo;
		Page pagedTopic = vehicleService.getPagedTopics(boardId, pageNo,
				CommonConstant.PAGE_SIZE);
		view.addObject("board", board);
		view.addObject("pagedTopic", pagedTopic);
		view.setViewName("/listBoardTopics");
		return view;
	}

	@RequestMapping(value = "/board/listBoardCityTopics-{city}-{boardId}-{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listBoardCityTopics(@PathVariable String city,
			@PathVariable Integer boardId, @PathVariable Integer pageNo) {
		System.out.println("进来了 bbbb 加载listBoardCityTopics");
		Board board = vehicleService.getBoardById(boardId);
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedTopic = null;
		if (city.equals("all")) {
			pagedTopic = vehicleService.getPagedTopics(boardId, pageNo,
					CommonConstant.PAGE_SIZE);
		} else {
			pagedTopic = vehicleService.getPageTopicsByCity(boardId, city,
				pageNo, CommonConstant.PAGE_SIZE);
		}
		for (int i = 0; i < pagedTopic.getResult().size(); i++) {
			System.out.println("-->"+ pagedTopic.getResult().get(i).toString());
		}
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("city", city);
		modelMap.put("boardId", boardId);
		modelMap.put("pageNo", pageNo);
		modelMap.put("board", board);
		modelMap.put("pagedTopic", pagedTopic);
		return modelMap;
	}

	@RequestMapping(value = "/board/listMoreCityTopics-{city}-{boardId}-{pageNo}", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listMoreCityTopics(@PathVariable String city,
			@PathVariable Integer boardId, @PathVariable Integer pageNo) {
		System.out.println("进来了 aaa 加载listMoreCityTopics");
		System.out.println("city的名字是=" + city);
		System.out.println("boardId的名字是=" + boardId);
		Board board = vehicleService.getBoardById(boardId);
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedTopic = null;
		if (city.equals("all")) {
			pagedTopic = vehicleService.getPagedTopics(boardId, pageNo,
					CommonConstant.PAGE_SIZE);
		} else {
			pagedTopic = vehicleService.getPageTopicsByCity(boardId, city,
					pageNo, CommonConstant.PAGE_SIZE);
		}
		for (int i = 0; i < pagedTopic.getResult().size(); i++) {
			System.out.println("sss-"+ pagedTopic.getResult().get(i).toString());
		}
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("city", city);
		modelMap.put("pageNo", pageNo);
		modelMap.put("boardId", boardId);
		modelMap.put("board", board);
		modelMap.put("pagedTopic", pagedTopic);
		return modelMap;
	}
	/*
	 * @RequestMapping(value = "/board/listBoardCityTopics", method =
	 * RequestMethod.POST)
	 * 
	 * @ResponseBody public Map<String, Object> listBoardCityTopics(@RequestBody
	 * Infor infor) { System.out.println("进来了 aaa 加载information");
	 * System.out.println(infor.getBoardId());
	 * System.out.println(infor.getCity()); Map<String, Object> modelMap = new
	 * HashMap<String, Object>(); modelMap.put("city", infor.getCity());
	 * modelMap.put("boardId", infor.getBoardId()); return modelMap; }
	 */

	@RequestMapping("/board/testJson2")
	@ResponseBody
	public Map<String, Object> testJson2(@RequestBody Users users) {
		System.out.println("加载testJson2");
		System.out.println(users.getName());
		System.out.println(users.getAge());
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("name", users.getName());
		modelMap.put("age", users.getAge());
		return modelMap;
	}
	/**
	 * 列出主题的详细信息
	 * @param boardId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/board/listTopic-{topicId}", method = RequestMethod.GET)
	public ModelAndView listTopic(@PathVariable Integer topicId,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view = new ModelAndView();
		Topic topic = vehicleService.getTopicByTopicId(topicId);
		@SuppressWarnings("unchecked")
		List<Descr> allDescr = vehicleService.getAllDescrs(topicId);
		for (Descr x : allDescr) {
			System.out.println("++++++++ " + x.getDescrName());
		}
		pageNo = pageNo==null?1:pageNo;
		Page pagedComment = vehicleService.getPagedComments(topicId, pageNo,CommonConstant.PAGE_SIZE);
		view.addObject("topic", topic);
		view.addObject("allDescr", allDescr);
		view.addObject("pagedComment", pagedComment);
		view.setViewName("/listTopic");
		return view;
	}

	/**
	 * 列出主题的所有回复
	 * 
	 * @param topicId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/board/listTopicComments-{topicId}", method = RequestMethod.GET)
	public ModelAndView listTopicComments(@PathVariable Integer topicId,@RequestParam(value = "pageNo", required = false) Integer pageNo) {
		ModelAndView view =new ModelAndView();
		Topic topic = vehicleService.getTopicByTopicId(topicId);
		pageNo = pageNo==null?1:pageNo;
		Page pagedComment = vehicleService.getPagedComments(topicId, pageNo,
				CommonConstant.PAGE_SIZE);
		// 为回复帖子表单准备数据
		view.addObject("topic", topic);
		view.addObject("pagedComment", pagedComment);
		view.setViewName("/listTopicComments");
		return view;
	}

	/**
	 * 回复主题
	 * 
	 * @param request
	 * @param response
	 * @param post
	 * @return
	 */
	@RequestMapping(value = "/board/addComment")
	public String addComment(HttpServletRequest request, Comment comment) {
		comment.setCreateTime(new Date());
		comment.setUser(getSessionUser(request));
		vehicleService.addComment(comment);
		String targetUrl = "/board/listTopicComments-"
				+ comment.getTopic().getTopicId() + ".html";
		return "redirect:"+targetUrl;
	}
}
