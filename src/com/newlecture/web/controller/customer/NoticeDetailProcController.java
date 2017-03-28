package com.newlecture.web.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.newlecture.web.data.view.NoticeView;

@WebServlet("/joinus/notice-detail")
public class NoticeDetailProcController extends HttpServlet{
	   
	@Override
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("c");

		NoticeDao dao = new MySQLNoticeDao();
		
		NoticeView n = dao.get(code);
		
		NoticeView prev = dao.prev(code);
		NoticeView next = dao.next(code);
		
		NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
		
		List<NoticeFile> list = noticeFileDao.getList(n.getCode());
		
		request.setAttribute("n", n);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);
		request.setAttribute("list", list);
		/*request.getRequestDispatcher("/WEB-INF/views/joinus/notice-reg.jsp").forward(request, response);*/
		request.getRequestDispatcher("/WEB-INF/views/joinus/notice-detail.jsp").forward(request, response);
		}
/*@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

	String code = request.getParameter("c");

	NoticeDao dao = new MySQLNoticeDao();
	
	NoticeView n = dao.get(code);
	
	NoticeView prev = dao.prev(code);
	NoticeView next = dao.next(code);
	
	NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
	
	List<NoticeFile> list = noticeFileDao.getList(n.getCode());
	
	request.setAttribute("n", n);
	request.setAttribute("prev", prev);
	request.setAttribute("next", next);
	request.setAttribute("list", list);
	request.getRequestDispatcher("/WEB-INF/views/joinus/notice-reg.jsp").forward(request, response);
	request.getRequestDispatcher("/WEB-INF/views/joinus/notice-detail.jsp").forward(request, response);
 }*/			
}
