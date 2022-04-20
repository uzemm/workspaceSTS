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
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-bottom: 100px;
}
table tr, td{
	border: 1px solid black;
}
.subDiv{
	margin-left: 100px;
}
.clubCreate{
	text-align: right;
}
</style>
</head>
<body>
<div class="subDiv">
	북클럽조회<br>
	<%-- <c:if test="${sessionScope.loginInfo.clubAdmin eq 'Y' }"> --%>
		<a href="/clubAdmin/clubAdmin?clubCode=${club.clubCode }">북클럽관리</a>
	<%-- </c:if> --%>
</div>

<div class="container">
<div style="margin: 0 auto; margin-bottom: 20px;">북클럽 조회</div>
	<table>
		<thead>
			<tr>
				<td>No</td>
				<td>북클럽명</td>
				<td>인원</td>
				<td>신청</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${clubList }" var="club">
			<tr>
				<td>1</td>
				<td><a href="/club/clubDetail?clubCode=${club.clubCode }">${club.clubName }</a><br>
					${club.clubIntro }</td>
				<td> 0 / ${club.clubHeadCnt }</td>
				<td><input type="button" value="가입하기" onclick="clubJoin('${club.clubCode}')"> </td>
			</tr>
		</c:forEach>	
		</tbody>
	</table>
</div>
<div class="clubCreate">
<input type="hidden" id="memId" value="${sessionScope.loginInfo.memId }">
<%-- <input type="hidden" id="clubAdmin" value="${sessionScope.loginInfo.memId }"> --%>
<input type="button" style="margin-right: 100px;" value="북클럽 생성" onclick="createClub();" >
</div>
<script type="text/javascript" src="/resources/js/club/club_list.js?ver=1"></script>
</body>
</html>