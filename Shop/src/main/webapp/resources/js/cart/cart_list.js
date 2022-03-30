//장바구니 상품 삭제
function cartDelete(tag){
	var result = confirm('정말 삭제할까요?');
	
	if(result){
		//var formTag = document.getElementById('deleteCartForm');
		//formTag.submit();
		
		tag.parentNode.submit();
		
	}
}

//상품 수량 변경
function updateItemCnt(selectedTag, itemCode){
	var itemCnt = selectedTag.parentNode.previousElementSibling.firstElementChild.value;

	$.ajax({
		url: '/cart/updateItemCnt', //요청경로
		type: 'post',
		data: {'itemCnt':itemCnt, 'itemCode':itemCode}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			alert('수량이 변경되었습니다.');
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}