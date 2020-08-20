<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 
 String name = request.getParameter("name");
 String color = request.getParameter("no");

//클라이언트 요청시 입력한 데이타를 가져와서 처리(CRUD)
//처리후에 응답결과를 만든다 - 타입은 json { '키' : '벨류' ,  '키' : '벨류' , '키' : '벨류'  }
%>
{
 
   "name" : "<%= name %>",
   "color" : "<%= color %>"
}