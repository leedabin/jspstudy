<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
%>

forwardTo.jsp 페이지입니다. <br>
아이디 : <%=id%>	<br>
이름  : <%=name%> 
