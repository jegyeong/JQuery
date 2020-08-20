<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
[
 <%
  //list를 받아온다 
  //list를 가지고 json데이타를 먼든다 
   List<MemberVO> list =(List<MemberVO>)request.getAttribute("list");
   for(int i=0; i<list.size(); i++){
	  MemberVO  vo = list.get(i); 
	  if(i > 0) out.print(","); 
%>	   
  {
     "name" : "<%= vo.getMem_name()  %>",
     "id"   : "<%= vo.getMem_id() %>",
     "mail" : "<%= vo.getMem_mail() %>",
     "hp"   : "<%= vo.getMem_hp() %>"
  }
	   
<%	   
   }
 %>
]



