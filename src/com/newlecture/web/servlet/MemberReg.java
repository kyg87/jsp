package com.newlecture.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member-reg")
public class MemberReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String[] hobbies = request.getParameterValues("hobbies");
		String hobby = request.getParameter("hobby");
		
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		
		for (String string : hobbies) {
			System.out.println(string);
		}
		System.out.println(hobby);
	}

}
