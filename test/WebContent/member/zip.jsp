<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

[
 <%
  List<ZipVO> list = (List<ZipVO>)request.getAttribute("list");
  for(int i=0; i<list.size(); i++){
	  ZipVO  vo = list.get(i) ; 
	  
	  String bunji = vo.getBunji();
	  if(bunji == null)  bunji = "";
	  
	  if(i >0 ) out.print(",");
  
%>
  {
    "zipcode" : "<%= vo.getZipcode() %>",
    "addr"   : "<%=vo.getSido() %> <%= vo.getGugun() %> <%= vo.getDong() %>",
    "bunji"  : "<%= bunji %>"

  }
 
<%	  
  }
  %>
  
 ]
 
 
 
 
 
 
 
 
 