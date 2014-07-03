package com.vehicle.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * 广告统计
 * 
 * @author louxuezheng 2014年6月12日
 */
public class AdClickCount extends Thread {
	private final String queryString;
	private final String urls;
	private static String url = null;
	private static String deviceid = null;
	private static String mac;

	public AdClickCount(int adid, int adSiteId, String ip) {
		if (null == url) {
			initUrl();
		}
		// queryString = "adid=" + adid + "&deviceid=" + deviceid;
		// /adCount-{groupId}-{boxId}-{adId}-{adSiteId}-{mac}
		System.out.println("-------ip---------" + ip);
		mac = new MACAddress(ip).getMac();
		queryString = "-1-" + deviceid + "-" + adid + "-"+adSiteId+"-" + mac;
		System.out.println("queryString = " + queryString);
		urls = "http://www.letu321.com/adCount" + queryString;
	}

	public void initUrl() {
		Properties prop = new Properties();
		try {
			Properties p = System.getProperties();
			// for (Enumeration e = p.propertyNames(); e.hasMoreElements();) {
			// String key = (String) e.nextElement();
			// System.out.println(key + "->" + p.getProperty(key));
			// }
			if ("x86".equals(p.getProperty("os.arch"))) {
				prop.load(new FileInputStream(
						"D:/workspace/vehicle/config/config.properties"));
			} else {
				prop.load(new FileInputStream(
						"/root/leto_software/config.properties"));
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		deviceid = prop.getProperty("boxid");
		// url = "http://" + prop.getProperty("serverip")+
		// "/letoo/adClickCount.jsp";
		url = "http://www.letu321.com/adCount";
	}

	@Override
	public void run() {
		System.out.println("----------\n");
		doGet();
		System.out.println("----------\n");
	}

	public void doGet() {
		try {
			// String urls = "http://www.letu321.com/adCount-1-6-1-1-macd";
			HttpRequester request = new HttpRequester();
			HttpRespons hr = request.sendGet(urls);

			System.out.println(hr.getUrlString());
			System.out.println(hr.getProtocol());
			System.out.println(hr.getHost());
			System.out.println(hr.getPort());
			System.out.println(hr.getContentEncoding());
			System.out.println(hr.getMethod());
			// System.out.println(hr.getContent());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}



}
