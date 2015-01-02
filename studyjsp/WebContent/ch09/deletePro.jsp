<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	String url = "jdbc:mysql://localhost:3306/jsptest";
	String uid = "jspid";
	String upass = "jsppass";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, upass);

		String sql = "select * from member where id = ?";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		if (rs.next()) {

			if (rs.getString("id").equals(id)
					&& rs.getString("passwd").equals(pass)) {

				sql = "delete from member where id = ?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();

				out.println("회원 탈퇴 완료");

			} else {
				out.println("비밀번호가 틀립니다.");
			}
		} else {
			out.println("없는 아이디 입니다.");
		}
	} catch (Exception e) {
		out.println("오류");
		e.printStackTrace();
	}
%>