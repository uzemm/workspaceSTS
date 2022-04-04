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
	text-align: left;
	margin : auto; 
	margin-top: 30px;
}
table td{
	padding-right: 30px;
	padding-bottom: 5px;
}
</style>
</head>
<body>
<form action="/board/boardWrite" method="post">
	<div class="container">
		<table>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="boardTitle"> 
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="boardWriter">
				</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>
					<input type="date" name="createDate">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="5" cols="30" name="boardContent"></textarea>
				</td>
			</tr>
		</table>
		<input class="btn" type="submit" value="등록" style="margin-top: 20px;">
	</div>
</form>
</body>
</html>