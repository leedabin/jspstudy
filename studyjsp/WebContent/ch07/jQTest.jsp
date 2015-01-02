<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
div#displayArea {
	width: 200px;
	height: 200px;
	border: 5px double #6688FF;
}
</style>

<script src="../js/jquery-1.11.2.min.js"></script>
<script>
$(document).ready(function(){
	$("button").click(function(){
		$("#displayArea").html("<img src='1.png' border='0'/>");
	});
});
</script>


</head>
<body>

<div id="displayArea"> 이곳의 내용이 변경</div>

<button>표시</button>

</body>
</html>