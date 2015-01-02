package ch09.update;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import work.crypt.BCrypt;
import work.crypt.SHA256;

public class UpdateDBBean {

	private static UpdateDBBean instance = new UpdateDBBean();

	public static UpdateDBBean getInstance() {
		return instance;
	}

	private UpdateDBBean() {

	}

	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	@SuppressWarnings("resource")
	public List<UpdateDataBean> getMembers() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UpdateDataBean> memberList = null;
		int x = 0;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*)from member");
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);

			pstmt = conn.prepareStatement("select id, passwd from member");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				memberList = new ArrayList<UpdateDataBean>(x);
				do {
					UpdateDataBean member = new UpdateDataBean();
					member.setId(rs.getString("id"));
					member.setPasswd(rs.getString("passwd"));
					memberList.add(member);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return memberList;
	}

	public void updateMember() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		SHA256 sha = SHA256.getInsatnce();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id, passwd from member");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String id = rs.getString("id");
				String orgPass = rs.getString("passwd");
				String shaPass = sha.getSha256(orgPass.getBytes());
				String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

				pstmt = conn
						.prepareStatement("update member set passwd = ? where id = ?");
				pstmt.setString(1, bcPass);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}
}
