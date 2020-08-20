<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>Hello~~</h1>
클라이언트의 요청에 의해서 <BR>
서버내에서 실행되는 JSP파일입니다 <BR>
<%
  //요청시 입력된 이름 나이를 가져온다 
   request.setCharacterEncoding("UTF-8");

  // String nameValue =  request.getParameter("name");
  // String ageValue =   request.getParameter("age");
  
   String nameValue = "korea";
   String ageValue = "12";
   
%>

<%= ageValue  %>세인 <%= nameValue %>님  환영합니다 <br>
AJAX를 공부 합시다. <br>
제발 딴짓은 그만 ~~~<br>











