function createClub(){
	let memId = document.getElementById('memId').value;
	let clubAdmin = document.getElementById('clubAdmin').value;
	let clubCode = document.getElementById('clubCode').value;
	
	if(memId == ''){
		alert('로그인이 필요합니다.');
		location.href = '/member/login';
	}
	else if(clubAdmin == 'Y'){
		alert('이미 모임을 생성 하였습니다.')
	}
	else if(clubCode != ''){
		alert('이미 모임에 가입되어있습니다.')
	}
	else{
		location.href = '/club/clubCreate';
	}
}

function clubJoin(clubCode, clubApplyCode){
	let memId = document.getElementById('memId').value;
	let club_Code = document.getElementById('clubCode').value;
	
	
	if(memId == ''){
		alert('로그인이 필요합니다.');
		location.href = '/member/login';
	}
	else if(club_Code != ''){
		alert('이미 모임에 가입되어있습니다.')
	}
	//else if(clubApplyCode != ''){
	//	alert('가입 신청한 모임이 존재합니다. ')
	//}
	else{
		location.href = '/club/clubJoinWrite?clubCode=' + clubCode ;
	}
}

$(".open-msgModal").click(function(){
	var data = $(this).data('id');
    $("#messageModal.messageModal").val(data);
});

//드랍메뉴

function msgList(getId){
	
	$.ajax({
		url: '/club/getMsgList1', 
		type: 'post',
		data: {'getId':getId}, 
		success: function(result) {
			var msgList =  document.querySelector('#get-id');
			msgList.innerHTML = '';
			
			var str = '';
			for(var i = 0; i < result.length; i++){
				str += '<li><a class="dropdown-item" href="#">'+ result[i].msgContent +'</a></li>';
			}
			
			msgList.innerHTML = str;
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}


