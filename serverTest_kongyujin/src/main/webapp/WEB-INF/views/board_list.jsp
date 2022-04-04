<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/common.css" rel="stylesheet">
<style type="text/css">
table{
	width: 100%;
	text-align: center;
	margin-top: 30px;
	border-collapse: collapse;
}
thead tr{
	background-color: #F0F4FD;
	height: 30px;
	border-top: 1px solid #5489E0;
	border-bottom: 1px solid #5489E0;
}
tbody tr:nth-child(even) {
	background-color: #FeFeFe;
}
tbody tr{
   height: 30px;
   border-bottom: 0.1px solid #F0F4FD;
}
a{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<div class="container">
	<div>
		<h1>B O A R D</h1>
	</div>
	<div>
		<table>
			<colgroup>
				<col width="15%">
				<col width="*">
				<col width="20%">
				<col width="20%">
			<thead>
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board">
				<tr>
					<td>${board.boardNum }</td>
					<td><a href="/board/boardDetail?boardNum=${board.boardNum }">${board.boardTitle }</a></td>
					<td>${board.boardWriter }</td>
					<td>${board.createDate }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		<input class="btn" type="button" value="글쓰기" onclick="location.href='/board/boardWriteForm';">
</div>
</body>
</html>