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
	text-align: center;
}
.login{
	text-align: right;
	margin-bottom: 20px;
}
table{
	width: 700px;
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
}
table tr{
	border: 1px solid black;
}
.btnDiv{
	margin-top: 20px;
}
</style>
</head>
<body>
<div class="container">
	<div class="login">
		<c:if test="${not empty sessionScope.loginInfo }">
			${sessionScope.loginInfo.memberName  }님 반갑습니다.
		</c:if>
	</div>
	<div>
		<table>
		<colgroup>
			<col width="20%">
			<col width="20%">
			<col width="15%">
			<col width="15%">
			<col width="30%">
			<thead>
				<tr>
					<td>아이디</td>
					<td>이름</td>
					<td>나이</td>
					<td>주소</td>
					<td>생일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList }" var="member">
					<tr>
						<td>${member.memberId }</td>
						<td>${member.memberName }</td>
						<td>${member.memberAge }</td>
						<td>${member.memberAddr }</td>
						<td>${member.memberBirthday }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="btnDiv">
	<c:if test="${sessionScope.loginInfo.adminYn eq 'Y' }">
		<input type="button" value="관리자메뉴" onclick="location.href='/board/adminMenu'">
	</c:if>
	</div>
</div>
</body>
</html>