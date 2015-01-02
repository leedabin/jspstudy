<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<table border='1'>
	<tr>
		<td>아이디
		<td>비밀번호
		<td>이름
		<td>가입일자
		<td>주소
		<td>전화번호
	</tr>

	<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				String jdbcUrl = "jdbc:mysql://localhost:3306/jsptest";
				String jdbcUser = "jspid";
				String jdbcPass = "jsppass";
				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcUrl,jdbcUser,jdbcPass);
				
				String sql = "select * from member";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					String id = rs.getString("id");
					String pass = rs.getString("passwd");
					String name = rs.getString("name");
					String reg_date = rs.getString("reg_date");
					String addr = rs.getString("address");
					String tel = rs.getString("tel");
					
					%>
	<tr>
		<td><%=id %>
		<td><%=pass %>
		<td><%=name %>
		<td><%=reg_date %>
		<td><%=addr %>
		<td><%=tel %> <%
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
</table>