<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/member/menu.css" rel="stylesheet">
</head>
<body>
<div class="top-container">
	<header>
		<div class="header-loginBox">
			<c:choose>
				<c:when test="${not empty sessionScope.loginInfo}">
					<div class="header-loginBoxDiv" id="weather">
						<span></span>
						<span class="weatherIcon"><i class="fa-solid fa-sun"></i></span>
						<span></span>
					</div>
					<div class="header-loginBoxDiv" type="button" >
						<span type="button" class="badge" data-badge="${msgCnt }" id="msgList" onclick="msgList('${sessionScope.loginInfo.memId }');">
							<svg data-badge="6" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
						  		<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
							</svg>
						</span>
					</div>
					<div class="header-loginBoxDiv" onclick="location.href='/member/logout';">로그아웃</div>
				</c:when>
				<c:otherwise>
					<div class="header-loginBoxDiv" onclick="location.href='/member/login';">로그인</div>
					<div class="header-loginBoxDiv" onclick="location.href='/member/join';">회원가입</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="header-mainBox">
			<div class="nav-logoDiv"><a href="/admin/test"><h1>양심<br>도서관</h1></a></div>
			<c:if test="${not empty sessionScope.loginInfo }">
				<div class="header-profile">
					<div><img alt="" src="/resources/images/member/${loginInfo.memImage }"></div>
					<c:if test="${loginInfo.isAdmin eq 'Y' }">
						<span class="adminIcon">👑</span>
					</c:if>
					<div>
						<div>${sessionScope.loginInfo.memName}님 반가워요!</div>
						<div class="header-profile-myPage" onclick="location.href='/member/myPageDetail?memId=${sessionScope.loginInfo.memId}'">
							마이 페이지
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</header>
	<nav>
		<div class="nav-main-menu">
			<ul>
				<li>도서관소개</li>
				<li>
				<a href="/book/list">자료검색</a></li>
				<li>도서관이용</li>
				<li>참여마당
					<ul>
						<li><a href="/board/ntBoardList">공지사항</a></li>
						<li><a href="/otherB/freeBoard">자유게시판</a></li>
						<li><a href="/otherB/qnaBoard">Q&A</a></li>
					</ul>
				</li>
				<li>
				<a href="/item/itemList">Goods</a></li>
				<li>
				<a href="/club/clubList">독서모임</a></li>
				<c:if test="${sessionScope.loginInfo.isAdmin eq 'Y' }" > 
				<li>
					<a href="/admin/adminMenu">관리자메뉴</a>
				</li>
				</c:if>
			</ul>
		</div>
	</nav>
</div>

<script type="text/javascript" src="/resources/js/member/menu.js?ver=3"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js"></script>
</body>
</html>