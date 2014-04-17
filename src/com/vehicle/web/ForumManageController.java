
package com.vehicle.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.domain.Board;
import com.vehicle.service.UserService;
import com.vehicle.service.VehicleService;

/**
 * 
 *<br>
 * <b>类描述:</b>
 * 
 * <pre>
 *   论坛管理，这部分功能由论坛管理员操作，包括：创建论坛版块、指定论坛版块管理员、
 * 用户锁定/解锁。
 *</pre>
 * 
 * @see
 *@since
 */
@Controller
public class ForumManageController extends BaseController {
	@Autowired
	private VehicleService vehicleService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpServletRequest request;

	/**
	 * 列出所有的模块
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	// @RequestMapping(value = "/index", method = RequestMethod.GET)
	// public ModelAndView listAllBoards() {
	// ModelAndView view = new ModelAndView();
	// List<Board> boards = vehicleService.getAllBoards();
	// view.addObject("boards", boards);
	// view.setViewName("/listAllBoards");
	// return view;
	// }

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String listAds() {
		return "forward:/library/letu/letuads.htm";
	}
	@RequestMapping(value = "/vehicle/index", method = RequestMethod.GET)
	public ModelAndView listIndex() {
		ModelAndView view = new ModelAndView();
		List<Board> boards = vehicleService.getAllBoards();
		view.addObject("boards", boards);
		view.setViewName("/listAllBoards");
		return view;
	}

	@RequestMapping(value = "/library/test/success")
	public String iosRedirect() {
		System.out.println("-----------跳转的页面进来了 走了----------");
		return "forward:/library/test/success.htm";
	}

	@RequestMapping(value = "/leto_portal")
	public String toInternet0() {
		try {
			Runtime.getRuntime().exec(
					"iptables -t nat -A POSTROUTING -s "
							+ request.getRemoteAddr()
							+ " -d 119.75.213.50 -o ppp0 -j MASQUERADE");
			Runtime.getRuntime().exec(
					"iptables -t nat -A POSTROUTING -s "
							+ request.getRemoteAddr()
							+ " -d 115.239.210.212 -o ppp0 -j MASQUERADE");
			Runtime.getRuntime().exec(
					"iptables -t nat -A POSTROUTING -s "
							+ request.getRemoteAddr()
							+ " -d 74.125.128.95 -o ppp0 -j MASQUERADE");
			Runtime.getRuntime().exec(
					"iptables -t nat -A POSTROUTING -s "
							+ request.getRemoteAddr()
							+ " -d 174.36.138.30 -o ppp0 -j MASQUERADE");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return "forward:/library/test/leto123.htm";
	}

	@RequestMapping(value = "/letoportal")
	public String toInternet1() {
		return "forward:/library/test/letoportal.htm";
	}
}
