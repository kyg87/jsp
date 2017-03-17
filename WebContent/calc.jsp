<%
		String _x = request.getParameter("x");
		String _y = request.getParameter("y");
		
		/*int x = Integer.parseInt(_x);
		int y = Integer.parseInt(_y);*/
		
		int x = 0;
		int y = 0;
		
		if(_x != null && !_x.equals(""))
			x = Integer.parseInt(_x);
		
		if(_y != null && !_y.equals(""))
			y = Integer.parseInt(_y);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕 클레오 파트라</title>
</head>
<body>
	<form action="cacl" method="post">
		<p>
			<label>x:</label>
			<input name="x" id="txt-x" /> 
			<label>y:</label>
			<input name="y" id="txt-y" />
		</p>
		<p>
			sum = <input id="txt-sum" value ="<%out.print(3+4); %>"/>
		</p>
		<p>
			<input id="btn-sum" type="submit" value="Sum" />
		</p>
	</form>
</body>
</html>