<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int flag = (Integer)(request.getAttribute("flag"));
   if(flag > 0){
%>
	{
	   "flag" : "���� ����"
	}   
	   
 <%   }else { %>
	   
   {
      "flag" : "���� ����"
   }
 
 <%  }  %>

