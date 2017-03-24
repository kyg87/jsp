<%@page import="com.google.gson.Gson"%>
<%@page import="com.newlecture.web.data.view.NoticeView"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");
	
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
	
	Thread.sleep(3000);
	
	Gson gson = new Gson();
	String json = gson.toJson(list);
	
%>
<%=json %>
	
