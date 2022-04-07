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
	width: 700px;
	margin: 0 auto;
}
table{
	width: 700px;
	margin-bottom: 20px;
}

</style>
</head>
<body>
<form action="/board/login" method="post">
<div class="container">
	<table>
		<tr>
			<td>아이디</td>
		</tr>
		<tr>
			<td><input type="text" name="memberId" id="memId" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
		</tr>
		<tr>
			<td><input type="text" name="memberPassword" id="memPw" required></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="로그인" >
	</div>
</div>
</form>
</body>
</html>