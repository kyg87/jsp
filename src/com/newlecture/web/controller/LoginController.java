package com.newlecture.web.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.newlecture.web.dao.mysql.MySQLMemberDao;
import com.newlecture.web.data.entity.Member;

@WebServlet("/account/login")
public class LoginController extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("/WEB-INF/views/account/login.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = request.getParameter("return-url");
		Member member = new MySQLMemberDao().get(id);
		
		HttpSession session = request.getSession();
		
		boolean validate = true;
		
		if(member == null)
		{
			validate = false;
		}
		else if(!member.getPwd().equals(pwd))
			validate = false;
		else
		{
			session.setAttribute("id", id);
			
		}
		
		if(validate)
		{
			
			
			if(url != null)
			{
				response.sendRedirect(url);
			}
			else
				response.sendRedirect("../index");
		}
		
		else{
			request.setAttribute("validate", validate);
			request.getRequestDispatcher("/WEB-INF/views/account/login.jsp").forward(request, response);
		}
		/*PrintWriter out = response.getWriter();
		
		out.println(id + " , " + pwd );
		*/
	}

}
