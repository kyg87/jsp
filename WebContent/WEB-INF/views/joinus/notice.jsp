<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<main id="main">
			<div class="breadcrumb">
				<h3 class="hidden">현재</h3>
				<ul>
					<li>home</li>
					<li>고객센터</li>
					<li>공지사항</li>
				</ul>
			</div>

	<form>
               <fieldset>
                  <legend class="hidden">검색필드</legend>
                  <label class="hidden">검색분류</label> <select name="f">
                     <c:if test="${param.f == 'TITLE' }">
                        <c:set var="selTitle" value="selected" />
                     </c:if>
                     <c:if test="${param.f == 'CONTENT' }">
                        <c:set var="selContent" value="selected" />
                     </c:if>
                     
                     <option value="TITLE"${selTitle}>제목</option>
                     <option value="CONTENT"${selContent}>내용</option>
                  </select> <label class="hidden">검색어</label> 
                  <input name="q" type="text" value="${parm.q }" placeholder="검색어를 입력하세요" /> 
                  <input class="btn btn-search" type="submit" value="검색" /> 
                  <input type="hidden" name="p" value="1" />
               </fieldset>
            </form>


			<h2>검색</h2>

			<div class="notice">
				<h3>공지목록 [${size}]</h3>
				<script type="text/javascript">
					window.addEventListener("load", function() {
						
						var morebutton = document.querySelector("#more-button");
						
						/*var notices = [
							{code:"1",title:"오오오"},
							{code:"2",title:"육육육"},
							{code:"3",title:"칠칠칠"}
							]; */
						/* var request = new ActiveXObject("Microsoft.XMLHTTP"); */
			
						
						morebutton.onclick = function(){
								
							var request = new window.XMLHttpRequest();
							request.open("GET","notice.jsp",false);
							request.send();
							alert(request.responseText);
							
								var template = document.querySelector("#notice-row");
								
								for(var i in notices){
					
								var tbody = document.querySelector(".notice-table tbody");
								
								var tds = template.content.querySelectorAll("td");
								
								tds[0].innerText = notices[i].code;
								tds[1].innerText = notices[i].title;
								
								var clone = document.importNode(template.content,true);
								tbody.appendChild(clone);
							}
						};
						
					});
				</script>
				<template id ="notice-row">
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
				</template>
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
					<c:forEach var="f" items="${list}">
						<tr>
							<td>${f.title }</td>
							<td><a href ="notice-detail?c=${f.code}">${f.title}</a></td>
							<td>${f.writerName }</td>
							<td>${f.regDate }</td>
							<td>${f.hit }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="margin">
               <div><a href="">이전</a></div>
               <ul>
               	<c:forEach var="data" begin="0" end="${last}" varStatus="st">
	               
	               <li><a href="?p=${st.index + 1}&f=${parm.f }&q=${parm.q}">${st.index + 1 }</a></li>
	                  
	               
	            </c:forEach>
               </ul>
               <div><a href="">다음</a></div>
            </div>    
			
			<div>
			<a href="notice-reg">글쓰기</a>
				<span id ="more-button">더보기</span>
			</div>
			
			</main>