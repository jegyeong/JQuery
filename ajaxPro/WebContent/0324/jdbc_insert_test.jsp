<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String DB_USER = "SEM";
	String DB_PASSWORD= "java";
	
	Connection conn;
	PreparedStatement pstmt = null;
	
	try {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String add1 = request.getParameter("add1");
		String add2 = request.getParameter("add2");
		String tel = request.getParameter("tel");
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	 	String sql = "INSERT into memberjoin(MEM_ID, MEM_PASS, MEM_NAME, MEM_ADD1, MEM_ADD2, MEM_HP) values(?,?,?,?,?,?)";        // sql 쿼리
	 		
		pstmt = conn.prepareStatement(sql);                          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, null);
		pstmt.setString(5, null);
		pstmt.setString(6, null);
		
		pstmt.executeUpdate();
		 
		out.println("회원 가입 완료 !");        // 성공시 메시지 출력
		 
		conn.close();
	
	} catch(Exception e) {
	 	out.println(e.getMessage()+"<br>");
	 	out.println("회원 가입 실패! <br>");
	}
%>
    