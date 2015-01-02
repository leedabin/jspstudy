<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ page import="java.sql.Timestamp"%>
<%request.setCharacterEncoding("utf-8"); %>


<jsp:useBean id="registerBean" class="ch08.register.RegisterBean">
	<jsp:setProperty name = "registerBean" property = "*"/>
</jsp:useBean>

<% 
	registerBean.setReg_date(new Timestamp(System.currentTimeMillis()));
%>

아이디 : <jsp:getProperty property="idt" name="registerBean"/> <br>

비밀번호 : <jsp:getProperty property="passwd" name="registerBean"/> <br>

이름 : <jsp:getProperty property="name" name="registerBean"/> <br>

가입일 : <jsp:getProperty property="reg_date" name="registerBean"/> 

