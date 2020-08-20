<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
String DB_USER = "SEM";
String DB_PASSWORD= "java";

Connection conn;
PreparedStatement pstmt = null;
ResultSet rs;



try {
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	 String sql = "SELECT mem_id, mem_pass from member";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	rs = pstmt.executeQuery();                                // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
	String result = null;
	
	while(rs.next()){ 
		String mem_id = rs.getString("mem_id");
		String mem_pass = rs.getString("mem_pass");
	
		/*id, pw 체크해서 
		[로그인이 되었습니다. or 로그인이 실패했습니다.] 
		
		body태그에 출력*/
		
		if(mem_id.equals(id) && mem_pass.equals(pw)){
			result = "로그인 되었습니다.";
			break;
		}else{
			result = "로그인 실패하였습니다.";
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
