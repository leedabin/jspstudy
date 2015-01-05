package ch11.logon;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;

import work.crypt.*;

public class LogonDBBean {

	// 전역 객체 생성 <- 한개의 객체만 생성해서 공유
	private static LogonDBBean instance = new LogonDBBean();

	// 객체를 리턴하는 메소드
	public static LogonDBBean getInstatnce() {
		return instance;
	}

	private LogonDBBean() {
	}

	// 커넥션 풀에서 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}

	// 회원가입 처리에서 사용하는 메소드
	public void insertMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		SHA256 sha = SHA256.getInsatnce();
		try {
			conn = getConnection();

			String orgPass = member.getPasswd();
			String shaPass = sha.getSha256(orgPass.getBytes());
			String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());

			pstmt = conn
					.prepareStatement("insert into member values(?,?,?,?,?,?)");

			pstmt.setString(1, member.getId());
			pstmt.setString(2, bcPass);
			pstmt.setString(3, member.getName());
			pstmt.setTimestamp(4, member.getReg_date());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getTel());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// 로그인폼처리 페이지의 사용자 인증 처리 및 회원정보수정, 탈퇴를 사용자 인증
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;

		SHA256 sha = SHA256.getInsatnce();
		try {
			conn = getConnection();

			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());

			pstmt = conn
					.prepareStatement("select passwd from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String dbpasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPass, dbpasswd)) {
					x = 1; // 인증 성공
				} else {
					x = 0; // 비번틀림
				}
			} else {
				// 아이디 없음
				x = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

		return x;
	}

	// 아이디 중복 확인
	public int confirmId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select id from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = 1; // 아이디 있음
			} else {
				x = -1; // 아이디 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
		}

		return x;
	}

	// 회원 정보 수정폼을 위한 기존 가입 정보를 가져오는 메소드
	public LogonDataBean getMember(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogonDataBean member = null;

		SHA256 sha = SHA256.getInsatnce();

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id =?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			String orgPass = passwd;
			String shaPass = sha.getSha256(orgPass.getBytes());

			if (rs.next()) {
				String dbpasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPass, dbpasswd)) {
					member = new LogonDataBean();
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setReg_date(rs.getTimestamp("reg_date"));
					member.setAddress(rs.getString("address"));
					member.setTel(rs.getString("tel"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
		}
		return member;
	}

	// 회워 정보 수정
	public int updateMember(LogonDataBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		SHA256 sha = SHA256.getInsatnce();

		int x = -1;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select passwd from member where id =?");
			pstmt.setString(1, member.getId());
			rs = pstmt.executeQuery();

			String orgPass = member.getPasswd();
			String shaPass = sha.getSha256(orgPass.getBytes());

			if (rs.next()) {
				String dbpasswd = rs.getString("passwd");
				if (BCrypt.checkpw(shaPass, dbpasswd)) {
					String sql = "update member set name=?, address=?, tel=? where id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, member.getName());
					pstmt.setString(2, member.getAddress());
					pstmt.setString(3, member.getTel());
					pstmt.setString(4, member.getId());

					pstmt.executeUpdate();
					x = 1; // 수정 성공
				} else {
					x = 0; // 수정 실패
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e) {
				}
		}
		return x;
	}

	
	// 회워 탈퇴
		public int deleteMember(String id, String passwd) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			SHA256 sha = SHA256.getInsatnce();

			int x = -1;

			try {
				conn = getConnection();
				pstmt = conn
						.prepareStatement("select passwd from member where id =?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				String orgPass = passwd;
				String shaPass = sha.getSha256(orgPass.getBytes());

				if (rs.next()) {
					String dbpasswd = rs.getString("passwd");
					if (BCrypt.checkpw(shaPass, dbpasswd)) {
						
						String sql = "delete from member where id = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						
						x = 1; //탈퇴 성공
					} else {
						x = 0; // 탈퇴 실패
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (Exception e) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (Exception e) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (Exception e) {
					}
			}
			return x;
		}
}
