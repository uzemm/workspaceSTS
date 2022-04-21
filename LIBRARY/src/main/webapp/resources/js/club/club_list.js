function createClub(){
	let memId = document.getElementById('memId').value;
	let clubAdmin = document.getElementById('clubAdmin').value;
	
	if(memId == ''){
		alert('로그인이 필요합니다.');
		location.href = '/member/login';
	}
	if(clubAdmin == 'Y'){
		alert('이미 모임을 생성 하였습니다.')
	}
	else{
		location.href = '/club/clubCreate';
	}
}

function clubJoin(clubCode){
	let memId = document.getElementById('memId').value;
	
	if(memId == ''){
		alert('로그인이 필요합니다.');
		location.href = '/member/login';
	}
	else{
		location.href = '/club/clubJoinWrite?clubCode=' + clubCode ;
	}
}