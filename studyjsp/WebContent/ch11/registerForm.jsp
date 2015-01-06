<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/style.css"/>
<script src="../js/jquery-1.11.2.min.js"></script>
<script src="register.js"></script>
</head>
<body>
<div id="regForm" class="box">
	<ul>
		<li><label for="id">아이디</label>
		<input id="id" name="id" type="email" size="20"
		autofocus required>
		<button id="checkId">ID중복확인</button>
		<li><label for="passwd">비밀번호</label>
		<input id="passwd" name="passwd" type="password" size="20">
		<li><label for="repass">비밀번호 재입력</label>
		<input name="repass" id="repass" type="password" size="20" placeholder="비밀번호 재입력">
		<li><label for="name">이름</label>
		<input id="name" name="name" type="text" placeholder="홍길동">
		<li><label for="address">주소</label>
		<input id="address" name="address" type="text" placeholder="주소 입력">
		<li><label for="tel">전화번호</label>
		<input id="tel" name="tel" type="tel" size="20" placeholder="전화번호 입력">
		<li class="label2"><button id="process">가입하기</button>
		<button id="cancle">취소</button>
	</ul>
</div>
</body>
</html>