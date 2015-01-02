<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="../js/jquery-1.11.2.min.js"></script>
<script>

	$(document).ready(function(){
		
		$("#b1").click(function(){
			$("#b2").text("이미지 표시");
		});
		
		$("#b2").click(function(){
			//$("#display").show();
			$("#display").show().html("<img src= 'help2.png' border = '0' width = '20%' height = '20%'/>");
		});
		
		$("#b3").click(function(){
			$("#display").hide();
		});
		

		$("p").mouseleave(function(){
			$(this).text("가지마!");
		}).mouseenter(function(){
			$(this).text("왔구려, 마우스 포인터!!");
		});
	
		$("#b4").dblclick(function(){
			$("#body").css("background-color","#cccccc");
		});
	});

</script>

</head>
<body id = "body">
	<button id="b1">버튼 레이블 변경</button>
	<div id="display"></div>
	<button id="b2">버튼</button>
	<button id="b3">숨기기</button>
	<button id="b4">배경색바꾸기 더블클릭</button>
	<br>
	<p>마우스 포인터를 여기에!</p>
</body>
</html>