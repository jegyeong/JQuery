<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>05/autoRequestAjax.jsp</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.3.4.1.js"></script>
<script type="text/javascript">
	if($){
		console.log("jquery loading 완료");
		$(function(){
			var watch = $("#watch");
			setInterval(() => {
				$.ajax({
					url:"<%=request.getContextPath() %>/05/getServerTime.jsp",
					data:{
						p1:"value1",
						p2:"value2"
					},
	// 				data:"p1=value1&p2=value2",
					method:"post",
					dataType:"json", // request header(Accept) / response header(Content-Type)
					// Accept:application/json
					success:function(resp){
						watch.html(resp.time);
					},
					error:function(errorResp){
						console.log(errorResp.status);
					} // error end
				}); // AJAX end
			}, 1000);
		});
	}
</script>
</head>
<body>
<h4> AJAX 함수를 이용한 비동기 자동 요청 </h4>
<pre>
	현재 서버의 시간을 이 페이지를 리로딩 하지 않고, 조회.
	현재 서버의 시각 : <span id="watch"></span>
	
	** 전송 및 저장을 위한 데이터 변환 과정
	1. Marshalling/UnMarshalling
	   : 서로 다른 기종의 시스템들간의 데이터를 교환하기 위해
	      공통 데이터 표현 형식(xml, json)으로 변환/역변환 하는 과정
	      native object -> xml/json : marshalling
	      xml, json -> native object : unmarshalling
	      
	2. Serialize(직렬화)/DeSerialize(역직렬화)
	    : 데이터를 매체를 통해 저장하거나 기록하기 위해 byte 집합 형태로 변환하는 작업.
	        특정 타입 데이터 -> bytes : serialize
	     bytes -> 특정 타입 데이터 : deserialize 
	     
	 client(Javascript) 와 server(Java) 사이의 JSON 메시지 교환 과정
	 1. Javascript Object -> marshalling -> JSON
	    -> serialize -> bytes
	 2. bytes -> deserialize -> JSON -> unmarshalling -> Java Object
	 
	 3. Java Object -> marshalling -> JSON
	    -> serialize -> bytes
	 4. bytes -> deserialize -> JSON -> unmarshalling -> Javascript Object       
</pre>
</body>
</html>












