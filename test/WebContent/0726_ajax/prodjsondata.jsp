<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.JsonArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//----------------------------------------
//sw와 json data배열 생성
//{"sw" : "OK" , 
//	"data" [ { }, { },{ }, { }]
//}
//-----------------------------------------
JsonArray jsonArray1 = new JsonArray(); 

  JsonObject  obj = new JsonObject();
  
List<ProdVO> list = (List<ProdVO>) request.getAttribute("list"); 
  if(list.size() > 0) {
	  
	  obj.addProperty("sw", "OK");
	  
	  for(int i=0; i<list.size(); i++){
	    	ProdVO  vo = list.get(i);
	      
	          JsonObject jsonOb = new JsonObject();
	         
	          jsonOb.addProperty("id", vo.getProd_id());
	          jsonOb.addProperty("name", vo.getProd_name());
	          jsonArray1.add(jsonOb);
	    
	  }
	  obj.add("data", jsonArray1);
	  
  }
  
  out.print( obj);
  System.out.println(obj);
  
  /* Gson gson = new Gson();
  out.print(gson.toJson(obj));  
  System.out.println(gson.toJson(obj));
  */
 
%>