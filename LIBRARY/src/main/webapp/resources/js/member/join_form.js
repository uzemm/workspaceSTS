/*아이디 중복 체크 */
function checkId(){
const memId = document.getElementById('inputId').value;

$.ajax({
		url: '/member/checkId', //요청경로
		type: 'post',
		data: {'memId':memId}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			if(result === 1){
				alert('조회 결과 1')
				$('.id-unavailable').css("display", "inline-block");
				$('.id-available').css("display", "none");
			}
			else if(result === 0) {
				alert('조회 결과 0')
				$('.id-available').css("display", "inline-block");
				$('.id-unavailable').css("display", "none");
			}
			
		},
		error: function() {
			
			alert('실패');
		}
	});
}

/*우편번호 검색*/
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("inputAddr").value = roadAddr;
            	}
      	  }).open();
    	}

/*회원가입*/
function joinMember(){
	document.getElementById('joinForm').submit();
	
	const complitJoin = confirm("회원가입이 완료되었습니다. 로그인 하시겠습니까?");
	if(complitJoin == true){
		location.href='/member/login';
	}
	else if(complitJoin == false){
		location.href='/admin/test';
	}
	
}