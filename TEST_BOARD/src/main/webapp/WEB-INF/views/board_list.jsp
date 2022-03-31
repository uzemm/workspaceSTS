<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width: 800px;
	margin: 0 auto;
}
table{
	width: 800px;
	text-align: center;
	border: 1px solid black;
	margin-top: 30px;
}
thead tr{
	margin-bottom: 20px;
	border: 1px solid black;
	
}
.btnDiv{
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="container">
	<div>
		<table>
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
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
	<div class="btnDiv">
		<input type="button" value="글쓰기" onclick="location.href='/board/boardWriteForm';">
	</div>
</div>
</body>
</html>