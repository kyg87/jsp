<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<main id="main">
			<div class="breadcrumb">
				<h3 class="hidden">����</h3>
				<ul>
					<li>home</li>
					<li>������</li>
					<li>��������</li>
				</ul>
			</div>

	<form>
               <fieldset>
                  <legend class="hidden">�˻��ʵ�</legend>
                  <label class="hidden">�˻��з�</label> <select name="f">
                     <c:if test="${param.f == 'TITLE' }">
                        <c:set var="selTitle" value="selected" />
                     </c:if>
                     <c:if test="${param.f == 'CONTENT' }">
                        <c:set var="selContent" value="selected" />
                     </c:if>
                     
                     <option value="TITLE"${selTitle}>����</option>
                     <option value="CONTENT"${selContent}>����</option>
                  </select> <label class="hidden">�˻���</label> 
                  <input name="q" type="text" value="${parm.q }" placeholder="�˻�� �Է��ϼ���" /> 
                  <input class="btn btn-search" type="submit" value="�˻�" /> 
                  <input type="hidden" name="p" value="1" />
               </fieldset>
            </form>


			<h2>�˻�</h2>

			<div class="notice">
				<h3>������� [${size}]</h3>
				<script type="text/javascript">
					window.addEventListener("load", function() {
						
						var morebutton = document.querySelector("#more-button");
						
						/*var notices = [
							{code:"1",title:"������"},
							{code:"2",title:"������"},
							{code:"3",title:"ĥĥĥ"}
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
							<td>��ȣ</td>
							<td>����</td>
							<td>�ۼ���</td>
							<td>�ۼ���</td>
							<td>��ȸ��</td>
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
               <div><a href="">����</a></div>
               <ul>
               	<c:forEach var="data" begin="0" end="${last}" varStatus="st">
	               
	               <li><a href="?p=${st.index + 1}&f=${parm.f }&q=${parm.q}">${st.index + 1 }</a></li>
	                  
	               
	            </c:forEach>
               </ul>
               <div><a href="">����</a></div>
            </div>    
			
			<div>
			<a href="notice-reg">�۾���</a>
				<span id ="more-button">������</span>
			</div>
			
			</main>