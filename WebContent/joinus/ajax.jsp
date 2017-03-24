<%@page import="com.newlecture.web.data.view.NoticeView"%>
<%@page import="java.util.List"%>
<%@page import="com.newlecture.web.data.dao.NoticeDao"%>
<%@page import="com.newlecture.web.dao.mysql.MySQLNoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	//../notice.jps?p=5
	String _page = request.getParameter("p");
	String _field = request.getParameter("f");
	String _query = request.getParameter("q");

	int pg = 1;
	String field = "TITLE";
	String query = "";
	
	if(_page != null && !_page.equals(""))//값이 넘겨 진 것이 있다면
		pg = Integer.parseInt(_page);
	
	if(_field != null && !_field.equals(""))
		field = _field;
	
	if(_query != null && !_query.equals(""))
		query = _query;
	
	System.out.println(query);
	
	NoticeDao noticeDao = new MySQLNoticeDao();
	List<NoticeView> list = noticeDao.getList(pg, field, query);
	
	int size = noticeDao.getSize(field, query);
%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- when you are going to use bootstrap, need to type these -->
<!-- <link href="../css/reset.css" type="text/css" rel="stylesheet"/>
Latest compiled and minified CSS
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
Optional theme
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
Latest compiled and minified JavaScript
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->

<link href="../css/customer/style.css" type="text/css" rel="stylesheet" />

<script src="../js/customer/notice.js">
	
	/* //html id 명명 규칙을 지키면서 하기 위해서는 함수 안에 함수를 넣고 전역 변수를 선언하는 것이 좋음
	
	window.onload = function(){
		var btnResult = document.getElementById("btn-result");
		btnResult.onclick = printResult;
		
		function printResult(){
			var x, y;
			
			x = prompt("x 값을 입력하세요", 0);
			y = prompt("y 값을 입력하세요", 0);
			
			x = parseInt(x);
			y = parseInt(y);
			
			btnPrint.value = x+y;
		}
	} */
	
	
	/* function printResult(){
		var x, y;
		
		x = prompt("x 값을 입력하세요", 0);
		y = prompt("y 값을 입력하세요", 0);
		
		x = parseInt(x);
		y = parseInt(y);
		
		btnPrint.value = x+y;
	}
	
	//스크립트와 html을 분리하기 위해 아이디만 부여하고 함수도 스크립트 내에서 불러올 수 있다
	//로드 된 이후에 불러야 하기 때문에 btnPrint.onclick = printResult; 를 아래와 같이 써야한다
	
	window.onload = function(){
		btnPrint.onclick = printResult;
	} */
	
	
	
	
	/* function f1(){
		var a = 1
		
		return function (){
			return a++;
		};
	}
	
	var f2 = f1();
	f2 = null; */
	
	
	/* var x, y;
	
	x = prompt("x 값을 입력하세요", 0);
	y = prompt("y 값을 입력하세요", 0);
	alert(typeof x);
	
	x = parseint(x);
	y = paresint(y);
	alert(typeof x);
	
	alert(x+y); */
	
	
	
	/* var x = 3;
	document.write(x); */
	
	
	
	
	/* function f1(){
		var a = 1;
		
		return function f2(){
			return a;
		}
	}
	
	//객체를 받은 것 f는!!
	var f = f1();
	var a = f();
	alert(a); */
	
	
	
	
	//개발자 도구에서 새로고침하면 오류를 찾아낼 수 있음
	//function안에 var를 빼면 오류가 발생안함
	//근데 함수 호출을 주석처리하면 또 오류가 발생함
	//var를 빼면 글로벌 객체의 a가 생김
	//그러나 글로벌 변수를 최대한 안쓰는게 좋음
	
	//function f1(){
	//	/* var */ a = 1;
	//}
	///* f1(); */
	//alert(a);
	
	
	
	//에러발생
	/* function f1(){
		var a = 1;
	}
	f1();
	alert(a); */
	
	
	//undefined
	/* alert(a);
	{
		var a = 1;
	} */
	
	
	//자바에서는 불가능하긴 하지만 자스에서는 가능
	/* {
		var a = 1;
	}
	alert(a);
	
	var a = 1;
	var a = 2;
	alert(a); */
	
	
	//2017.3.2 수업자
	/* var add = function(){
		
		var sum = 0;
		for (var i in arguments)
			sum += arguments[i];
		
		return sum;
	}
	
	alert(add(3,5,7)); */
	
	//자바스크립트는 객체 지향 언어이긴 함. 다만 첫번째 방법은 사용하지 않는다.
	/* function add( x, y){
		return x+y;
	}
	alert(add(10,10));
	
	var add = function(x, y){
		return x+y;
	}
	alert(add(5,5));
	
	var add = new Function("x, y", "return x+y;");
	alert(add(3,4)); */
	
	
	//세미콜른을 안해도 가능하지만 쓰는게 좋다
	/* var x
	var y
	x = 3
	y = 5
	alert(x+y) */

	//제어구조 중 for in
	/* var ar = ["철수", "영희", "맹구", "동천"];
	
	var exam = {
			kor:30,
			eng:40,
			math:50
	};
	
	for (i in exam)
		alert(exam[i]);
	
	for (i in ar)
		alert(i);
	
	for(var i in ar)
		alert(ar[i]); */
	
	
	/* var exam = {};
	exam.kor = 30;
	exam.eng = 70;
	exam.math = 80;
	exam["kor a"] = 100;
	
	alert(exam.kor + exam.eng);
	
	exam["kor a"] = 20;
	alert(exam["kor a"] + exam.eng);

	var student = {
			name : "홍길동",
			age : 19,
			"취미" : ["코딩", "공부", "수학"]
	};
	
	alert(student["취미"][2] ); */	
