<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<h4>브라우저의 캐시 설정</h4>
<pre>
	캐시 (Cache) : 두개의 peer 사이에서 발생하는 속도 차이를 보완하기 위해 
	              사용하는 임시 저장 데이터. 
	        - 브라우저는 정적 리소스의 캐시를 저장하기 위한 캐시 저장 영역을 가짐.
	캐시 제어용 헤더
	Pragma : Http/1.0 에서 사용되는 헤더 , no-cache
	Cache-Control : Http/1.1 부터 사용되는 헤더, no-cache, no-store
	Expires : 공통 헤더, 캐시데이터 만료 시간 설정에 사용.
	<%
// 	 웹 개발시 고려할 전략. - 웹 접근성 보장/웹 표준화 전략
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		
	%>       
</pre>
</body>
</html>












