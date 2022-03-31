<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 600px;
	border: 1px solid black;
	border-collapse: collapse;
	height: 100px;
	text-align: center;
	margin-top: 30px;
}
table tr, td{
	border: 1px solid black;
}
</style>
</head>
<body>
<div class="container">
	<div>
		<table>
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
	<div style="text-align: center; width: 600px; margin-top: 20px;">
		<input type="button" value="뒤로가기" onclick="location.href='/board/boardList';">
	</div>
</div>
</body>
</html>