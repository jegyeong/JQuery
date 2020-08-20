<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
	<%

	request.setCharacterEncoding("UTF-8"); 
    
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "SEM";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	ResultSet rs;



try {
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name 
	= new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
	
	//String name = request.getParameter("name");
	
Class.forName("oracle.jdbc.driver.OracleDriver");
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

 	 String sql = "INSERT INTO MEMBERJOIN VALUES(?,?,?,?,?,?) ";        // sql 쿼리

	pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, null);
	pstmt.setString(5, null);
	pstmt.setString(6, null);
	
	
	pstmt.executeUpdate();
	out.println("데이터 insert 완료");
	
 
 conn.close(); 
} catch(Exception e) {
 out.println(e.getMessage());
}
%>
