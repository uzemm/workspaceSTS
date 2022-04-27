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
	text-align: left;
	margin-top: 40px;
	margin-bottom: 40px;
}
.deptList table{
	width: 600px;
	margin-left: 40px;
	background-color: white;
	color: black;
	font-weight: normal;
}
.deptList table td{
	border: none;
}
.deptList table tr:nth-child(odd){
	background-color: #E7E7E7;
}
.deptList table thead tr{
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	
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
	
	<form action="/emp/deptEnrollment" method="post">
		<div class="deptDiv">
			<div style="margin-bottom: 20px;">
			-부서등록
			</div>
			<div class="deptDiv" style="margin-left: 40px;">
				부서명 <input type="text" size="10" name="dName"> 
				지역 
				<select style="width: 100px; text-align: center;" name="region">
					<option>서울</option>
					<option>부산</option>
					<option>대구</option>
					<option>인천</option>
					<option>대전</option>
				</select>
				<input type="submit" value="등록">
			</div>
		</div>
	</form>
	<div style="text-align: left; margin-top: 40px;">
		-부서목록
	</div>
	<div class="deptList">
		<table>
		<colgroup>
			<col width="10%">
			<col width="25%">
			<col width="25%">
			<thead>
				<tr>
					<td>부서번호</td>
					<td>부서명</td>
					<td>지역</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${deptList }" var="dept">
					<tr>
						<td>${dept.deptNo }</td>
						<td>${dept.dName }</td>
						<td>${dept.region }</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
	</div>
</div>
</body>
</html>