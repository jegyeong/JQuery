<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
String DB_USER = "SEM";
String DB_PASSWORD= "java";

Connection conn;
PreparedStatement pstmt = null;
ResultSet rs;
String result = null;


try {
	String flag = request.getParameter("flag");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
 	conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	if(flag.equals("1")){
	 	String sql = "SELECT LPROD_GU, LPROD_NM FROM  Lprod";        // sql 쿼리
	
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		
		result ="[";
		while(rs.next()){ 
			String LPROD_GU = rs.getString("LPROD_GU");
			String LPROD_NM = rs.getString("LPROD_NM");
		
			result += "{\"LPROD_GU\":\""+LPROD_GU+"\",\"LPROD_NM\":\""+LPROD_NM+"\"},";
		}
		result=result.substring(0, result.length()-1);
		result +="]";
		
	}else if(flag.equals("2")){
		String prod_LGU = request.getParameter("prod_LGU");
		
		String sql = "SELECT PROD_ID, PROD_NAME FROM  prod where prod_LGU = ?";        // sql 쿼리
		
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		pstmt.setString(1, prod_LGU);
		
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		if(!rs.equals(null)){
			result ="[";
			while(rs.next()){ 
				String PROD_ID = rs.getString("PROD_ID");
				String PROD_NAME = rs.getString("PROD_NAME");
				
				result += "{\"PROD_ID\":\""+PROD_ID+"\",\"PROD_NAME\":\""+PROD_NAME+"\"},";
				
			}
			result =result.substring(0, result.length()-1);
			result +="]"; 
		}
	}else if(flag.equals("3")){
		String PROD_ID_value = request.getParameter("PROD_ID");
		
		String sql = "SELECT PROD_ID, PROD_NAME,PROD_LGU, PROD_BUYER,PROD_COST FROM  prod where PROD_ID = ?";        // sql 쿼리
		
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		pstmt.setString(1, PROD_ID_value);
		
		rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		if(!rs.equals(null)){
			result ="[";
			while(rs.next()){ 
				String PROD_ID = rs.getString("PROD_ID");
				String PROD_NAME = rs.getString("PROD_NAME");
				String PROD_LGU = rs.getString("PROD_LGU");
				String PROD_BUYER = rs.getString("PROD_BUYER");
				String PROD_COST = rs.getString("PROD_COST");
				
				
				result += "{\"PROD_ID\":\""+PROD_ID+"\",\"PROD_NAME\":\""+PROD_NAME+"\",\"PROD_LGU\":\""+PROD_LGU+"\",\"PROD_BUYER\":\""+PROD_BUYER+"\",\"PROD_COST\":\""+PROD_COST+"\"},";
				
			}
			result =result.substring(0, result.length()-1);
			result +="]"; 
		}
	}
	
	
			
			
	out.println(result);
	//out.println("테이블 select 완료 ");        // 성공시 메시지 출력

 
 conn.close(); 
// out.println("Oracle jdbc test: connect ok!!");
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
