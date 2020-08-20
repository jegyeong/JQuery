<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String  name1="홍길동";

   //못 읽음 ?????????????????????????????
    //String name2 = request.getParameter("name");
 	//String email = request.getParameter("email");
 	
 	String body = null;
 	/*
 	StringBuilder stringBuilder = new StringBuilder();
    BufferedReader bufferedReader = null;

     try {
    	InputStream inputStream = request.getInputStream();
    	
        if (inputStream != null) {
            bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            char[] charBuffer = new char[128];
            int bytesRead = -1;
            while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                stringBuilder.append(charBuffer, 0, bytesRead);
            }
        } else {
            stringBuilder.append("");
        }
    } catch (IOException ex) {
        throw ex;
    } finally {
        if (bufferedReader != null) {
            try {
                bufferedReader.close();
            } catch (IOException ex) {
                throw ex;
            }
        }
    }

    body = stringBuilder.toString();
     */
   
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
     body =  strjson.toString();
	 
    System.out.println("body : " + body);

  //json-simple-1.1.ja파일 추가 
    JSONParser parser = new JSONParser();
    
    //Object obj = parser.parse( body );
    //JSONObject jsonObj = (JSONObject) obj;
    JSONObject jsonObj = (JSONObject)parser.parse( body );
   
    String jname = (String) jsonObj.get("name");
    String jemail = (String) jsonObj.get("email");
		
  
//클라이언트 요청시 입력한 데이타를 가져와서 처리(CRUD)
//처리후에 응답결과를 만든다 - 타입은 json { '키' : '벨류' ,  '키' : '벨류' , '키' : '벨류'  }
%>
{
   "name1" : "<%= name1 %>",
   "name2" : "<%= jname %>",
   "email" : "<%= jemail %>"
}