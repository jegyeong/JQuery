<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
  <%
   int a= (Integer)request.getAttribute("a");
   if(a > 0) {
 %>  
  { "flag"  : "수정성공" }
   
 <%  }else { %>
 
 { "flag"  : "수정실패" }  

 <%  } %> 
  
  
   
  
