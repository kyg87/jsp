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

@WebServlet("/joinus/notice-reg-ajax")
public class NoticeRegAjaxController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/joinus/upload");
//		out.println(path);
		
		
		MultipartRequest req = new MultipartRequest(request
		, path
		, 1024*1024*10
		, "UTF-8"
		, new DefaultFileRenamePolicy());
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		/*String title = request.getParameter("title");
		String content = request.getParameter("content");*/
		
		System.out.println(title);
		System.out.println(content);
		
		PrintWriter out = response.getWriter();
		out.println("1");
		
		/*PrintWriter out = response.getWriter();
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/customer/upload");
		out.println(path);
		
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();
		
		MultipartRequest req = new MultipartRequest(request
		, path
		, 1024*1024*10
		, "UTF-8"
		, new DefaultFileRenamePolicy());
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		out.println("<br/>" + title);
		out.println("<br/>" + content);
		
		NoticeDao noticeDao = new MySQLNoticeDao();
		
		
		//트랜잭션 시작
		int result = noticeDao.add(title, content, "woogisky");
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
		//트랜잭션 끝
		
		
		
		
		if(result>0) {
			response.sendRedirect("notice.jsp");
		} else {
			
		}*/

		
	 	
	}
}
