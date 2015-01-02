<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
#result {
	width: 200px;
	height: 200px;
	border: 5px double #6699FF;
}
</style>

<script src="../js/jquery-1.11.2min.js"></script>

<script>
	
	$(document).ready(function(){
		
		$("#submit").click(function(){
			$.post("process.jsp",{id:"hi", pass:"1234"},
			function(data,status){
				if(status == "success")
					$("#result").html(data);
			});
			
			alert("버튼 클릭");
		});
		
	});

</script>

</head>
<body>

	아이디와 비밀번호 입력
	<br>
	<br>



	<dl>
		<dd>
			<label for="id">아이디</label> <input id="id" name="id" type="text"
				placeholder="aaa@aaa.com" autofocus required>
		</dd>
		<dd>
			<label for="pass">비밀번호</label> <input id="pass" name="pass"
				type="password" placeholder="ooooo" required>
		</dd>
		<dd>
			<!--<input id="submit" type="submit" value="확인">-->
			<button id="submit">확인2</button>
		</dd>
	</dl>



	결과
	<br>

	<div id="result"></div>

</body>
</html>