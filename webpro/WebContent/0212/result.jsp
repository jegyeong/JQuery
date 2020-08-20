<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>전송결과 화면</title>
	</head>
	<body>
		<% String selType = new String(request.getParameter("selType").getBytes("8859_1"), "UTF-8"); %>
		
		
		<% String query = new String(request.getParameter("query").getBytes("8859_1"), "UTF-8"); %>
		
		
		select * from 테이블명 
		where selType="<%=selType %> " and query ="<%=query %>"
		
		

		
		<% String name = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %>
		<%=name %>
	</body>
</html>




