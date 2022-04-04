<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.searchTable{
   text-align: center;
}
.searchTable > :not(:first-child) {
  /*   border-top: 2px solid currentColor; */
    border-top: 1px solid #dee2e6;
}
.searchTable .searchTitle{
   background-color: #eeeeee;
}
.datailSpan:hover{
	cursor: pointer;
}
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<div class="col">
				<table class="table align-middle searchTable">
					<colgroup>
						<col width="15%">
						<col width="">
						<col width="15%">
						<col width="*">
						<col width="15%">
					</colgroup>
					<tbody>
						<tr>
							<td class="searchTitle">주문번호</td>
							<td><input type="text" class="form-control"></td>
							<td class="searchTitle">구매자</td>
							<td><input type="text" class="form-control"></td>
							<td rowspan="2">
								<button type="button" class="btn btn-secondary w-100 h-100">검색</button>
							</td>
						</tr>
						<tr>
							<td class="searchTitle">구매일시</td>
							<td colspan="3">
								<div class="row">
									<div class="col-5">
										<input type="date" class="form-control" value="2022-04-01">
									</div>
									<div class="col-1 text-center align-self-center">~</div>
									<div class="col-5">
										<input type="date" class="form-control" id="nowDate">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		<div class="row">
			<div class="col">
				<div class="col-12">
					<table class="table table-striped table-hover text-center align-middle ">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="*">
							<col width="*">
						</colgroup>
							<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">주문번호</th>
								<th scope="col">구매자</th>
								<th scope="col">구매일시</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${buyList }" var="buyInfo">
							<tr>
								<td>
									1
								</td>
								<td>
									<span class="datailSpan" onclick="selectBuyListDetail();" >${buyInfo.orderNum }</span>
								</td>
								<td>
									${buyInfo.memId }(${buyInfo.memberVO.memName })
								</td>
								<td>
									${buyInfo.buyDate }
								</td>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- datailModal -->
<div class="modal fade" id="datailModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">구매내역</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
	      <div class="row">
            <div class="col text-center">
               <table class="table table-striped table-hover align-middle">
		              <colgroup>
		                 <col width="10%">
		                 <col width="15%">
		                 <col width="*">
		                 <col width="10%">
		                 <col width="15%">
		                 <col width="15%%">
		              </colgroup>
		        	<thead>
			        	<tr>
			        		<th scope="row">NO</th>
			        		<th scope="row">상품이미지</th>
			        		<th scope="row">상품명</th>
			        		<th scope="row">수량</th>
			        		<th scope="row">구매가격</th>
			        		<th scope="row">구매자</th>
			        	</tr>
		        	</thead>
		        	<tbody>
		        		<tr>
		        			<td>1</td>
		        			<td><img width="60px;" alt="" src="/resources/images/1648136276892_기적적 계산법_메인.jpg"></td>
		        			<td>도서</td>
		        			<td>10</td>
		        			<td>1----</td>
		        			<td>ㅇㅇㅇ</td>
		        		</tr>
		        	</tbody>
		        </table>
		      </div>
		  </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="/resources/js/admin/buy_list.js"></script>
<script type="text/javascript">
	document.getElementById('nowDate').value = new Date().toISOString().substring(0, 10);;
</script>
</body>
</html>