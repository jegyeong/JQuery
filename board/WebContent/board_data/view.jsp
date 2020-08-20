<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   BoardVO vo = (BoardVO)request.getAttribute("vo");
  
%>	
{
    "board_no": "<%= vo.getBoard_no() %>",
    "board_title" : "<%= vo.getBoard_title() %>",
    "board_writer"  : "<%= vo.getBoard_writer() %>",
    "board_content" : "<%= vo.getBoard_content().replaceAll("\r","").replaceAll("\n","<br>") %>",
    "board_date"	 : "<%= vo.getBoard_date() %>"
}	




