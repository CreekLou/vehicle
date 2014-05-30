package com.vehicle.util;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.URIException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.util.URIUtil;
import org.apache.commons.lang.StringUtils;

public class AsyncAdClickCountClient extends Thread {
	/**
	 * 
	 * @param adid 广告id
	 */
	// private final String url =
	// "http://159.226.94.32:8080/letoo/adClickCount.jsp";
	private final String queryString;
	private static String url = null;
	private static String deviceid = null;
	public AsyncAdClickCountClient(int adid) {
		if (null == url) {
			getUrl();
		}
		queryString = "adid=" + adid + "&deviceid=" + deviceid;
	}

	public void getUrl() {
		Properties prop = new Properties();
		try {
			Properties p = System.getProperties();
			if (p.getProperty("sun.desktop").equals("windows")) {
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

		deviceid = prop.getProperty("deviceid");
		url = "http://" + prop.getProperty("serverip")
				+ "/letoo/adClickCount.jsp";
	}
	@Override
	public void run() {
		// Aysncgo(adid);
		System.out.println("----------\n"
				+ doGet(url, queryString, "utf-8", true) + "\n--------------");
	}

	public static String doGet(String url, String queryString, String charset,
			boolean pretty) {
		StringBuffer response = new StringBuffer();
		HttpClient client = new HttpClient();
		HttpMethod method = new GetMethod(url);
		try {
			if (StringUtils.isNotBlank(queryString))
				// 对get请求参数做了http请求默认编码，好像没有任何问题，汉字编码后，就成为%式样的字符串
				method.setQueryString(URIUtil.encodeQuery(queryString));
			client.executeMethod(method);
			if (method.getStatusCode() == HttpStatus.SC_OK) {
				BufferedReader reader = new BufferedReader(
						new InputStreamReader(method.getResponseBodyAsStream(),
								charset));
				String line;
				while ((line = reader.readLine()) != null) {
					if (pretty)
						response.append(line).append(
								System.getProperty("line.separator"));
					else
						response.append(line);
				}
				reader.close();
			}
		} catch (URIException e) {
			// log.error("执行HTTP Get请求时，编码查询字符串“" + queryString + "”发生异常！", e);
			System.out.println("执行HTTP Get请求时，编码查询字符串“" + queryString
					+ "”发生异常！\n" + e);
		} catch (IOException e) {
			// log.error("执行HTTP Get请求" + url + "时，发生异常！", e);
			System.out.println("执行HTTP Get请求" + url + "时，发生异常！\n" + e);
		} finally {
			method.releaseConnection();
		}
		return response.toString();
	}

	public void Aysncgo1(int adid) {
		System.out.println("Aysncgo1");
	}

}
