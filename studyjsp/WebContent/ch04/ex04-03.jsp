<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="get" action="#">

		<dl>
			<dd>
				<label for="var1">값1</label> <input id="var1" name="var1"
					type="text" placeholder="첫번째 값" required>
			</dd>

			<dd>
				<label for="var2">값2</label> <input id="var2" name="var2"
					tyep="text" placeholder="두번째 값" required>

			</dd>
			<dd>
				<input type="submit" value="결과">
			</dd>
		</dl>
	</form>

</body>
</html>

<%
	if (request.getParameter("var1") != null
			&& request.getParameter("var2") != null) {

		int var1 = Integer.parseInt(request.getParameter("var1"));
		int var2 = Integer.parseInt(request.getParameter("var2"));

		int result = var1 + var2;

		out.println("두 값의 합은" + result + "입니다.");
	}
%>
