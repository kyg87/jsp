<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<script>
		
		var f = function(){
			var regButton = document.querySelector(".reg-button");
			regButton.onclick = function(){
				
				var form = document.querySelector("#form");
				var formData = new FormData(form);
				
				var request = new window.XMLHttpRequest();
				
				var progressBar = document.querySelector("progress");
				request.onprogress = function(event){
					/* document.title = "total : " + event.total + ", loaded : " + event.loaded; */
				
					progressBar.value = parseInt((event.loaded/event.total)*100);
				};
				
				request.onload = function(){
					var screen = document.querySelector(".screen");
					var formScreen = document.querySelector(".formScreen");

					screen.remove();
					document.body.removeChild(screen);
				};
				
				request.open("POST", "notice-reg-ajax", true);
				request.send(formData);

				return false;
			};
		};
		
		f();
		
	</script>



 	<form id="form" >
       
       <table border="1">
          <tbody>
             <tr>
               <th>제목</th>
               <td><input type="text" name="title" /></td>
             </tr>
             <tr>
               <th>첨부파일<progress value="0" max="100"/></th>
               <td><input type="file" name="file2" /></td>
             </tr>
             <tr>
             	<th>내용</th>                  
               <td colspan="2">
               	<textarea rows="20" cols="80" name="content"></textarea>
               </td>
             </tr>   
          </tbody>
       </table>
       
       <div>      
          <input class="reg-button" type="button" value="등록" />         
          <a href="notice.jsp">취소</a>
       </div>
       
	</form>