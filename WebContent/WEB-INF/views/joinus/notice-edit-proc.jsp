<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String code = request.getParameter("code");
	
	NoticeDao noticeDao = new MySQLNoticeDao();
	/* int result = noticeDao.add(title,content,"kkkkk"); */
	
	int result = noticeDao.update(title,content,code);
	System.out.println(result);
	if(result > 0)
		response.sendRedirect("notice-detail.jsp?c="+code);	
	
		

%>

