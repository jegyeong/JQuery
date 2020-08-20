<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//[  
//   {"id" : "p101000001", "name" : "모니터19인치" },
//   { },
//   { } 
// ]
JsonArray jsonArray1 = new JsonArray(); 

  
List<ProdVO> list = (List<ProdVO>) request.getAttribute("list"); 
  if(list.size() > 0) {
	  for(int i=0; i<list.size(); i++){
	    	ProdVO  vo = list.get(i);
	      
	          JsonObject jsonOb = new JsonObject();
	         
	          jsonOb.addProperty("id", vo.getProd_id());
	          jsonOb.addProperty("name", vo.getProd_name());
	          jsonArray1.add(jsonOb);
	  }
  }
  out.print(jsonArray1); 
 
%>