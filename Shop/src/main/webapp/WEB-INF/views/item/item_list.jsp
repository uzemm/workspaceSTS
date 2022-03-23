<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="card" style="width: 18rem;">
	<c:forEach items="${itemList }" var="item">
	  	<img src="resources/images/${item.attachedImgName }" class="card-img-top" >
	  	<div class="card-body">
	   	 <h5 class="card-title">${item.itemName }</h5>
	   	 <p class="card-text">${item.itemPrice }</p>
	  	</div>
	</c:forEach>
</div>
</body>
</html>