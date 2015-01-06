$(document).ready(function(){
	//회원가입 버튼 누르면 자동실행
	$("#register").click(function(){
		//회원가입폼 페이지를 main_auth인 영역에 로드
		$("#main_auth").load("registerForm.jsp");
	});
});