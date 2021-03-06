<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   
/* 	String code = request.getParameter("c");

	NoticeDao dao = new MySQLNoticeDao();
	
	NoticeView n = dao.get(code);
	
	NoticeView prev = dao.prev(code);
	NoticeView next = dao.next(code);
	
	NoticeFileDao noticeFileDao = new MySQLNoticeFileDao();
	
	List<NoticeFile> list = noticeFileDao.getList(n.getCode());
	
	System.out.println(list.size());
/* 	System.out.println(dao.prev(code).getCode());
	System.out.println(dao.next(code).getCode()); */ 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/reset.css" type="text/css" rel="stylesheet" />
<link href="../css/customer/style.css" type="text/css" rel="stylesheet" />
<script src="../js/customer/notice.js" ></script>
</head>
<body>
   <!-- ------header--------------------------------------------------- -->
   <header id="header">
      <div class="content-container">
         <h1 id="logo">
            <img src="../images/logo.png" alt="뉴렉처 온라인" />
         </h1>
      
         <section>
            <h1 class="hidden">헤더</h1>
         
            <nav id="main-menu" class="hr-menu">
               <h1 class="">메인메뉴
                  <input type="button" value="클릭"    id="btn-result" />
               </h1>                           
               <ul>
                  <li><a href="">학습가이드</a></li>
                  <li><a href="">뉴렉과정</a></li>
                  <li><a href="">강좌선택</a></li>
               </ul>
            </nav>
            
            <div id="lecture-search-form">
               <h3 class="hidden">강좌검색폼</h3>
               <form>
                  <fieldset>
                     <legend class="hidden">검색 필드</legend>
                     <label>과정검색</label>
                     <input type="text" />
                     <input class="lecture-search-botton" type="submit" value="검색"/>
                  </fieldset>
               </form>
            </div>
         
            <nav id="account-menu" class="hr-menu">
               <h1 class="hidden">계정메뉴</h1>
               <ul>
                  <li class="first"><a href="../index.html">HOME</a></li>
                  <li><a href="../joinus/login.html">newlec 로그아웃</a></li>
                  <li>회원가입</li>
               </ul>
            </nav>
         
            <nav id="member-menu" class="hr-menu">
               <h1 class="hidden">회원메뉴</h1>
               <ul>
                  <li class="first">마이페이지</li>
                  <li><a href="">고객센터</a></li>
               </ul>
            </nav>
         </section>
         
      </div>
   </header>
   <!-- ------visual--------------------------------------------------- -->
   <div id="visual">
      <div class="content-container">
      <!-- visual -->         
      </div>
   </div>
   <!-- ------body--------------------------------------------------- -->
   <div id="body">
      <div class="content-container clearfix">
         <aside id="aside">
                                    
            <h1 class="aside-title aside-main-title aside-margin">고객센터</h1>
         
            <nav>
               <h1 class="hidden">고객센터메뉴</h1>
               <ul>
                  <li class="aside-menu-item"><a class="aside-menu-item-link" href="">공지사항</a></li>
                  <li class="aside-menu-item"><a class="aside-menu-item-link" href="">1:1고객문의</a></li>
                  <li class="aside-menu-item"><a class="aside-menu-item-link" href="">학습안내</a></li>
               </ul>
            </nav>
         
            <nav>
               <h1 class="aside-title margin">추천사이트</h1>
               <ul class="margin">
                  <li><a href=""><img src="../images/answeris.png" alt="앤서이즈" /></a></li>
                  <li><a href=""><img src="../images/w3c.png" alt="w3c" /></a></li>
                  <li><a href=""><img src="../images/microsoft.png" alt="마이크로소프트" /></a></li>
               </ul>
            </nav>
         </aside>
      
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
               
            <form action="notice-reg-proc.jsp" method="post">
            <table border="1">
               <tbody>
                  <tr>
                     <th>제목</th>
                     <td>${n.title}</td>
                  </tr>
				 <tr>
                     <th>작성자</th>
                     <td>${n.writer}</td>
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
	                  
                  <tr>
                     <th>첨부파일</th>
          <%--            <%
                  
                     String hbs = "롤,코딩,자기,먹기";
                     
                     pageContext.setAttribute("hbs",hbs);
                     
                     %>
             		<c:forTokens var="hb" items="${hbs }" delims=",">
             		
             		${hb }<br/>
             		</c:forTokens> --%>
                     
                     
                     <c:forEach var="f" items="${list}">
                     
                     <a href ="upload/${f.src }">${f.src}</a>
                     
                     </c:forEach>
                  </tr>
                  <tr>
                     <td colspan="2"></td>
                  </tr>
     
               </tbody>
            </table>
            <div>
               <a href="notice">목록</a>      
               <a href="notice-edit?c=${n.code}">수정</a>
               <a href="notice-del?c=${n.code}">삭제</a>
            </div>
				<div>
					<ul>
						<li>
							<span>이전글:</span>
							<c:if test="${ empty prev}">
							<span>이전글이 없습니다.</span>
							</c:if>
							<c:if test="${not next}">
							<a href="notice-detail?c=${prev.code}">${prev["title"]}</a>
							</c:if>
						</li>
						<li>
							
							<span>다음:</span>
							<c:if test="${ empty next}">
							<span>다음 글이 없습니다.</span>
							</c:if>
							<c:if test="${not next}">
							<a href="notice-detail?c=${next.code}">${next["title"]}</a>
							</c:if>
						</li>
					</ul>
				</div>
			</form>            
         </main>
         
      </div>
   </div>
   <!-- ------footer--------------------------------------------------- -->
   <footer id="footer">
      <div class="content-container">
         <h2>회사정보</h2>
         <div>Copyright ⓒ newlecture.com 2012-2014 All Right Reserved.
            Contact admin@newlecture.com for more information</div>
      </div>
   </footer>
   

</body>
</html>