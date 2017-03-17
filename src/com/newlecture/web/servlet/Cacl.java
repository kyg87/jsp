package com.newlecture.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Cacl
 */
@WebServlet("/cacl")
public class Cacl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String _x = request.getParameter("x");
		String _y = request.getParameter("y");
		
		/*int x = Integer.parseInt(_x);
		int y = Integer.parseInt(_y);*/
		
		int x = 0;
		int y = 0;
		
		if(_x != null && !_x.equals(""))
			x = Integer.parseInt(_x);
		
		if(_y != null && !_y.equals(""))
			y = Integer.parseInt(_y);
			
		PrintWriter out = response.getWriter();
		
		out.println(x + y);
		
		out.write("<!DOCTYPE html>");
		out.write("<html>");
		out.write("<head>");
		out.write("<meta charset=\"UTF-8\">");
		out.write("<title>Insert title here</title>");
		out.write("</head>");
		out.write("<body>");
		out.write("   <form action=\"calc\" method=\"get\">");
		out.write("      <p>");
		out.write("         <label>x:</label>");
		out.write("         <input id=\"txt-x\"  name=\"x\"/>"); 
		out.write("         <label>y:</label>");
		out.write("         <input id=\"txt-y\" name=\"y\"/>");
		out.write("      </p>");
		out.write("      <p>");
		out.write("         sum = <input id=\"txt-sum\" value =\"");
		/*out.write(x+y);*/
		out.write("\" />");
		out.write("      </p>");
		out.write("      <p>");
		out.write("         <input id=\"btn-sum\" type=\"submit\" value=\"Sum\" />");
		out.write("      </p>");
		out.write("   </form>");
		out.write("</body>");
		out.write("</html>");
	}

}
