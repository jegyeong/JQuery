<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String  name="홍길동";
 //String name = request.getParameter("name");
//클라이언트 요청시 입력한 데이타를 가져와서 처리(CRUD)
//처리후에 응답결과를 만든다 - 타입은 json { '키' : '벨류' ,  '키' : '벨류' , '키' : '벨류'  }
%>
{
   "name" : "<%= name %>",
   "addr" : "대전",
   "tel"  : "010-1234-4567"
}