<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img:hover{
	opacity: 0.7;
}
</style>
</head>
<body>
<div class="row">
	<c:forEach items="${bookList }" var="book">
		<div class="col-3 text-center" style="margin-bottom: 16px;">
			<div class="card" style="width: 13rem; margin: 0 auto;">
			  <a href="/book/bookDetail?bookCode=${book.bookCode }"><img src="/resources/images/book/${book.bkAtImgName }" class="card-img-top" alt="..." height="250px;"></a>
			  <div class="card-body" style="padding: 0.2rem 1.2rem;">
			    <h5 class="card-title">${book.bookName }</h5>
			    <p class="card-text">
			    	<fmt:formatNumber value="${book.bookStock }" pattern="\#,###"/>
			    </p>
			  </div>
			</div>
		</div>
	</c:forEach>
	<a href="/admin/regBook">등록</a>
</div>
</body>
</html>
