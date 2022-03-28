//joinModalEl 선택
var joinModalEl = document.getElementById('joinModal');
//joinModalEl이 닫힐 때 자동 시작하는 이벤트
joinModalEl.addEventListener('hidden.bs.modal', function (event) {
	//joinModal안에 있는 모든 input태그 선택
	var tags = document.querySelectorAll('#joinModal input');
	

	for(var i = 0; i<tags.length; i++){
		tags[i].value = '';
	}
});

//loginModalEl 선택
var joinModalEl = document.getElementById('loginModal');
//loginModalEl이 닫힐 때 자동 시작하는 이벤트
joinModalEl.addEventListener('hidden.bs.modal', function (event) {
	//loginModal안에 있는 모든 input태그 선택
	var tags = document.querySelectorAll('#loginModal input');

	for(var i = 0; i<tags.length; i++){
		tags[i].value = '';
	}
});

//우편번호 검색 api
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                document.getElementById("addr").value = roadAddr;
            }
        }).open();
    }