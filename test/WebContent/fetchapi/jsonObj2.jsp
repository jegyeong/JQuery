<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 
 String name = request.getParameter("firstName");
 String color = request.getParameter("favColor");
 String pass = request.getParameter("password");
 boolean ok = true;
//Ŭ���̾�Ʈ ��û�� �Է��� ����Ÿ�� �����ͼ� ó��(CRUD)
//ó���Ŀ� �������� ����� - Ÿ���� json { 'Ű' : '����' ,  'Ű' : '����' , 'Ű' : '����'  }
%>
{
 
   "name" : "<%= name %>",
   "color" : "<%= color %>",
   "pass" : "<%= pass %>"
   
}