</script>
<script>

</script>

</head>

<body>



	<!-- header------------------------------------------------------------- -->
	<header id="header">
		<div class="content-container">
			<h1 id="logo">
				<img src="../images/logo.png" />
			</h1>


			<section>
				<h1 class="hidden">Header</h1>


				<nav id="main-menu" class="hr-menu">
					<h1 class="">
						메인메뉴 <input type="button" value="클릭" id="btn-result" />

					</h1>

					<ul>
						<li><a href="">학습가이드</a></li>
						<li><a href="">뉴렉과정</a></li>
						<li><a href="">강좌선택</a></li>
					</ul>
				</nav>


				<div id="lecture-search-form" class="hr-menu">
					<h3 class="hidden">강좌검색폼</h3>
					<form>
						<fieldset>
							<legend class="hidden">검색 필드</legend>
							<label>과정검색</label> <input type="text" value="" /> <input
								class="lecture-search-button" type="submit" value="검색" />
						</fieldset>
					</form>
				</div>


				<nav id="account-menu" class="hr-menu">
					<h1 class="hidden">계정메뉴</h1>
					<ul>
						<li><a href="../index.html">HOME</a></li>
						<li><a href="../joinus/login.html">로그인</a></li>
						<li><a href="../joinus/agree.html">회원가입</a></li>
					</ul>
				</nav>


				<nav id="member-menu" class="hr-menu">
					<h1 class="hidden">회원메뉴</h1>
					<ul>
						<li>마이페이지</li>
						<li><a href="">고객센터</a></li>
					</ul>
				</nav>
			</section>

		</div>
	</header>


	<!-- visual------------------------------------------------------------- -->
	<div id="visual">
		<div class="content-container">
			<!-- 	visual image -->
		</div>
	</div>


	<!-- section------------------------------------------------------------- -->
	<div id='body'>
		<div class="content-container clearfix">
			<aside id="aside">
				<!-- aside 대신 section 써도 되지만 보다 더 semantic 하게 aside를 씀. 또한 aside 자체는 식별자의 역할을 할 수 없음. 왜냐면 다른 aside가 올 수 있기 때문  -->
				<h1 class="aside-title aside-main-title aside-margin">고객센터</h1>
				<!-- section으로 만들면 h2가 h1으로 대체 사용 가능 -->

				<nav>
					<h1 class="hidden">고객센터메뉴</h1>
					<ul>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">공지사항</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">1:1고객문의</a></li>
						<li class="aside-menu-item"><a class="aside-menu-item-link"
							href="">학습안내</a></li>
					</ul>
				</nav>


				<nav>
					<h1 class="aside-title margin">추천사이트</h1>
					<ul class="margin">
						<li><a href=""><img src="../images/answeris.png"
								alt="앤서이즈" /></a></li>
						<li><a href=""><img src="../images/w3c.png" alt="W3C" /></a></li>
						<li><a href=""><img src="../images/microsoft.png"
								alt="마이크로소프트" /></a></li>
					</ul>
				</nav>
			</aside>


			<!-- main------------------------------------------------------------- -->
			<main id="main">

			<h2 class="main-title">
				공지사항[<%=size%>]
			</h2>

			<div class="breadcrumb">
				<h3 class="hidden">공지사항메뉴</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>공지사항</li>
				</ul>
			</div>

			<h3 class="hidden">공지사항검색폼</h3>
			<form class="main-margin">
				<fieldset>
					<legend class="hidden">검색필드</legend>
					<label class="hidden">검색분류</label> <select name="f">
						<option value="TITLE" <%if(field.equals("TITLE")){%> selected
							<%}%>>제목</option>
						<option value="CONTENT" <%if(field.equals("CONTENT")){%> selected
							<%}%>>내용</option>
					</select> <label class="hidden">검색어</label> <input name="q" type="text"
						value="<%=query%>" placeholder="검색어를 입력하세요" /> <input
						class="btn btn-search" type="submit" value="검색" /> <input
						type="hidden" name="p" value="1" />
				</fieldset>
			</form>

			<div class="notice margin">
				<h3 class="hidden">공지사항표</h3>
				<script>
							window.addEventListener("load", function(e) {
							
								var moreButton = document.querySelector("#more-button");
								var regButton = document.querySelector("#reg-button");
								/* var notices = [
									{code:"1", title:"오오오"},
									{code:"2", title:"요요요"},
									{code:"3", title:"유유유"}
									]; */
								
								regButton.onclick = function(){
									var request = new window.XMLHttpRequest();
									request.open("GET", "notice-reg-partial.jsp", true);
									//request.onreadystatechange = function(){
									request.onload = function(){
										
										var screen = document.createElement("div");
										
										screen.className = "screen";
										screen.style.width = "100%";
										screen.style.height = "100%";
										screen.style.position = "fixed";
										screen.style.left = "0px";
										screen.style.top = "0px";
										screen.style.background = "#000";
										screen.style.opacity = "0.5";	

										document.body.appendChild(screen);
										
										var formScreen = document.createElement("div");
										formScreen.className = "formScreen";
										formScreen.style.width = "100%";
										formScreen.style.height = "100%";
										formScreen.style.position = "fixed";
										formScreen.style.left = "0px";
										formScreen.style.top = "0px";
										
										document.body.appendChild(formScreen);
										
										var formText = request.responseText;
										
										formScreen.innerHTML += formText;

										var form = formScreen.querySelector("form");
										form.className = "form";
										form.style.background = "#fff";
										form.style.width = "600px";
										form.style.margin = "auto";
										form.style.borderRadius = "2px";
										form.style.position = "relative";
										form.style.top = "50%";
										form.style.transform = "translateY(-50%)";

										var script = formScreen.querySelector("script");
										
										eval(script.textContent);
										
									};
									request.send();

									return false;
								}

								
								moreButton.onclick = function(){
									
									/* var data = eval('[{code:"1", title:"오오오"},{code:"2", title:"요요요"},{code:"3", title:"유유유"}]'); */
									//JSON 쓸 때는 code, title에 ""를 붙여야 한다
									/* var data = JSON.parse('[{"code":"1", "title":"오오오"},{"code":"2", "title":"요요요"},{"code":"3", "title":"유유유"}]');
									
									alert(data[1].title); */
										
									/* var request = new ActiveXObject("Microsoft.XMLHTTP"); */
									var request = new window.XMLHttpRequest();
									request.open("GET", "ajax-data.jsp?p=2", true);
									//request.onreadystatechange = function(){
									request.onload = function(){	
										//if(request.readyState ==4) {
										var notices = JSON.parse(request.responseText);
										
										var template = document.querySelector("#notice-row");
										
										for(var i in notices){
											var tbody = document.querySelector(".notice-table tbody");
											var tds = template.content.querySelectorAll("td");
											
											tds[0].innerText = notices[i].code;
											tds[1].innerText = notices[i].title;
											
											var clone = document.importNode(template.content, true);
											tbody.appendChild(clone);
										}; 	
										
										document.body.removeChild(screen);
										
										//};
									};
									request.send();
									
									var screen = document.createElement("div");
									screen.style.width = "100%";
									screen.style.height = "100%";
									screen.style.position = "fixed";
									screen.style.left = "0px";
									screen.style.top = "0px";
									screen.style.background = "#000";
									screen.style.opacity = "0.5";
									
									document.body.appendChild(screen);
									
									/* var notices = JSON.parse(request.responseText);
									
									var template = document.querySelector("#notice-row");
									
									for(var i in notices){
										var tbody = document.querySelector(".notice-table tbody");
										var tds = template.content.querySelectorAll("td");
										
										tds[0].innerText = notices[i].code;
										tds[1].innerText = notices[i].title;
										
										var clone = document.importNode(template.content, true);
										tbody.appendChild(clone);
									}; */
								};
								
							});
						
						</script>


				<table class="table notice-table">

					<thead>
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>
					</thead>

					<tbody>

						<template id="notice-row">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</template>
						<% for(NoticeView v : list) { %>
						<tr>
							<td><%=v.getCode() %></td>
							<td><%=v.getTitle() %></td>
							<td><%=v.getWriter() %></td>
							<td><%=v.getRegDate() %></td>
							<td><%=v.getHit() %></td>
						</tr>
						<% } %>
					</tbody>

				</table>
			</div>

			<%
						int last = (size % 10) > 0 ? size/10+1 : size/10;
					%>
			<div class="margin"><%=pg%>/<%=last%>
				pages
			</div>
			<div class="margin">
				<div>
					<a href="">이전</a>
				</div>
				<ul>
					<% for(int i=0; i<last;i++) {  %>
					<li><a href="?p=<%=i+1%>&f=<%=field%>&q=<%=query%>"><%=i+1%></a></li>
					<% } %>
				</ul>
				<div>
					<a href="">다음</a>
				</div>
			</div>

			<div>
				<a href="notice-reg.jsp">글쓰기</a> <span id="more-button">더보기</span>
				
				<a id="reg-button" href="notice-reg.jsp">등록</a> 
			</div>
			</main>
		</div>
	</div>

	<!-- footer------------------------------------------------------------- -->
	<footer id="footer">
		<div class="content-container">
			<h2>회사정보</h2>

			<div>주소서울특별시 마포구 토정로35길 11, 인우빌딩 5층
				266호관리자메일admin@newlecture.com사업자 등록번호132-18-46763 통신 판매업 신고제
				2013-서울강동-0969 호 상호뉴렉처대표박용우전화번호070-4206-4084 [죄송합니다. 당분간 문의내용은 고개센터
				메뉴에서 1:1 문의를 이용해주시기 바랍니다]</div>
			<div>Copyright ⓒ newlecture.com 2012-2014 All Right Reserved.
				Contact admin@newlecture.com for more information</div>
		</div>
	</footer>

	<!--  <section id="quick-menu">
		<h2>퀵메뉴</h2>
	</section> -->


</body>
</html>