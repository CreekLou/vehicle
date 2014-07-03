package com.vehicle.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 * APP统计
 * 
 * @author louxuezheng 2014年6月13日
 */
public class AppDownCount extends Thread {
	private final String queryString;
	private final String urls;
	private static String url = null;
	private static String deviceid = null;
	private static String mac;
	private int count;
	public AppDownCount(String appName, String ip) {
		if (null == url) {
			initUrl();
		}
		// queryString = "adid=" + adid + "&deviceid=" + deviceid;
		// /adCount-{groupId}-{boxId}-{adId}-{adSiteId}-{mac}
		System.out.println("-------ip---------" + ip);
		mac = new MACAddress(ip).getMac();
		queryString = "-" + deviceid + "-" + appName + "-" + mac;
		System.out.println("queryString = " + queryString);
		urls = "http://www.letu321.com/appCount" + queryString;
	}

	public void initUrl() {
		Properties prop = new Properties();
		try {
			Properties p = System.getProperties();
			String team = p.getProperty("sun.desktop");
			System.out.println("------------team-------" + team);
			if ("windows".equals(p.getProperty("sun.desktop"))) {
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
		System.out.println("boxid = " + deviceid);
	}

	@Override
	public void run() {
		System.out.println("----------\n");
		doGet();
		System.out.println("----------\n");
	}

	public void doGet() {
		try {
			HttpRequester request = new HttpRequester();
			HttpRespons hr = request.sendGet(urls);
			String content = hr.getContent().trim();
			System.out.println("hr.getContent() = " + hr.getContent()
					+ " size=" + hr.getContent().length() + " size2 = "
					+ content.length());
			count = Integer.parseInt(content);
			System.out.println("download count = " + count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getCount() {
		return this.count;
	}
}
