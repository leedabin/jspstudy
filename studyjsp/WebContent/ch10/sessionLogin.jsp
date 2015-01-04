<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = "";
try{
	id = (String)session.getAttribute("id");
	if(id == null || id.equals("")){
		%>

<form method="post" action="sessionLoginPro.jsp">
	<table>
		<tr>
			<td>아이디
			<td><input id="id" name="id" type="text" size="20">
		<tr>
			<td>비밀번호
			<td><input name="passwd" type="password" required>
		<tr>
			<td colspan="2"><input type="submit" value="로그인"> <input
				type="reset" value="다시작성">
	</table>
</form>

<%
	}else{
		%>
<b><%=id %></b>

님이 로그인 하셨습니다.

<form method="post" action="sessionLogout.jsp">
	<input type="submit" value="로그아웃">
</form>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
