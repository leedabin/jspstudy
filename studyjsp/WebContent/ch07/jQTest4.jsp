<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src = "../js/jquery-1.11.2.min.js"></script>
<script>
	$(document).ready(function(){
		$("#b1").click(function(){
			$("#result").load("jQTest2.jsp");
		});
	});
</script>
</head>
<body>

<button id = "b1">결과</button>
<div id = "result"></div>
</body>
</html>