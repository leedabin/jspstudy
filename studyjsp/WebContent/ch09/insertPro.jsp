<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<% 
	request.setCharacterEncoding("utf-8");
	
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	
//	String url = "jdbc:mysql://localhost:3306/jsptest";
//	String uid = "jspid";
//	String upass= "jsppass";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
//		Class.forName("com.mysql.jdbc.Driver");
//		conn = DriverManager.getConnection(url,uid,upass);

		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");
		
		conn = ds.getConnection();
		
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2,pass);
		pstmt.setString(3,name);
		pstmt.setTimestamp(4,reg_date);
		pstmt.setString(5,addr);
		pstmt.setString(6,tel);
		
		pstmt.executeUpdate();
		
		out.println("회원가입완료");
		
		
	}catch(Exception e){
		out.println("오류");
		e.printStackTrace();
	}

%>