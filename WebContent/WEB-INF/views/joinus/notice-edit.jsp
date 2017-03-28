<%@page import="com.newlecture.web.data.view.NoticeView"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<main id="main">
      
            <h2 class="main-title">공지사항 등록</h2>
            
            <div class="breadcrumb">
               <h3 class="hidden">현재경로</h3>
               <ul>
                  <li>home</li>
                  <li>고객센터</li>
                  <li>공지사항</li>
               </ul>
            </div>
               
            <form  method="post">
	            <table border="1">
	               <tbody>
	                  <tr>
	                     <th>제목</th>
	                     <td><input name ="title" type ="text" value = "${n.title}"/></td>
	                  </tr>
					 <tr>
	                     <th>작성자</th>
	                     <td>${n.writer }</td>
	                  </tr>
	                  <tr>
	                     <th>작성일</th>
	                     <td>${n.regDate}</td>
	                  </tr>
	                  <tr>
	                     <th>조회수</th>
	                     <td>${n.hit}</td>
	                  </tr>
	                  <tr>
	                     <td colspan="2">
	                     <textarea rows="20" cols="80" name = "content">${n.content}</textarea>
	                     </td>
	                  </tr>
	     
	               </tbody>
	            </table>
	            <div>

	               <input type ="hidden" name ="code" value ="${parm.code}"/>   
	           
	               <input type ="submit" value ="저장"/><!--  href="notice-edit.jsp">수정</a> -->
	               <a href="notice-detail?c=${parm.code }"> 취소 </a>
	            </div>
            </form>            
         </main>