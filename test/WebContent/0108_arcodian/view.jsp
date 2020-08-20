<%@page import="kr.or.ddit.arcodian.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  BoardVO  vo =(BoardVO)request.getAttribute("vo");
 //   -   \n -> \\n
%>

{
   "seq"   : "<%= vo.getSeq() %>",
   "writer" : "<%=vo.getWriter() %>",
   "subject" : "<%= vo.getSubject() %>",   
   "mail" : "<%= vo.getMail() %>",
   "content" : "<%= vo.getContent().replaceAll("\\n|(\\r\\n)", "\\\\n")%>",
   "password" : "<%=vo.getPassword() %>"
}