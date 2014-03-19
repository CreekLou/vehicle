
package com.vehicle.web;

import java.util.List;

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

	/**
	 * 列出所有的模块
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView listAllBoards() {
		ModelAndView view =new ModelAndView();
		List<Board> boards = vehicleService.getAllBoards();
		view.addObject("boards", boards);
		view.setViewName("/listAllBoards");
		return view;
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
}
