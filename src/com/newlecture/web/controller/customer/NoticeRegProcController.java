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
/*		File d = new File(path);
		if(!d.exists())
			d.mkdir();
*/	 	
				
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		System.out.println(title);
		System.out.println(content);
		
		out.println("1");
		
		
	 	/*NoticeDao noticeDao = new MySQLNoticeDao();
	 	
		int result = noticeDao.add(title,content,"kkkkk");
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
			response.sendRedirect("notice.jsp");	*/ 
		
	 	
			
	}
}
