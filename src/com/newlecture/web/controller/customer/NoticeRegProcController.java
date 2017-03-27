package com.newlecture.web.controller.customer;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.dao.mysql.MySQLNoticeFileDao;
import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.dao.NoticeFileDao;
import com.newlecture.web.data.entity.NoticeFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/joinus/notice-reg-proc")
public class NoticeRegProcController extends HttpServlet{

	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/joinus/upload");
		out.println(path);

		MultipartRequest req = new MultipartRequest(request
				, path
				, 1024*1024*10
				, "UTF-8"
				, new DefaultFileRenamePolicy());

		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		System.out.println(title);
		System.out.println(content);
		
		out.println("1");
		
		

		
	 	
			
	}
}
