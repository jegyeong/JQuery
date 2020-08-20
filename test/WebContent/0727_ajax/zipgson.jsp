<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="kr.or.ddit.vo.ZipVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//Gson은 Java Object를 JSON 표현으로 변환하는 데 사용할 수있는 Java 라이브러리입니다
//https://github.com/google/gson
List<ZipVO> list = (List<ZipVO>)request.getAttribute("list");
JsonArray jsonArray1 = new JsonArray();

for(int i=0; i<list.size(); i++){
	  ZipVO  vo = list.get(i) ; 
	  
	  String bunji = vo.getBunji();
	  if(bunji == null)  bunji = "";
	  
	  JsonObject jsonOb = new JsonObject();
	  
      jsonOb.addProperty("zipcode", vo.getZipcode());
      jsonOb.addProperty("addr", vo.getSido() +" " + vo.getGugun() + " " + vo.getDong());
      jsonOb.addProperty("bunji", bunji );
      jsonArray1.add(jsonOb);
}

out.print(jsonArray1); 
System.out.println(jsonArray1);

%>