package com.newlecture.web.servlet;
import javax.imageio.ImageIO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.newlecture.web.dao.mysql.MySQLMemberDao;
import com.newlecture.web.data.dao.MemberDao;
import com.newlecture.web.data.entity.Member;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.List;


@WebServlet("/memberlist")
public class MemberList extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		
		String query = request.getParameter("query");
		
		System.out.println(query);
		
		response.setContentType("text/html; charset=UTF=8");
		
		PrintWriter out = response.getWriter();
		
		MemberDao memberDao = new MySQLMemberDao();
		List<Member> list = memberDao.getList(query);
		
		// ================== Model===================================================
		// 출력하기 위한 데이터 = 모델
		
		
		// ================== View ===================================================
		
		for (Member m : list) {
			out.println("ID는 "+m.getId()+"이고 패스워드는 "+m.getPwd()+"이다");
		}
		
		}
}