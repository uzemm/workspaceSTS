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
	<div>
		<input type="submit" value="로그인" onclick="login();" >
	</div>
</div>
</form>
<script type="text/javascript">
function login(){
	var memberId = document.getElementById('memberId').value;
	var memberPassword = document.getElementById('memberPassword').value;
	
	var formTag = document.getElementById('formTag');
	if(memberId != '' && memberPassword != ''){
		alert('로그인 성공');
	}
	else{
		alert('로그인 실패');
	}
}
</script>
</body>
</html>