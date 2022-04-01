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
function updateItemCnt(selectedTag, itemCode, itemPrice){
	var itemCnt = selectedTag.parentNode.previousElementSibling.firstElementChild.value;

	$.ajax({
		url: '/cart/updateItemCnt', //요청경로
		type: 'post',
		data: {'itemCnt':itemCnt, 'itemCode':itemCode}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			alert('수량이 변경되었습니다.');
			
			//총 가격 변경
			var totalPrice = itemCnt * itemPrice;
			//closest() : 선택한 태그 기준으로 가장 가까운 부모태그를 찾아감.
			selectedTag.closest('td').nextElementSibling.innerText = '￦'+totalPrice.toLocaleString();

			//구매가격 변경
			var buyPrice = 0;
			var totalPriceTds = document.getElementsByClassName('totalPriceTd');
			for(var i = 0; i < totalPriceTds.length; i++){
				var originPrice = totalPriceTds[i].innerText; //￦10,000
				//substr(시작인덱스, 길이): 문자열 자르기 함수
				var price = parseInt(originPrice.substr(1, originPrice.length-1).replace(/,/g, '')); //10,000 -> 문자
				buyPrice += price;
			}
			document.getElementById('buyPriceDiv').innerText = '￦' + buyPrice.toLocaleString();
			
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}

//전체선택, 전체 해제
function checkAll(){
	var allCheck = document.getElementById('cartCheck').checked;
	var checkBoxes = document.getElementsByClassName('cartCheckBoxes');
	
	//제목줄의 체크박스가 체크 되었을 때
	if(allCheck){  //id 를 사용하여 하나의 객체만을 호출
	         for(var i = 0; i < checkBoxes.length; i++) 
	         	checkBoxes[i].checked = true;   //name 을 사용하여 배열 형태로 담아 호출
	      }
	else{
         for(var i = 0; i < checkBoxes.length; i++) 
         	checkBoxes[i].checked = false;  
      }
}

//선택삭제
function deleteCarts(){
/*	var checkBoxes = document.getElementsByName('cartCheckBoxes');
	
	var cnt = 0;
	for(var i = 0; i < checkBoxes.length; i++){
		if(checkBoxes[i].checked){
			cnt++;
		}
	}*/
	var checkBoxes = document.querySelectorAll('.cartCheckBoxes:checked');
	
	if(checkBoxes.length == 0){
		alert('삭제할 상품을 선택해주세요.');
		return;
	}
	
	//선택한 상품코드를 저장할 배열을 생성
	var itemCodeArr = [];
	for(var i = 0; i < checkBoxes.length; i++){
		itemCodeArr[i] = checkBoxes[i].value;
	}
	
	location.href = '/cart/deleteCarts?itemCodeArr=' + itemCodeArr;	
}

//선택구매
function buyItem(){
	//필요한 데이터를 가져온다(상품코드, 수량)
	//체크한 상품의 상품코드
	var checkBoxes = document.querySelectorAll('.cartCheckBoxes:checked');
	var objArr = [];
	
	for(var i = 0; i < checkBoxes.length; i++){
		var obj = new Object();
		
		obj.itemCode = checkBoxes[i].value; //itemCode 빼기
		obj.itemCnt = checkBoxes[i].closest('tr').querySelector('input[type="number"]').value;
	
		objArr[i] = obj;
	}
	//JSON.stringify(objArr);
	$.ajax({
		url: '/buy/buyItem', //요청경로
		type: 'post',
		data: {'data':JSON.stringify(objArr)}, //필요한 데이터 '데이터이름':값
		success: function(result) {
			//ajax 실행 성공 후 실행할 코드 작성
			alert('상품을 구매하셨습니다.');
			
			location.href = '/cart/cartList';
		},
		error: function() {
			//ajax 실행 실패 시 실행되는 구간
			alert('실패');
		}
	});
}
//json(javascript Object notaion )  vs  javascript Object













