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
<table>
	<colgroup>
		<col width="25%">
		<col width="25%">
		<col width="25%">
		<col width="25%">
	<tr>
		<td>홈</td>
<%-- 		<c:forEach items="${menuList }" var="menu">
			<td><a href="/emp/${menu.menuUri }?menuCode=${menu.menuCode }">${menu.menuName }</a></td>
		</c:forEach> --%>
	</tr>
</table>
</body>
</html>