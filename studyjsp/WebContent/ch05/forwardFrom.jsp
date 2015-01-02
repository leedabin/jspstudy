<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("utf-8"); %>

<%
	request.setAttribute("id", "kingdora");
	request.setAttribute("name", "이다빈");
	
%>

forwardFrom.jsp 페이지 입니다.<br>

화면에 절대 표시되지 않음.

<jsp:forward page="forwardTo.jsp"/>