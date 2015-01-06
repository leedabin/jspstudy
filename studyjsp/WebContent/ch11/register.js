var status = true;

//=============================================================
$(document).ready(function() {
	// ID중복확인 버튼
	$("#checkId").click(function() {
		if ($("#id").val()) {
			// 아이디를 입력하고 중복확인 버튼 클릭한경우
			var query = {
				id : $("#id").val()
			};

			$.ajax({
				type : "post",// 요청방식
				url : "confirmId.jsp",// 요청페이지
				data : query,// 파라미터
				success : function(data) {
					if (data == 1) { // 사용할수 없는 아이디
						alert("사용할수 없는 아이디");
						$("#id").val("");
					} else if (data == -1)// 사용할수 있는 아이디
						alert("사용할수 있는 아이디");
				}
			});
		} else {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		}
	});
//=============================================================
	// 가입하기 버튼을 클릭
	// registerPro.jsp 페이지실행
	$("#process").click(function() {

		checkIt();
		if (status) {
			var query = {
				id : $("#id").val(),
				passwd : $("#passwd").val(),
				name : $("#name").val(),
				address : $("#address").val(),
				tel : $("#tel").val()
			};

			$.ajax({
				type : "post",
				url : "registerPro.jsp",
				data : query,
				success : function(data) {
					window.location.href("main.jsp");
				}
			});
		}
	});
//===============================================================
	//취소 버튼 클릭 하면 실행
	$("#cancle").click(function(){
		window.location.href("main.jsp");
	});
//===============================================================
	//사용자가 입력 폼에 입력한 상황 체크
	function checkIt(){
		
		status = true;
		
		if(!$("#id").val()){
			alert("아이디를 입력하세요");
			$("#id").focus();
			status = false;
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}
		

		if(!$("#passwd").val()){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			status = false;
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}
		
		//비밀번호 동일하지 않음
		if($("#passwd").val()!=$("#repass").val()){
			alert("비밀번호를 동일하게 입력하세요");
			$("#repass").focus();
			status=false;
			return false;
		}
		
		
		if(!$("#name").val()){
			alert("이름을 입력하세요.");
			$("#name").focus();
			status = false;
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}
		
		
		if(!$("#address").val()){
			$("#address").focus();
			status = false;
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}
		
		if(!$("#tel").val()){
			$("#tel").focus();
			status = false;
			return false;// 사용자가 서비스를 요청한 시점으로 돌아감
		}
		
	}
})