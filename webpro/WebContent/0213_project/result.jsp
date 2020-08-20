<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>result_ebs</title>
	</head>
	<body>
	<% String id = new String(request.getParameter("id").getBytes("8859_1"), "UTF-8"); %>
	<%=id %><br>
	<% String pw = new String(request.getParameter("pw").getBytes("8859_1"), "UTF-8"); %>
	<%=pw %><br>
	<% String pw_re = new String(request.getParameter("pw_re").getBytes("8859_1"), "UTF-8"); %>
	<%=pw_re %><br>
	<% String name = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %>
	<%=name %><br>
	<% String gender = new String(request.getParameter("gender").getBytes("8859_1"), "UTF-8"); %>
	<%=gender %><br>
	<% String brith = new String(request.getParameter("brith").getBytes("8859_1"), "UTF-8"); %>
	<%=brith %><br>
	<% String email = new String(request.getParameter("email").getBytes("8859_1"), "UTF-8"); %>
	<%=email %>
	<% String email2 = new String(request.getParameter("email2").getBytes("8859_1"), "UTF-8"); %>
	<%=email2 %><br>
	<% String tel = new String(request.getParameter("tel").getBytes("8859_1"), "UTF-8"); %>
	<%=tel %><br>
	<% String check = new String(request.getParameter("check").getBytes("8859_1"), "UTF-8"); %>
	<%=check %><br>
	<% String checkNum = new String(request.getParameter("checkNum").getBytes("8859_1"), "UTF-8"); %>
	<%=checkNum %><br>
	</body>
</html>