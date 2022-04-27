<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.complitBookList{
		width: 20rem;
	}
	.complitBookList >div{
		text-align: center;
	}
	.complitBookList > div:nth-child(1n){
		background-color: #FF8080; /* 붉은색 */
		border-radius: 5px;
		height: 2rem;
	}
	.complitBookList > div:nth-child(2n){
		background-color: #FFF7BC; /* 노란색 */
		border-radius: 2px;
		position: relative;
		right: 20px;
		height: 4rem;
	}
	.complitBookList > div:nth-child(3n){
		background-color: #C0EDA6; /* 연두색 */
		border-radius: 10px;
		position: relative;
		left: 10px;
		height: 2rem;
		
	}
</style>
</head>
<body>
독서 플래너
<div class="complitBookList">

<c:forEach items="${complitBookList }" var="complitBook">
	<div style="height: ${complitBook.bkPage}rem;">${complitBook.title }</div>
</c:forEach>

</div>
<button onclick="location.href='/member/bookPlanerForm';">기록하기</button>
</body>
</html>

