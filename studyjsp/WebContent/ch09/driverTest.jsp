<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<h2> JDBC 드라이버 테스트 </h2>

<%
	Connection conn= null;
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/jsptest";
	String user = "jspid";
	String pass = "jsppass";

	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(jdbcUrl,user,pass);
		
		out.println("잘연결됨");
		
		String sql = "update member set address='경기도', tel = '010-2222-7573' where name = '이다빈' ";
		
		PreparedStatement pstmt = null;
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		
		out.println("연결오류");
		
		e.printStackTrace();
	}
	
	
	

%>