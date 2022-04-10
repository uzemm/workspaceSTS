function login(){

var memberId = document.getElementById('memId').value;
var memberPassword= document.getElementById('memPw').value;

	$.ajax({
		url: '/board/login', //요청경로
		type: 'post',
		data: {'memberId':memberId, 'memberPassword':memberPassword}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			if(data != null){
				alert('로그인 성공');
				
			}
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			if(data = null){
				alert('로그인 실패');
				location.href='/board/login';
			}
		}
	});
}