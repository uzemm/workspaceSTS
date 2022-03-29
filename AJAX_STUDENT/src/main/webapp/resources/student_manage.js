function selectStuListAjax(){
	var classCode = document.getElementById('a').value;
	
	$.ajax({
		url: '/student/studentListAjax', //요청경로
		type: 'post',
		data: {'classCode':classCode}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//조회된 데이터를 화면에 뿌려준다.
			//테이블의 내용 삭제
			document.getElementById('stuListTbody').innerHTML = '';
			
			//태그에 다시 추가할 태그 생성
				var str = '';
			for(var i = 0; i < result.length; i++){
				str += '<tr>';
				str += '<td>'+ (result.length - i) +'</td>';
				str += '<td>'+ result[i].stuName + '</td>';
				str += '<td>' + result[i].className + '</td>';
				str += '</tr>';
			
			}
			document.getElementById('stuListTbody').innerHTML = str;
			
						
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

function stuDetailAjax(stuNum){
	$.ajax({
		url: '/student/stuDetail', //요청경로
		type: 'post',
		data: { 'stuNum': stuNum }, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			alert('성공');
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}










