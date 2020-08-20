<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% String str 
    	= new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
    str += request.getParameter("age");
    %>
    <%=str%>