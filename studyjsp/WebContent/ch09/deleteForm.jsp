<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="deletePro.jsp">
		<table border='1'>
			<tr>
				<td>아이디
				<td><input type="text" name="id" autofocus required>
			<tr>
				<td>비밀번호
				<td><input type="password" name="pass" required>
			<tr>
				<td colspan=2><input type="submit" value="회원탈퇴"><input type="reset" value="다시작성">
		</table>
	</form>
</body>
</html>