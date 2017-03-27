package com.newlecture.web.controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.view.NoticeView;

/**
 * Servlet implementation class NoticeEditController
 */
@WebServlet("/joinus/notice-edit")
public class NoticeEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String code = request.getParameter("c");
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		NoticeDao dao = new MySQLNoticeDao();
		
		NoticeView n = dao.get(code);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null){
			response.sendRedirect("../account/login?return-url=../joinus/notice-edit?c="+code);
		}
		else if(!session.getAttribute("id").equals( n.getWriter()))
		{
			response.getWriter().println("<script> alert('!!!!!'); location.href = 'notice-detail?c=" + code+"';</script>");
		}
		else{
			
			request.setAttribute("n", n);
			
			request.getRequestDispatcher("/WEB-INF/views/joinus/notice-edit.jsp").forward(request, response);
		}
			
		
		


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String code = request.getParameter("code");
		
		NoticeDao noticeDao = new MySQLNoticeDao();
		/* int result = noticeDao.add(title,content,"kkkkk"); */
		
		int result = noticeDao.update(title,content,code);
		System.out.println(result);
		if(result > 0)
			response.sendRedirect("notice-detail.jsp?c="+code);	
		
			
	}

}
