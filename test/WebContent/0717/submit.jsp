<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF_8">
<title>Insert title here</title>
</head>
<body>
  <%
    request.setCharacterEncoding("UTF-8");
   String   fname =  request.getParameter("FirstName");
   String   lname =  request.getParameter("LastName");
  %>
  
  <%= fname %> <%= lname %>
</body>
</html>