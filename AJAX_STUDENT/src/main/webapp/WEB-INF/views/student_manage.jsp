<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 0;
	width: 800px;
}
table tr{
}
</style>
</head>
<body>
<table>
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
	<table>
		<thead>
			<tr>
				<td>No</td>
				<td>학생명</td>
				<td>반이름</td>
			</tr>
		</thead>
		<tbody>
			<tr>
 				<c:forEach items="${studentList }" var="student">
					<td>${student.stuNum }</td>
					<td>${student.stuName }</td>
					<td>${student.className }</td>
				</c:forEach> 
			</tr>
		</tbody>
	</table>
</body>
</html>