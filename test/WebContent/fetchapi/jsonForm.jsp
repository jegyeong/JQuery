<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
 
 String name = request.getParameter("name");
 String color = request.getParameter("no");

//Ŭ���̾�Ʈ ��û�� �Է��� ����Ÿ�� �����ͼ� ó��(CRUD)
//ó���Ŀ� �������� ����� - Ÿ���� json { 'Ű' : '����' ,  'Ű' : '����' , 'Ű' : '����'  }
%>
{
 
   "name" : "<%= name %>",
   "color" : "<%= color %>"
}