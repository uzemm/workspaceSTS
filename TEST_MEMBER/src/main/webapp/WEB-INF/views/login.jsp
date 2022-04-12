<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'MinSans-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/MinSans-Medium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body{
	font-family: 'MinSans-Medium';
}
.container{
	width: 700px;
	margin: 0 auto;
}
table{
	margin: 0 auto;
}
.btnDiv{
	text-align: center;
	margin-top: 20px;
}

</style>
</head>
<body>
<form action="/board/login" method="post" id="formTag">
<div class="container">
	<table>
		<tr>
			<td>아이디</td>
		</tr>
		<tr>
			<td><input type="text" name="memberId" id="memberId" ></td>
		</tr>
		<tr>
			<td>비밀번호</td>
		</tr>
		<tr>
			<td><input type="text" name="memberPassword" id="memberPassword" ></td>
		</tr>
	</table>
	<div class="btnDiv">
		<input type="submit" value="로그인" >
	</div>
</div>
</form>
</body>
</html>