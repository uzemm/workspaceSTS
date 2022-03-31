<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
}
thead{
	font-weight: bold;
	border-top: 2px solid white;
}
thead tr{
	border-bottom: 2px solid white;
}
.row{
	--bs-gutter-x: 0.5rem;
}
</style>
</head>
<body>
<div class="row">
	<div class="col">
		<div class="col-12">
			<table class="table table-striped table-hover text-center align-middle">
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="10%">
					<col width="*">
					<col width="15%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
				<thead style="border-top: 2px solid #BADCE3; ">
					<tr class="table-info">
						<th scope="col">
							<input class="form-check-input" type="checkbox" id="cartCheck" onclick="checkAll();" checked> 
						</th>
						<th scope="col">
							No
						</th>
						<th scope="col">
							상품이미지
						</th>
						<th scope="col">
							상품명
						</th>
						<th scope="col">
							가격
						</th>
						<th scope="col">
							수량
						</th>
						<th scope="col">
							총가격
						</th>
						<th scope="col">
						</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
					<c:when test="${not empty cartList }">
						<c:forEach items="${cartList }" var="item" >
							<tr>
								<td>
									<input class="form-check-input cartCheckBoxes" type="checkbox"  value="${item.itemCode }" checked> 
								</td>
								<td>
									1
								</td>
								<td>
									<img alt="" src="/resources/images/${item.attachedImgName }" width="80px;">
								</td>
								<td>
									${item.itemName }
								</td>
								<td>
									<fmt:formatNumber value="${item.itemPrice }" pattern="￦#,###"/> 
								</td>
								<td>
									<div class="row">
										<div class="col-7 ">
											<input class="form-control" type="number" value="${item.itemCnt }">
										</div>
										<div class="col-5 d-grid">
											<button class="btn btn-primary" type="button" onclick="updateItemCnt(this, '${item.itemCode}', ${item.itemPrice });">변경</button>
										</div>
									</div>
								</td>
								<td class="totalPriceTd">
									<fmt:formatNumber value="${item.totalPrice }" pattern="￦#,###"/>
								</td>
								<td>
									<form action="cartDelete" method="post" id="deleteCartForm">
										<input type="hidden" name="itemCode" value="${item.itemCode }">
										<button class="btn btn-primary" type="button" onclick="cartDelete(this);">삭제</button>
									</form>
								</td>
							</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">
										장바구니에 담긴 상품이 없습니다.
									</td>
								</tr>
							</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<div class="col-12">
			<div class="row">
				<div class="col-1 offset-10 text-end" style="background-color: #BADCE3; padding: 6px; border: 1px solid white; font-style: italic; font-weight: bold; border-top-left-radius: 10px; border-bottom-left-radius: 10px;">구매 가격</div>
				<div class="col-1" style="padding: 6px; border-bottom: 1px solid #BADCE3" id="buyPriceDiv">
				<fmt:formatNumber value="${totalPrice }" pattern="￦#,###"/> </div>
			</div>
		</div>
		<div class="col-12">
			<div class="row" style="margin-top: 20px;">
				<div class="col">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					  <button class="btn btn-primary me-md-2" type="button" onclick="buyItem();">선택구매</button>
					  <button class="btn btn-primary" type="button" onclick="deleteCarts();">선택삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/cart/cart_list.js?ver=33"></script>
</body>
</html>