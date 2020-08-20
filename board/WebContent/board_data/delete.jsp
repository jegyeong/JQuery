<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int flag = (Integer)(request.getAttribute("flag"));
   if(flag > 0){
%>
	{
	   "flag" : "삭제 성공"
	}   
	   
 <%   }else { %>
	   
   {
      "flag" : "삭제 실패"
   }
 
 <%  }  %>

