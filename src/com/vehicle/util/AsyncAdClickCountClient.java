package com.vehicle.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClients;

public class AsyncAdClickCountClient {
	/**
	 * 
	 * @param adid 广告id
	 */
	public static void Aysncgo(int adid) {
		System.out.println("进入Aysncgo 广告id:" + adid);
		CloseableHttpAsyncClient httpclient = HttpAsyncClients.createDefault();
		httpclient.start();
		try {
			HttpUriRequest request;
			HttpResponse response;
			try {
				Properties prop = new Properties();
				// prop.load(new FileInputStream(
				// "D:/workspace/vehicle/config/config.properties"));
				prop.load(new FileInputStream(
						"/root/leto_software/config.properties"));
				String deviceid = prop.getProperty("deviceid");
				String serverip = prop.getProperty("serverip");
				String param = "adid=" + adid + "&deviceid=" + deviceid;
				@SuppressWarnings("deprecation")
				URI uri = URIUtils.createURI("http", serverip, -1,
						"/letoo/adClickCount.jsp", param, null);
				request = new HttpGet(uri);
				System.out.println(request.getURI());
				Future<HttpResponse> future = httpclient.execute(request, null);
				response = future.get();
				// 打印请求信息
				System.out.println(request.getRequestLine());
				System.out.println("Response: " + response.getStatusLine());
				System.out.println("Response: " + response.toString());
			} catch (URISyntaxException e) {
				e.printStackTrace();
			} catch (InterruptedException e) {
				e.printStackTrace();
			} catch (ExecutionException e) {
				e.printStackTrace();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("Shutting down");
		} finally {
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("Done");
	}

	public void Aysncgo1(int adid) {
		System.out.println("Aysncgo1");
	}
	// public static void main(final String[] args) {
	// int adid = 0;
	// new AsyncAdClickCountClient().Aysncgo(adid);
	// }
}
