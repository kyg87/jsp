package com.newlecture.web.controller.customer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.newlecture.web.dao.mysql.MySQLNoticeDao;
import com.newlecture.web.data.dao.NoticeDao;
import com.newlecture.web.data.view.NoticeView;

@WebServlet("/joinus/notice")
public class NoticeController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String _page = request.getParameter("p");
		String _field = request.getParameter("f");
		String _query = request.getParameter("q");
		
		System.out.println(_page);
		System.out.println(_field);
		System.out.println(_query);
		
		int pg = 1;
		String f = "TITLE";
		String query = "";
		
		if(_page != null && !_page.equals("")){
			pg = Integer.parseInt(_page);
		}
		if(_field != null && !_field.equals("")){
			f = _field;
		}
		if(_query != null && !_query.equals("")){
			query = _query;
		}

		NoticeDao dao = new MySQLNoticeDao();
		
		List<NoticeView> list = dao.getList(pg,f,query);
		
		int size = dao.getSize(f,query);
		int last = (size %10) > 0 ? size/10 + 1: size/10;
		
		System.out.println(size);
		System.out.println(last);
		request.setAttribute("list", list);
		request.setAttribute("size", size);
		request.setAttribute("last", last);
	/*	request.setAttribute("f", f);
		request.setAttribute("query", query);*/
		
		request.getRequestDispatcher("notice.jsp").forward(request, response);
		
	}
}
