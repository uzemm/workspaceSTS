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
.btnDiv{
	text-align: center;
	margin-top: 150px;
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
	<div class="btnDiv">
		<h1>사원 관리 시스템</h1>
	</div>
</div>
</body>
</html>