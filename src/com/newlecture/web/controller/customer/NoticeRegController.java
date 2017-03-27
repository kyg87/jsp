package com.newlecture.web.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
