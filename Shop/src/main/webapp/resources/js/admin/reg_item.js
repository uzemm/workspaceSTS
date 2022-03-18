
//도서 등록 버튼 클릭시 실행
function regBook(){
	var selectbox = document.getElementById('categorySelector').value;
	//카테고리 미선택 시 alert
	if(selectbox == 1){
		alert('카테고리를 선택해주세요!');
		return;
	}
	//도서명 미기입 시 alert
	var bookName = document.getElementById('bookName').value;
	if(bookName == ''){
		alert('도서명은 필수입력입니다.');
		return;
	}
	
	//submit
	var formTag = document.getElementById('regItemForm');
	formTag.submit();
	
}