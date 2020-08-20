<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String  name1="홍길동";
  //String name2 = request.getParameter("name");
  
  
    StringBuffer strjson = new StringBuffer();
     String line = null;
  
     try {
         BufferedReader reader = request.getReader();
         while((line = reader.readLine()) != null) {
        	 strjson.append(line);
         }
  
     }catch(Exception e) {
         System.out.println("Error reading JSON string: " + e.toString());
     }
     String body =  strjson.toString();
	 
    System.out.println("body : " + body);

  //json-simple-1.1.ja파일 추가 
    JSONParser parser = new JSONParser();
    
    //Object obj = parser.parse( body );
    //JSONObject jsonObj = (JSONObject) obj;
    JSONObject jsonObj = (JSONObject)parser.parse( body );
   
    String name2 = (String) jsonObj.get("name");
  
//클라이언트 요청시 입력한 데이타를 가져와서 처리(CRUD)
//처리후에 응답결과를 만든다 - 타입은 json { '키' : '벨류' ,  '키' : '벨류' , '키' : '벨류'  }
%>
{
   "name1" : "<%= name1 %>",
   "name2" : "<%= name2 %>",
   "addr" : "대전",
   "tel"  : "010-1234-4567"
}