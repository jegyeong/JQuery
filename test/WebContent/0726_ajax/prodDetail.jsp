<%@page import="java.io.PrintWriter"%>
<%@page import="com.google.gson.JsonObject"%>

<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   ProdVO vo  =(ProdVO) request.getAttribute("vo");

	/* 
	JsonObject object = new JsonObject();
	object.addProperty("id", vo.getProd_id());
	object.addProperty("name", vo.getProd_name());
	object.addProperty("lgu", vo.getProd_lgu());
	object.addProperty("detail", vo.getProd_detail());
	
	out.print(object);  
    //out.flush(); 
    
    
    //response.setContentType("application/json");
   // response.setCharacterEncoding("UTF-8");
   
   
	//-----ajax부분의 success function의 res로 json형태의 문자열이 넘어가고-- 
	//-----json 파싱이 필요하다 JSON.parse()---------------------
	//Gson gson = new Gson();
	//String json = gson.toJson(object);
	//System.out.println(json);
	//out.print(object);  
   // out.flush(json); 
   ////----------------------------------------------/////////
   
    
    //success의 function의 res로 json객체가  넘어가고---------
    //json파싱 없이 그대로 사용 ---------------------
      
 */	
	
%>

 {
   "id" : "<%= vo.getProd_id() %>",
   "name" : "<%= vo.getProd_name() %>",
   "lgu" : "<%= vo.getProd_lgu() %>",
   "detail" : "<%= vo.getProd_detail() %>",
   "cost"  : "<%= vo.getProd_cost() %>",
   "color" : "<%= vo.getProd_color() %>",
   "buyer" : "<%= vo.getProd_buyer() %>",
   "price" : "<%= vo.getProd_price() %>",
   "sale" : "<%= vo.getProd_size() %>"
 }
 
 
 
 