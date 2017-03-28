<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src ="../js/customer/notice.js"></script>
<!-- <script>
window.addEventListener("load",function(){
	alert("Hello");
});

</script> -->
<link href="../css/reset.css" type="text/css" rel="stylesheet" />


<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

부가적인 테마
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

합쳐지고 최소화된 최신 자바스크립트
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 -->

<link href="../css/account/layout.css" type="text/css" rel="stylesheet" />
<link href="../css/account/style.css" type="text/css" rel="stylesheet" />

<style>
/* h2, h3 {
   color: lime;
   font-size: 30px;
}

nav ~ p {
   color: red;
}

h1.h2 {
   color: green;
}

nav>.h2 {
   color: orange;
}

.h2 {
   color: red;
}

#main-menu의 자손중에 li가 있느냐 
#main-menu>h3 {
   color: red;
} 
*/
</style>
</head>
<body>
	<!-- ------------header------------------------------------------------------------------- -->
	<!-- 헤더 부분 -->
	<tiles:insertAttribute name="header" />
	<!-- ------------visual------------------------------------------------------------------- -->
	<!-- 비주얼 -->
	
	<tiles:insertAttribute name="visual" />
		<!--       visual      -->
	</div>
	</div>
	<!-- ------------body------------------------------------------------------------------- -->
	<div id="body">
		<div class="content-container">
			<!-- 어사이드 -->
			<tiles:insertAttribute name="aside" />
			<!-- 메인 부분 -->
			<tiles:insertAttribute name="main" />
		</div>

	</div>

	<!-- ------------footer------------------------------------------------------------------- -->
	
	<jsp:include page="../inc/footer.jsp"/>

</body>
</html>