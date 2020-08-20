<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

   <%
      String id =  request.getParameter("userId");
     String checkvalues[] = request.getParameterValues("checkArray");
     
      String str="";
     for(int i=0; i<checkvalues.length; i++){
    	 str +=  checkvalues[i] + ",";
     }
     str = str.substring(0, str.lastIndexOf(","));
   %>
   
   아이디 : <%= id %>
   <br>
   취미 :<%= str  %> 
   
  <%--  {
   "id" : "<%= id %>",
   "hobby" :"<%= str  %>"
  }
 --%>