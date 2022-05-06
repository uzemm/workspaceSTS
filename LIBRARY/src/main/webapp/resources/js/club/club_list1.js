function createClub(){
	let memId = document.getElementById('memId').value;
	let clubAdmin = document.getElementById('clubAdmin').value;
	let clubCode = document.getElementById('clubCode').value;
	let clubApplyCode = document.getElementById('clubApplyCode').value;
	
	if(memId == ''){
		alert('로그인이 필요합니다.');
		location.href = '/member/login';
	}
	else if(clubAdmin == 'Y'){
		alert('이미 모임을 생성 하였습니다.')
	}
	else if(clubApplyCode != ''){
		alert('이미 신청한 모임이 존재합니다.')
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
	else if(clubApplyCode != ''){
		alert('이미 신청한 모임이 존재합니다. ')
	}
	else{
		location.href = '/club/clubJoinWrite?clubCode=' + clubCode ;
	}
}

$(".open-msgModal").click(function(){
	var data = $(this).data('id');
    $("#messageModal.messageModal").val(data);
});


// 알림modal
$(document).on('click', '#msgList' , function() {
	
	$('#msgModal').modal('show');
	
});

function msgList(getId){
	
	$.ajax({
		url: '/club/getMsgList', 
		type: 'post',
		data: {'getId':getId}, 
		success: function(result) {
			var tbody =  document.querySelector('#msgModalTable tbody');
			tbody.innerHTML = '';
			
			var str = '';
			$(result).each(function(index, item){
				
					str += '<tr class="msgDetail">';
					str += '<td style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><span id="open-msgDetail" data-msgCode="'+ item.msgCode +'">'+ item.msgContent +'</span></td>';
					str += '<td style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ item.sendDate +'</td>';
					str += '</tr>';
				
			});	
				$('#msgModalTable tbody').prepend(str);
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}


// 알림창 상세조회
$(document).on('click', '.msgDetail' , function() {
	
		var msgContent= $(this).children().eq(0).text();
		var sendDate = $(this).children().eq(1).text();


		$('#msgContent').text(msgContent);
		$('#sendDate').text(sendDate);
	
	$('#msgModal').modal('hide');
	$('#msgDetailModal').modal('show');
	
});

(function(d){
  var i = 1;
  var data = $(this).data('badge');
  
  var int = window.setInterval(updateBadge, 2000); //Update the badge ever 5 seconds
  var badgeNum;    
  function updateBadge(){//To rerun the animation the element must be re-added back to the DOM
      var badgeChild = data.children[0];
      if(badgeChild.className==='badge-num')
            badge.removeChild(data.children[0]);
      
      badgeNum = document.createElement('div'); 
      badgeNum.setAttribute('class','badge-num');
      badgeNum.innerHTML = i++;
      var insertedElement = data.insertBefore(badgeNum,data.firstChild); 
      console.log(badge.children[0]);
  }
})(document);
