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
	text-align: center;
	margin: 0 auto;
}
table{
	width: 800px;
	border: 1px solid black;
	border-collapse: collapse;
	margin-top: 30px;
	color: white;
	font-weight: bold;
}
a{
	text-decoration: none;
	color: white;
}
table td{
	border: 1px solid black;
}
.tableDiv tr{
	background-color: #82B3DF;
}
.deptDiv{
	text-align: center;
	margin-top: 40px;
	margin-bottom: 40px;
}
.empList table{
	width: 600px;
	margin-left: 40px;
	color: black;
	font-weight: normal;
}
.empList table td{
	border: 1px solid black;
}
.empList table thead tr{
	border-bottom: 1px solid black;
	border-top: 1px solid black;
	
}
</style>
</head>
<body>
<div class="container">
	<div class="tableDiv">
		<table>
			<colgroup>
				<col width="25%">
				<col width="25%">
				<col width="25%">
				<col width="25%">
			<tr>
				<td><a href="/emp/deptHome">홈</a></td>
				<td><a href="/emp/deptManage">부서관리</a></td>
				<td><a href="/emp/empWrite">사원등록</a></td>
				<td><a href="/emp/empList">사원목록</a></td>
			</tr>
		</table>
	</div>
	
	<div class="empList">
		<table>
		<colgroup>
			<col width="10%">
			<col width="*">
			<col width="25%">
			<thead>
				<tr>
					<td rowspan="2">No.</td>
					<td colspan="4">사원정보</td>
					<td colspan="2">부서정보</td>
				</tr>
				<tr>
					<td>사원명</td>
					<td>연락처</td>
					<td>성별</td>
					<td>나이</td>
					<td>부서명</td>
					<td>지역</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${empList }" var="emp" varStatus="status">
					<tr>
						<td>${status.index + 1 }</td>
						<td>${emp.eName }</td>
						<td>${emp.tell }</td>
						<td>${emp.gender }</td>
						<td>${emp.eAge }</td>
						<td>${emp.dName }</td>
						<td>${emp.region }</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
	</div>
</div>
</body>
</html>