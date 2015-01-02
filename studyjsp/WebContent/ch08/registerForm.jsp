<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="registerPro.jsp">

		<dl>
			<dd>
				<label for="idt">아이디</label> <input id="idt" name="idt" type="text"
					size="20" maxlength="30" placeholder="example@kings.com" autofocus
					required>

			</dd>

			<dd>
				<label for="passwd">비밀번호</label> <input id="passwd" name="passwd"
					type="password" size="20" required>
			</dd>

			<dd>
				<label for="name">이름</label> <input id="name" name="name"
					type="text" size="20" requried>
			</dd>

			<dd>
				<input type="submit" value="회원가입"> <input type="reset"
					value="다시작성">

			</dd>
		</dl>


	</form>

</body>
</html>