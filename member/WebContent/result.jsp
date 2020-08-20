<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ebs전송결과화면</title>
	</head>
	<body>
			회원가입정보<br>
			<%String id = request.getParameter("id"); %>
			<%=id %><br>
			<%String pw = request.getParameter("pw"); %>
			<%=pw %><br>
			<%String pw_re = request.getParameter("pw_re"); %>
			<%=pw_re %><br>
			<%String name = new String(request.getParameter("_name").getBytes("8859_1"), "UTF-8"); %>
			<%=name %><br>
			<%String gender = new String(request.getParameter("gender").getBytes("8859_1"), "UTF-8"); %> 
			<%=gender %><br>
			<%String year = request.getParameter("year"); %> 
			<%=year %><br>
			<%String month = request.getParameter("month"); %> 
			<%=month %><br>
			<%String day = request.getParameter("day"); %> 
			<%=day %><br>
			<%String email1 = request.getParameter("email1"); %> 
			<%=email1 %>@
			<%String email2 = request.getParameter("email2"); %> 
			<%=email2 %><br>
			<%String tel = request.getParameter("tel"); %> 
			<%=tel %><br>
			<%String check = new String(request.getParameter("check").getBytes("8859_1"), "UTF-8"); %> 
			<%=check %><br>
			<%String checknum = request.getParameter("checknum"); %> 
			<%=checknum %><br>
	</body>
</html>