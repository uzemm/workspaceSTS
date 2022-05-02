
function byteCheck(obj, maxByte){
	
	var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo').innerText = rbyte;
     }	
}
//모달에 id값 넘겨주기
$(".open-msgModal").click(function(){
	var data = $(this).data('id');
    $("#get-name.form-control").val(data);
});


function sendMsgList(){
	$.ajax({
		url: '/admin/sendMsgDetail', //요청경로
		type: 'post',
		data: {}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			alert('성공');
			var modalBody =  document.querySelector('#msgModalToggle.modal-body');
			modalBody.innerHTML = '';
			
			var str = '';
			str += '<table class="table">';
			str += '<thead>';
			str += '<tr>';
			str += '<th scope="col">No</th>';
			str += '<th scope="col">내용</th>';
			str += '<th scope="col">회원Id</th>';
			str += '<th scope="col">전송날짜</th>';
			str += '</tr>';
			str += '</thead>';
			str += '<tbody>';
			
			for(var i = 0; i < result[i].length; i++){
				str += '<tr>';
				str += '<th scope="row">1</th>';
				str += '<td>'+ result[i].messageVO.msgContent +'</td>';
				str += '<td>'+ result[i].messageVO.getId +'</td>';
				str += '<td>'+ result[i].messageVO.sendDate +'</td>';
			}
			str += '</tr>';
			str += '</tbody>';
			str += '</table>';
			
			modalBody.innerHTML = str;
			
			var modalTag = document.getElementById('datailModal');
		 	var myModal = new bootstrap.Modal(modalTag);
			myModal.show();
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}


//대여정보 id값
function borrowInfo(memId){
	location.href = '/admin/borrowInfo?memId=' + memId;
}

//페이징
function search(nowPage){
	document.getElementById('nowPage').value = nowPage;
	var formTag = document.getElementById('searchForm');
	formTag.submit();
}