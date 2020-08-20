<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int a = (Integer)request.getAttribute("a");
  
   if(a > 0) {
%>
    {  
       "status" : "저장성공"
    }
 
	   
<%   }else { %>
	  
	  {
	      "status" : "저장실패"
	  } 

<%   }  %>
    