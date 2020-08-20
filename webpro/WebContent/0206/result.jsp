<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>전송결과 화면</title>
	</head>
	<body>
	
		
		<%String name = request.getParameter("_name"); %>
		<% String name2 = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %>
		<%=name2 %>
		
	</body>
</html>




