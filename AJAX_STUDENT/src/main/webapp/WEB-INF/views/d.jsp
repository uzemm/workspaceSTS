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
<table>
	<colgroup>
		<col width="50%">
		<col width="50%">
	<tr>
		<td>
			<div style="text-align: center;">
				<select>
					<option>전체</option>
					<c:forEach items="${classList }" var="classInfo">
						<option>${classInfo.className }</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<table class="stuTable">
					<tr>
						<td>No</td>
						<td>학생명</td>
						<td>반이름</td>
					</tr>
					<c:forEach items="${studentList }" var="stuInfo">
					<tr>
						<td></td>
						<td>${stuInfo.stuName }</td>
						<td>${stuInfo.className }</td>
					</tr>
					</c:forEach> 
				</table>
			</div>
		</td>
		<td></td>
	</tr>
</table>
</body>
</html>