<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row justify-content-center">
	<div class="col-6">
		<div class="row">
			<div class="col">
				<c:forEach items="${item.imgList }" var="img">
					<c:if test="${img.isMain eq 'Y' }">
						<img alt="" src="/resources/images/${img.attachedImgName }" width="70%">
					</c:if>
				</c:forEach>
			</div>
			<div class="col">
				<div class="col-12" style="height: 20%; display: flex; align-items: center;">
					${item.itemName }
				</div>
				<div class="col-12" style="height: 20%; display: flex; align-items: center;">
					<span id="priceSpan" data-price="${item.itemPrice }">
						<fmt:formatNumber value="${item.itemPrice }" pattern="￦#,###"/>
					</span>
				</div>
				<div class="col-12" style="height: 20%; display: flex; align-items: center;">
					수량 <input id="ea" type="number" class="form-control" value="1" min="1" max="10">
				</div>
				<div class="col-12" style="height: 20%; display: flex; align-items: center;">
					<span id="totalPriceSpan">${item.itemPrice }</span>
				</div>
				<div class="col-12 d-grid gap-2 d-md-block" style="height: 20%; display: flex; align-items: center;">
					<button type="button" class="btn btn-primary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
  						<path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
						</svg>
						장바구니
					</button>
					<button type="button" class="btn btn-success">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
						<path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
						</svg>
						바로구매
					</button>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col" style="margin-top: 20px;">
				${item.itemDetail }
			</div>
		</div>
		<div class="row">
			<div class="col" style="margin-top: 20px;">
				<c:forEach items="${item.imgList }" var="img">
					<c:if test="${img.isMain eq 'N' }">
						<img alt="" src="/resources/images/${img.attachedImgName }" width="100%">
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/item/item_detail.js"></script>
</body>
</html>