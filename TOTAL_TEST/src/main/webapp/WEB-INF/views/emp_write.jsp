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
}
table td{
	border: 1px solid black;
}
.deptDiv{
	text-align: left;
	margin-top: 40px;
	margin-bottom: 40px;
}
.deptDiv table{
	border:none;
	margin: 0 auto;
	width: 500px;
	text-align: left;
}
.deptDiv table td{
	border:none;
}

</style>
</head>
<body>
<div class="container">
	<table>
		<colgroup>
			<col width="25%">
			<col width="25%">
			<col width="25%">
			<col width="25%">
		<tr>
			<td>홈</td>
			<td><a href="/emp/deptManage">부서관리</a></td>
			<td><a href="/emp/empWrite">사원등록</a></td>
			<td><a href="/emp/empList">사원목록</a></td>
		</tr>
	</table>
	
	<form action="/emp/empEnrollment" method="post">
	<div class="deptDiv">
		<table>
			<tr>
				<td>사원명</td>
				<td colspan="3"><input type="text" name="eName"></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><select style="width: 100px; text-align: center;" name="job">
					<option>부장</option>
					<option>과장</option>
					<option>대리</option>
					<option>사원</option>
				</select></td>
				<td>부서<td>
				<td><select style="width: 100px; text-align: center;" name="deptNo">
					<c:forEach items="${deptList }" var="dept">
						<option value="${dept.deptNo }">${dept.dName }</option>
					</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="gender" value="남" checked>남 <input type="radio" name="gender" value="여">여</td>
				<td>나이</td>
				<td><input type="number" name="eAge" min="1" max="70" value="20" style="text-align: center;"></td>
			</tr>
			<tr>
				<td>
					연락처
				</td>
				<td>
					<input type="text" size="3" name="tell"> <input type="text" size="3" name="tell"> <input type="text" size="3" name="tell">
				</td>
			</tr>
		</table>
	</div>
	<div>
		<input type="submit" value="등록">
	</div>
	</form>
</div>
</body>
</html>