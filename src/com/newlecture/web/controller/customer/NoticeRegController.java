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
import javax.servlet.http.HttpSession;

import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.dao.mysql.MySQLNoticeFileDao;
import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.dao.NoticeFileDao;
import com.newlecture.web.data.entity.NoticeFile;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeRegController
 */
@WebServlet("/joinus/notice-reg")
public class NoticeRegController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null)
			response.sendRedirect("../account/login?return-url=../joinus/notice-reg");
			/*response.getWriter().println("<script> alert('!!!!!'); location.href = ../account/login </script>");*/
		else
			request.getRequestDispatcher("/WEB-INF/views/joinus/notice-reg.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/joinus/upload");
		out.println(path);
		
		File d = new File(path);
		//파일 업로드할 경로가 만들어지지 않는다면 만들어야함
		if(!d.exists())//경로가 존재하지 않는다면
			d.mkdir();
		
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
		HttpSession session = request.getSession();
		System.out.println("session : " + session.getAttribute("id"));
		NoticeDao noticeDao = new MySQLNoticeDao();
			 	
		int result = noticeDao.add(title,content,(String)session.getAttribute("id"));
		String noticeCode = noticeDao.lastCode();
		
		NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
		
		Enumeration fnames = req.getFileNames();
		
		while(fnames.hasMoreElements()){
			String f = (String)fnames.nextElement();
			String fname = req.getFilesystemName(f);
			
			NoticeFile file = new NoticeFile();
			
			file.setNoticeCode(noticeCode);
			file.setSrc(fname);
			
			noticeFileDao.add(file);
			
			out.println("<br/>" + f);
			out.println("<br/>" + fname);
			
		}
		
		out.println("<br/>" + title);
		out.println("<br/>" + content); 
		
		
		System.out.println(result);
			if(result > 0)
			response.sendRedirect("notice");	
	}

}
