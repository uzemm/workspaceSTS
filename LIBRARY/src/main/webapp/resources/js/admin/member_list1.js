// 알림전송내역 모달 띄우기

function sendMsgList(){
	$.ajax({
		url: '/admin/sendMsgList', 
		type: 'post',
		data: {}, 
		success: function(result) {
			var modalBody =  document.querySelector('#msgModalToggle .modal-body');
			modalBody.innerHTML = '';
			
			var str = '';
			str += '<table class="table text-center table-hover" style="table-layout: fixed; ">';
			 str += '  <colgroup>                                                 ';
            str += '     <col width="10%">                                       ';
            str += '     <col width="*">                                       ';
            str += '     <col width="15%">                                         ';
            str += '     <col width="20%">                                       ';
			str += '<thead>';
			str += '<tr>';
			str += '<th scope="col">No</th>';
			str += '<th scope="col">내용</th>';
			str += '<th scope="col">회원ID</th>';
			str += '<th scope="col">전송날짜</th>';
			str += '</tr>';
			str += '</thead>';
			str += '<tbody>';
			
			for(var i = 0; i < result.length; i++){
				str += '<tr>';
				str += '<th scope="row">'+ 0 +'</th>';
				str += '<td style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><span id="open-msgDetail" onclick="sendMsgDetail('+ result[i].msgCode +');">'+ result[i].msgContent +'</sapn></td>';
				str += '<td>'+ result[i].getId +'</td>';
				str += '<td style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ result[i].sendDate +'</td>';
				str += '</tr>';
			}
			str += '</tbody>';
			str += '</table>';
			
			modalBody.innerHTML = str;
			
			$('#msgModalToggle').modal('show');
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

function sendMsgDetail(msgCode){
	$.ajax({
		url: '/admin/sendMsgDetail', 
		type: 'post',
		data: {'msgCode':msgCode}, 
		success: function(result) {
			var modalBody =  document.querySelector('#msgModalToggle2 .modal-body');
			modalBody.innerHTML = '';
			
			var str = '';
			str += '<table class="table text-center table-hover" style="table-layout: fixed; ">';
			str += '<input type="hidden" name="msgCode" value="'+ result.msgCode +'">';
			 str += '  <colgroup>                                                 ';
            str += '     <col width="25%">                                       ';
            str += '     <col width="25%">                                       ';
            str += '     <col width="25%">                                       ';
            str += '     <col width="25%">                                       ';
			str += '<tr>';
			str += '<th scope="col">회원ID</th>';
			str += '<td>' + result.getId + '</td>';
			str += '<th scope="col">전송날짜</th>';
			str += '<td>'+ result.sendDate +'</td>';
			str += '</tr>';
			str += '<tr>';
			str += '<th scope="col">내용</th>';
			str += '<td colspan="4" style="word-break: break-all">'+ result.msgContent +'</td>';
			str += '</tr>';
			str += '</table>';
			
			modalBody.innerHTML = str;
			
				$('#msgModalToggle').modal('hide');
				$('#msgModalToggle2').modal('show');
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}	
	
	
	
	
	
	
	
	
	
	
	
	