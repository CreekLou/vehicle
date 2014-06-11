package com.vehicle.message;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownServlet extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private String home_path;
	private String filename;
	private static String filePath;

	// Initialize global variables
	@Override
	public void init() throws ServletException {
	}

	// 加载配置文件 home_path
	public void loadConfig() {
		Properties p = new Properties();
		try {
			InputStream inputStream = this.getClass().getClassLoader()
					.getResourceAsStream("config.properties");
			p.load(inputStream);
			home_path = p.getProperty("home_path");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// Process the HTTP Get request
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loadConfig();
		response.setContentType(CONTENT_TYPE);

		// request.setCharacterEncoding("utf-8");
		// 解决中文乱码问题

		String appname = request.getParameter("appname");
		String apptype = request.getParameter("apptype");
		System.out.println("$$$$$$$******* appname &&&&&&&&&:" + appname);
		System.out.println("&&&&&&&&&&&&&& apptype &&&&&&&&&:" + apptype);
		String tmpPath = home_path + apptype + "/" + appname;
		try {
			File f = new File(tmpPath);
			if (f.isDirectory()) {
				File[] flist = f.listFiles();
				for (int i = 0; i < flist.length; i++) {
					if (flist[i].getName().contains(".apk")) {
						filename = flist[i].getName();   //譬如 wandoujia.apk
						filePath = flist[i].getAbsolutePath();
						System.out.println("apk文件名为： " + filename);
						System.out.println(appname + " 的apk路径为： " + filePath);
					}
				}
			} else {
				System.out.println("！！文件组织格式异常！！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// String filePath = "/usr/local/apache-tomcat/webapps/ROOT/data/app/" +
		// apptype + "/" + appname + "/" + filename;
		System.out.println("######## FilePath %%%%%%%:::" + filePath);
		// 创建file对象
		File file = new File(filePath);
		// 设置response的编码方式---应用下载
		response.setContentType("application/x-msdownload");
		// 写明要下载的文件的大小
		response.setContentLength((int) file.length());
		// 设置附加文件名
		// response.setHeader("Content-Disposition","attachment;filename="+filename);
		// 解决中文乱码
		response.setHeader("Content-Disposition", "attachment;filename="
				+ new String(filename.getBytes("UTF-8"), "iso-8859-1"));

		FileInputStream fis = null;
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			bos = new BufferedOutputStream(response.getOutputStream());

			byte[] buff = new byte[2048];
			int bytesRead;
			int bytesSum = 0;

			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				// while ((bytesRead = bis.read(buff, 0, buff.length)) > 0) {
				bytesSum += bytesRead;
				// System.out.println("#######已经读取文件 " + filename + "  "
				// + bytesSum);
				bos.write(buff, 0, bytesRead);
			}
			bos.flush(); // 将写入到客户端的内存的数据,刷新到磁盘
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("--------发生IO异常:" + e);
		}

	}

	// Process the HTTP Post request
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	// Clean up resources
	@Override
	public void destroy() {
	}
}
