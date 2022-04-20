//form태그를 선택
$('#insertForm').validate({
	//true : 유효성 검사 성공 시에도 submit이 되지 않음.
	debug: false,
	
	//유효성 검사 대상 설정 
	rules: {
		id: { //input 태그의 name 속성으로 검사 대상을 지정
			required: true, //필수입력
			minlength: 2, //최소길이
			maxlength: 6 //최대길이
		},
		email: {
			required: true,
			email: true //이메일 형식
		},
		pw: {
			required: true,
		},
		pwConfirm: {
			required: true,
			equalTo: '#pw'
		}
	},
	//유효성 검사 실패 시 나타날 메세지 설정
	messages: {
		id: {//input 태그의 name 속성으로 검사 대상을 지정
			required: "아이디를 입력하시오.",
			minlength: "아이디는 2자 이상 입력해주세요!",
			maxlength: "아이디는 6글자 이하로 작성해주세요."
		},
		email: {
			required: "이메일을 입력하시오.",
			email: "이메일 형식이 올바르지 않습니다."
		},
		pwConfirm: {
			equalTo: "입력하신 비밀번호가 일치하지 않습니다."	
		}
	},
	//유효성 실패 시 추가할 태그 (defalut:label)
	errorElement: 'div',
	//유효성 검사 실패 시 메세지 출력 방식
	errorPlacement: function(error, element) {
		//element: 유효성 검사 실패한 태그(input)
		//error: 검사 실패 시 자동 추가되는 태그
		error.insertAfter(element);
		error.css('color', 'red');
		error.css('font-size','12px');
	},
	//유효성 검사 성공 시 실행
	submitHandler: function(form) {
		form.submit();   //유효성 검사를 통과시 전송
	}
});