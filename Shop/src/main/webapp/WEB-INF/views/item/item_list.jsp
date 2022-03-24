<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.card:hover{
	opacity: 0.7;
	cursor: pointer;
}
</style>
</head>
<body>
<div class="row">
	<c:forEach items="${itemList }" var="item">
		<div class="col-2" style="margin-bottom: 10px;">
			<div class="card" style="width: 12rem;">
			  	<a href="/item/itemDetail?itemCode=${item.itemCode }"><img src="/resources/images/${item.attachedImgName }" class="card-img-top" height="260px;" ></a>
			  	<div class="card-body" style="padding: 0.5rem 0.8rem;">
			   	 <h5 class="card-title">${item.itemName }</h5>
			   	 <p class="card-text"><fmt:formatNumber value="${item.itemPrice }" pattern="#,###원"/></p>
			  	</div>
			</div>
		</div>
	</c:forEach>
</div>
</body>
</html>