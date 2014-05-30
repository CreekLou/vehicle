package com.vehicle.message;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownServlet extends HttpServlet {
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

	// Initialize global variables
	@Override
	public void init() throws ServletException {
	}

	// Process the HTTP Get request
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType(CONTENT_TYPE);
		// 得到下载文件的名字
		// String filename=request.getParameter("filename");
		// request.setCharacterEncoding("utf-8");
		// 解决中文乱码问题

		String appname = request.getParameter("appname");
		String apptype = request.getParameter("apptype");
		String filename = request.getParameter("filename");
		System.out.println("**********Filename*******:" + filename);
		// String filePath = "D:\\workspace\\vehicle\\WebContent\\data\\app\\"
		// + apptype + "\\" + appname + "\\" + filename;
		String filePath = "/usr/local/apache-tomcat/webapps/ROOT/data/app/"
				+ apptype + "/" + appname + "/" + filename;
		// System.out.println("################## FilePath %%%%%%%%%%:::"
		// + filePath);
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

		// // 读出文件到i/o流
		// FileInputStream fis = new FileInputStream(file);
		// BufferedInputStream buff = new BufferedInputStream(fis);
		// byte[] b = new byte[1024];// 相当于我们的缓存
		// long k = 0;// 该值用于计算当前实际下载了多少字节
		// OutputStream myout = response.getOutputStream();
		// 从response对象中得到输出流,准备下载

		// 开始循环下载
		// while (k < file.length()) {
		// int j = buff.read(b, 0, 1024);
		// k += j;
		// // 将b中的数据写到客户端的内存
		// myout.write(b, 0, j);
		// }
		//
		// 将写入到客户端的内存的数据,刷新到磁盘
		// myout.flush();

		// 读文件I/O InputStream/OutputStream
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
				bytesSum += bytesRead;
				System.out.println("#######已经读取文件 " + filename + "  "
						+ bytesSum);
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
