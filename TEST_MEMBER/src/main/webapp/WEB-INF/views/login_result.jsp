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
<c:choose>
	<c:when test="${not empty result }">
		<script type="text/javascript">
			alert('로그인 성공');
			location.href = '/board/boardList';
			</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('로그인 실패');
			location.href = '/board/login';
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>