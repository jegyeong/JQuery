<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- <meta http-equiv="Refresh" content="5;url=http://www.naver.com" /> -->
<title>05/autoRequest.jsp</title>
<script type="text/javascript">
	function init(){
		var span = document.getElementById("seconds");
		var timers = 5;
		job = setInterval(function(){
			if(timers==0)
				clearInterval(job);
			span.innerHTML = timers--;
		}, 1000);
	}
	
	setTimeout(() => {
		location.reload();
	}, 1000);
</script>
</head>
<!-- <body onload="init();"> -->
<body>
<h4> 자동 요청을 발생시키는 방법 </h4>
<h4> <span id="seconds"></span>초 뒤에 네이버로 갈꺼임. </h4>
<pre>
	1. 서버사이드 방식 : Refresh 응답 헤더 사용.
	<%
		Date now = new Date();
// 		response.setIntHeader("Refresh", 1);
	%>
	<%=now %>
	2. 클라이언트 사이드 방식 : 
		HTML : meta 태그 http-equiv="Refresh"
		Javascript : 스케쥴링 함수 + location.reload()
</pre>
</body>
</html>











