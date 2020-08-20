<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
	//post형식으로 파라미터를 받을 경우 
	request.setCharacterEncoding("UTF-8"); %>
    <% 
	//클라이언트 요청시 입력한 데이터를 가져와서 처리
	//처리후에 응답 결과를 만든다 
	//타입은 json {"키":"밸류","키":"밸류"}
    //값에 대한 객체가 여러개일 경우 json
    //[{"키":"밸류","키":"밸류"},{"키":"밸류","키":"밸류"}]
    String str =
    		"{\"name\":\"" +request.getParameter("name")+"\",";
    
    str += 
    		"\"add\":\""+request.getParameter("add")+"\",";
	 str += 
	    		"\"tel\":\""+request.getParameter("tel")+"\"}";
    %>
    <%=str%>
    
    
    
    
    
    
    
    
    