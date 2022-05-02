<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="pageName">
	나의 북클럽
</div>
클럽명 : <a href="/club/clubDetail?clubCode='${sessionScope.loginInfo.clubCode }'">${myBookClub.clubName }</a>
<c:if test="${not empty sessionScope.loginInfo }">
<div class="row">
	<div class="col-6">
		<table class="table" style="text-align: center;">
		  <thead>
		    <tr>
		      <th scope="col">클럽명</th>
		      <th scope="col">신청날짜</th>
		      <th scope="col">상태</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>${myBookClub.clubName }</td>
		      <td>${myBookClub.clubName }</td>
		      <td>승낙대기중…</td>
		    </tr>
		  </tbody>
		</table>
	</div>
</div>
</c:if>
</body>
</html>