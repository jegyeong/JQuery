<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
   List<BoardVO> list =(List<BoardVO>)request.getAttribute("list");
   int totalp =(Integer)request.getAttribute("totalpage");
 
%>
 {
   "totalpage" : "<%=totalp %>",
   "data"    :  [
 <%
    for(int i=0; i<list.size(); i++){
    	BoardVO  vo = list.get(i);
    	if(i > 0) out.print(",");
  %>
	        {
	         "seq" : "<%= vo.getSeq() %>",
	         "writer" : "<%= vo.getWriter() %>",
	         "subject" : "<%= vo.getSubject() %>",
	         "content" : "<%= vo.getContent().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
	         "mail"   : "<%= vo.getMail() %>",
	         "wdate"	 : "<%= vo.getWdate() %>"
	        }
 <%  }
 %> 
  ]
 }
 