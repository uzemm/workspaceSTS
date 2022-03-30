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
	width: 900px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}
.container > tbody > tr {
	height: 600px;
	border: 1px solid black;
}
.container > tbody > tr > td{
	border: 1px solid black;
}
.stuTable{
	margin: 0 auto;
	width: 400px;
	border: 1px solid black;
	text-align: center;
	border-collapse: collapse;
}
.stuTable tr, .stuTable, td{
	border: 1px solid black;
}
</style>
</head>
<body>
<table class="stuInfoTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					<tr>
						<td>이름</td>
						<td colspan="3"></td>
					</tr>
					<tr>
						<td>국어점수</td>
						<td></td>
						<td>영어점수</td>
						<td></td>
					</tr>
				</table>
</body>
</html>