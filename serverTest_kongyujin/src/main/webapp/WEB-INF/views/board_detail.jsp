<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/common.css" rel="stylesheet">
<style type="text/css">
table{
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-top: 30px;
}
table tr, td{
	border: 0.5px solid black;
	height: 40px;
}
</style>
</head>
<body>
<div class="container">
	<div>
		<table>
			<colgroup>
				<col width="15%">
				<col width="20%">
				<col width="20%">
				<col width="*">
			<tr>
				<td>글번호</td>
				<td>${board.boardNum }</td>
				<td>제목</td>
				<td>${board.boardTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.boardWriter }</td>
				<td>작성일</td>
				<td>${board.createDate }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" style="text-align: left;">${board.boardContent }</td>
			</tr>
		</table>
	</div>
		<input class="btn" type="button" value="뒤로가기" onclick="location.href='/board/boardList';">
</div>
</body>
</html>