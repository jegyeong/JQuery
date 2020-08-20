<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.vo.LprodVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
  List<ProdVO> list = (List<ProdVO>) request.getAttribute("list"); 
  if(list.size() > 0) {
%>	  
  {
     "sw" : "OK",
  	 "data" : [  
	  
<%	 for(int i=0; i<list.size(); i++){ 
	     ProdVO  vo = list.get(i);
	     if(i  > 0) out.print(",");
%>
	
	 {
	  "id" : "<%= vo.getProd_id() %>",
	  "name" : "<%= vo.getProd_name() %>"
     }
		 
		 
<%	 }  %>
  
	]  
  } 
 <% }else {  %>
	  
	  {
	     "sw"  : "NO"
	  } 
	  
 <%  }  %>
 
 
 
 
 
 
 
 
 
 
 
 