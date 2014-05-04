package com.vehicle.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.cons.CommonConstant;
import com.vehicle.dao.Page;
import com.vehicle.domain.Board;
import com.vehicle.domain.City;
import com.vehicle.service.VehicleService;

/**
 * @author louxuezheng
 */
@Controller
public class CityController extends BaseController {
	@Autowired
	private VehicleService vehicleService;

	@RequestMapping(value = "/listCitys", method = RequestMethod.GET)
	public ModelAndView listCitysService() {
		System.out.println("-----------listCitysService----------");
		ModelAndView view = new ModelAndView();
		List<City> citys = vehicleService.getAllCitys();
		System.out.println("城市：" + citys.size());
		for (City c : citys) {
			System.out.println("=========" + c.getCityName() + "=="
					+ c.getIntro());
		}
		view.addObject("citys", citys);
		view.setViewName("/listCitys");
		return view;
	}
	/**
	 * 根据城市和类别列出信息
	 * 
	 * @param city
	 * @param boardId
	 * @param pageNo
	 * @return
	 */
	@RequestMapping(value = "/showCity-{city}-{boardId}-{pageNo}", method = RequestMethod.GET)
	public ModelAndView listNewsTopics(@PathVariable String city,
			@PathVariable Integer boardId, @PathVariable Integer pageNo) {
		System.out.println("City=" + city + "模块 =" + boardId + " 第" + pageNo
				+ "页");
		ModelAndView view = new ModelAndView();
		// String countId = city;
		List<City> citys = vehicleService.getAllCitys();
		Board board = vehicleService.getBoardById(boardId);
		pageNo = pageNo == null ? 1 : pageNo;
		Page pagedTopic = null;
		for (City c : citys) {
			System.out.println("城市：" + c.getNickName());
			if (c.getNickName().equals(city)) {
				System.out.println("这个城市是存在的");
				pagedTopic = vehicleService.getPageTopicsByCity(boardId, city,
					pageNo, CommonConstant.PAGE_SIZE);

			}
		}
		view.addObject("city", city);
		view.addObject("board", board);
		view.addObject("pagedTopic", pagedTopic);
		view.setViewName("/listCityTopics");
		return view;
	}

	@RequestMapping(value = "/routetopicbj")
	public String bjRecommend() {
		System.out.println("-----------routetopicbj----------");
		return "forward:/library/test/routetopicbj.htm";
	}

	@RequestMapping(value = "/routetopic_haikou")
	public String haiKouRecommend() {
		System.out.println("-----------routetopic_haikou----------");
		return "forward:/library/letu/routetopic_haikou.htm";
	}

	@RequestMapping(value = "/routetopic_sanya")
	public String sanYaRecommend() {
		System.out.println("-----------routetopic_sanya----------");
		return "forward:/library/letu/routetopic_sanya.htm";
	}

	@RequestMapping(value = "/haikou2day")
	public String haikou2day() {
		System.out.println("-----------haikou2day----------");
		return "forward:/library/letu/haikou2day.htm";
	}

	@RequestMapping(value = "/haikou3day")
	public String haikou3day() {
		System.out.println("-----------haikou3day----------");
		return "forward:/library/letu/haikou3day.htm";
	}

	@RequestMapping(value = "/sanya2day")
	public String sanya2day() {
		System.out.println("-----------sanya2day----------");
		return "forward:/library/letu/sanya2day.htm";
	}

	@RequestMapping(value = "/sanya3day")
	public String sanya3day() {
		return "forward:/library/letu/sanya3day.htm";
	}
	@RequestMapping(value = "/routetopictj")
	public String tjRecommend() {
		System.out.println("-----------routetopictj----------");
		return "forward:/library/test/routetopictj.htm";
	}

	@RequestMapping(value = "/coach")
	public String showCoach() {
		System.out.println("-----------coach----------");
		return "forward:/library/test/coach.htm";
	}

	@RequestMapping(value = "/carrental")
	public String showCarrental() {
		System.out.println("-----------carrental----------");
		return "forward:/library/test/carrental.htm";
	}

	@RequestMapping(value = "/listApps")
	public String showApps() {
		System.out.println("-----------listApps----------");
		return "forward:/library/test/listApps.htm";
	}

	@RequestMapping(value = "/goshopping")
	public String showShop() {
		System.out.println("-----------goshopping----------");
		return "forward:/library/test/goshopping.htm";
	}

	@RequestMapping(value = "/mobilemall")
	public String showMobileMall() {
		System.out.println("-----------mobilemall----------");
		return "forward:/library/test/mobilemall.htm";
	}

	@RequestMapping(value = "/hotproducts")
	public String showHotProducts() {
		System.out.println("-----------hotproducts----------");
		return "forward:/library/test/hotproducts.htm";
	}

	@RequestMapping(value = "/bussearch")
	public String showBusSearch() {
		System.out.println("-----------bussearch----------");
		return "forward:/library/test/bussearch.htm";
	}

	@RequestMapping(value = "/thebus")
	public String showTheBus() {
		System.out.println("-----------thebus----------");
		return "forward:/library/test/thebus.htm";
	}
}
