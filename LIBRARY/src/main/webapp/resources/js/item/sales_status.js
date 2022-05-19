//그래프?

var buyDates = document.getElementsByClassName('buyDates'); //일자 lable
var totalPrices = document.getElementsByClassName('totalPrices'); //일자별 매출금액 data 

var buyDate = new Array();
var totalPrice = new Array();

for(var i = 0; i<buyDates.length; i++){
	buyDate.push(buyDates[i].value);
	totalPrice.push(totalPrices[i].value);
}
	
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: buyDate,
      datasets: [
        {
          label: '일자별 매출현황',
          backgroundColor: "#c7e2d1",
          data: totalPrice
        }
      ]
    },
    options: {
		responsive : false,
		legend: {
        	display: false
        },
		scales: {
			yAxes: [{
				ticks: {
					min: 0,
					stepSize : 10000,
				}
			}]
		}
	}
});


function searchPeriod(){
	var inputSDate = document.getElementById('inputSDate').value;
	var inputEDate = document.getElementById('inputEDate').value;
	
$.ajax({
   	url: '/sales/sByItemStatePeriod', //요청경로
    type: 'post',
    data:{'inputSDate':inputSDate,
    	  'inputEDate':inputEDate}, //필요한 데이터 '데이터이름':값
    success: function(result) {
		$('#bar-chart').remove(); // this is my <canvas> element
 		$('.graphBox').append('<canvas id="bar-chart"></canvas>');
  		canvas = document.querySelector('#bar-chart');
  		
		buyDate = [];
		totalPrice = [];
		
		for(var i = 0; i<result.length; i++){
			buyDate.push(result[i].buyDate);
			totalPrice.push(result[i].totalPrice);
		}
			
		new Chart(document.getElementById("bar-chart"), {
		    type: 'bar',
		    data: {
		      labels: buyDate,
		      datasets: [
		        {
		          label: '일자별 매출현황',
		          backgroundColor: "#c7e2d1" ,
		          data: totalPrice
		        }
		      ]
		    },
		   options: {
			responsive : false,
			legend: {
	        	display: false
	        },
			scales: {
				yAxes: [{
					ticks: {
						min: 0,
						stepSize : 10000,
					}
				}]
			}
		}
	});
  },
    error: function(){
      //ajax 실행 실패 시 실행되는 구간
       alert('실패');
    }
});
}


//엑셀 다운로드 관련
function salesExcel(){
	var formObj = $('#ExcelForm');
	formObj.attr('action', '/sales/salesExcel');
	formObj.attr('method', 'post');
	formObj.submit();
}