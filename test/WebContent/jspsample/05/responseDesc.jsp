<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%
	response.setHeader("Content-Type", "text/plain;cahrset=UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>05/responseDesc.jsp</title>
</head>
<body>
<h4> HttpServletResponse : client 로 전송할 응답과 관련된 모든 정보를 캡슐화한 객체.</h4>
<pre>
	1. Http 프로토콜에 따른 response 패키징 방식
		1) Response Line : protocol Status_Code(응답상태코드)
		   status code - response.sendError(statusCode, message)
		   a) 100번대 (HTTP/1.1이후) : ing...(WebSocket 프로토콜에서 사용.)
		   b) 200 : OK
		   c) 300 : 처리가 완료되기 위해서는 클라이언트측의 추가 액션이 필요한 상황.
		   		304 (Not Modified),
		   		302/307(Moved)
		   d) 400 : Client side FAIL
		   	  400(Bad Request), 404(Not Found), 405(Method Not Allowed)
		   	  403(Forbidden), 401(UnAuthorized)
		   e) 500 : Server side FAIL
		   		500 (Internal Server Error, <%=HttpServletResponse.SC_INTERNAL_SERVER_ERROR %>)	
		2) Response Header : meta data (name:value-String)
		                   : name-value 쌍으로 구성되며, 문자열의 형태로 전송(URL Encoding 고려.)
		   a) 응답데이터의 MIME 설정 : Content-Type
		   		- page 지시자의 contextType 속성 사용.
		   		- response.setContentType(mime)
		   		- response.setHeader("Content-Type", mime)
		   b) 브라우저의 캐시 제어 : Pragma, Expires, Cache-Control
		   		<a href="<%=request.getContextPath() %>/05/cacheControl.jsp">- cacheControl.jsp 참고</a>
		   c) 자동 요청 처리 : Refresh
		   		<a href="autoRequest.jsp">- autoRequest.jsp 참고</a>
		   d) 페이지 이동 : Location	    
		                   
		3) Response Body(Content Body, Message Body)
			- response.getWriter()/response.getOutputStream() 으로 
			   출력스트림을 확보하고 이를 통해 body 에 기록.
</pre>
</body>
</html>













