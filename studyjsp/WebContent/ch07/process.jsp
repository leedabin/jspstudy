<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%	
	request.setCharacterEncoding("utf-8");
%>

<%
	String resultStr ="";
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	resultStr += "아이디 : " + id +"<br>" ;
	resultStr += "비밀번호 : " + pass +"<br>";
	
	out.println(resultStr);
%>