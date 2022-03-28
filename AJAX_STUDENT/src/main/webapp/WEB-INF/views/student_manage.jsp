<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.stuTable {
	margin: 0;
	width: 400px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
.stuTable tr, td{
	border: 1px solid black;
}
</style>
</head>
<body>
<table class="class">
	<tr>
		<td>
			<select>
					<option>전체</option>
				<c:forEach items="${classList }" var="classInfo">
					<option>${classInfo.className }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<table class="stuTable">
	<thead>
		<tr>
			<td>No</td>
			<td>학생명</td>
			<td>반이름</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${studentList }" var="student">
			<tr>
				<td>${student.stuNum }</td>
				<td>${student.stuName }</td>
				<td>${student.className }</td>
			</tr>
		</c:forEach> 
	</tbody>
</table>
</body>
</html>