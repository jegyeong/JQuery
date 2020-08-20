<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String inputname =(String) request.getAttribute("inputname");
   String resname =(String)request.getAttribute("resname");
   if(resname != null){
	  //성공
%>
{
  "result" : "<%= inputname %>님 환영합니다"
}
<%--  
   {
      "sw"  : "OK",
      "name" : "<%= inputname %>"
   }
--%>
	   
<%   }else {   //실패	%>
{
  "result" : "<%= inputname %>님 실패"
}
<%--	 
	{
      "sw"  : "NO",
      "name" : "<%= inputname %>"
    } 
--%>	   
<%  }%>



