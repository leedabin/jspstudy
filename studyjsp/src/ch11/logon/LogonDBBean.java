package ch11.logon;

import java.sql.*;

import javax.sql.*;
import javax.naming.*;

import work.crypt.*;

public class LogonDBBean {

	//전역 객체 생성 <- 한개의 객체만 생성해서 공유
	private static LogonDBBean instance = new LogonDBBean();
	
	//객체를 리턴하는 메소드
	public static LogonDBBean getInstatnce(){
		return instance;
	}
	private LogonDBBean(){}
	
	//커넥션 풀에서 커넥션 객체를 얻어내는 메소드
	private Connection getConnection() throws Exception{
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/jsptest");
		return ds.getConnection();
	}
}
