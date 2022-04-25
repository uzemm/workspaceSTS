function cbRegCmt(){
	var formTag = document.getElementById('cbRegCmt');
	
	formTag.submit();
	location.reload();
}

function updateCmt(){
	var cmtContent = document.getElementById('cmtContent').value;
	var cmt = document.getElementById('updateCmt');
	cmt.innerHTML = '';
	
	var str = '';
	
	str += '<input type="text" name="cmtContent">'+ cmtContent;
	str += '<input type="submit" value="수정완료">'
	
	cmt.innerHTML = str;
	
	
}

function deleteCmt(memId, cbCmtNum){
	
	let result = confirm('댓글을 삭제하시겠습니까?');
	
	if(result){
		$.ajax({
			url: '/club/deleteCbCmt', //요청경로
			type: 'post',
			data: {'memId':memId, 'cbCmtNum':cbCmtNum}, //필요한 데이터 '데이터이름':값
			success: function(result) {
				//ajax 실행 성공 후 실행할 코드 작성
				location.reload();
			},
			error: function() {
				//ajax 실행 실패 시 실행되는 구간
			}
		});
	}
	else{
		return;
	}
}