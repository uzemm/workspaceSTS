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
img{
	padding: 5px;
}


</style>
</head>
<body>
<div class="container">
	<div class="img">
		<img src="/resources/images/book/${bookDetail.bkImg }"  alt="..." height="120px;" width="80px;" align="left">
	</div>
	<div class="title">
		<h3>${book.title }</h3>
	</div>	
	<div class="table">
		<table>
			<tr>
				<td>저자</td>
				<td> ${bookDetail.writer }</td>
				<td>발행처</td>
				<td>${bookDetail.publisher }</td>
				<td>발행년도</td>
				<td>${bookDetail.pubDate }</td>
			</tr>
			<tr>
				<td>청구기호</td>
				<td>청구기호</td>
				<td>ISBN</td>
				<td>ISBN</td>
				<td>키워드</td>
				<td>${bookDetail.keyword }</td>
			</tr>
		</table>
	</div>
	<input type="button" value="추천 ${bookDetail.rcdCnt }" onclick="location.href='rcdBook?bookCode=${bookDetail.bookCode }';">
	<button type="button" onclick="location.href='/book/selectStatus';">${bookDetail.status } ${bookDetail.bkStock }</button>
	

</div>
</body>
</html>