
package com.vehicle.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vehicle.domain.Ad;
import com.vehicle.domain.Board;
import com.vehicle.service.AdService;
import com.vehicle.service.UserService;
import com.vehicle.service.VehicleService;
import com.vehicle.util.AdClickCount;

/**
 * 
 *<br>
 * <b>类描述:</b>
 * 
 * <pre>
 *   主页管理，这部分功能由论坛管理员操作
 *</pre>
 * 
 * @see
 *@since
 */

/**
 * @author louxuezheng
 */
@Controller
public class ForumManageController extends BaseController {
	@Autowired
	private VehicleService vehicleService;
	@Autowired
	private UserService userService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdService adService;
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView listAds(HttpServletRequest request) {

		// new AsyncAdClickCountClient(0).start();
		// System.out.println(" listads");
		Thread t = new AdClickCount(1, 0, request.getRemoteAddr());
		t.start();
		Ad ad = adService.getRandomAd(0);
		System.out.println(" ad.adId = " + ad.getAdId());
		String ad_url = ad.getAdId() + "." + ad.getSufName();
		new AdClickCount(ad.getAdId().intValue(), 0, request.getRemoteAddr())
				.start();
		ModelAndView view = new ModelAndView();
		if (ad.getAdId() == 0) {
			view.addObject("ad_url", "default_0.jpg");
		} else {
			view.addObject("ad_url", ad_url);
		}
		view.setViewName("/letuads");
		return view;
	}
	@RequestMapping(value = "/vehicle/index", method = RequestMethod.GET)
	public ModelAndView listIndex(HttpServletRequest request) {
		// new AsyncAdClickCountClient(1).start();

		ModelAndView view = new ModelAndView();
		List<Board> boards = vehicleService.getAllBoards();
		Ad ad = adService.getRandomAd(1);
		System.out.println(" ad.adId = " + ad.getAdId());
		String ad_url = ad.getAdId() + "." + ad.getSufName();
		new AdClickCount(ad.getAdId().intValue(), 1, request.getRemoteAddr())
				.start();
		if (ad.getAdId() == 0) {
			view.addObject("ad_url", "default_1.jpg");
		} else {
			view.addObject("ad_url", ad_url);
		}
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
