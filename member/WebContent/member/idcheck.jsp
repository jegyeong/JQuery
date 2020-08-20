<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    MemberVO  vo = (MemberVO)request.getAttribute("vo");
    String id = (String)request.getAttribute("inputid");
    
    if(vo == null){  //해당 id를 못찾은경우- 사용가능
  %>
   {  "id" : "<%= id %> 사용가능" }
  <%-- 
    {
      "sw" : "OK",
      "id" : "<%= id %>"
    }
   --%> 	
  <%   }else {  //해당 id를 찾은경우 - 사용불가능    %>
  {  "id" : "<%= id %> 사용불가능" }
 <%--
  {
     "sw" : "NO",
     "id" : "<%= id %>"
  }
   --%> 
    	
  <%  }
    
    %>
    
    
    
    
    
    
    
    
    
    
    