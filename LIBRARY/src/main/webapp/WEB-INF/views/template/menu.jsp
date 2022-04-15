<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style type="text/css">
	body{
		margin: 0px;
	}
	.top-container{
		background-color: #02475E;
		height: 100%;
	}
	
	.header-loginBox{
		display: flex;
		justify-content: flex-end;
		align-items: center;
		height: 3rem;
		position: relative;
		right: 21%;
	
	}
	.header-loginBoxDiv{
		margin: 2rem 0.5rem;
		color: #FDFAF6;
	}
	.header-mainBox{
		display: flex;
		position: relative;
		height: 7rem;
		width: 59%;
		left: 18%;
		align-items: center;
		justify-content: space-between;
	}
	.nav-logoDiv{
		background-color: #FDFAF6;
	}
	.header-profile{
		background-color: #F4EEE8;
	}
	.nav-main-menu{
		background-color: #FAF1E6;
	}
	.nav-main-menu ul{
		display: flex;
		height: 5rem;
		align-items: center;
		justify-content: center;
		list-style: none;
	}
	.nav-main-menu li{
		font-size: 1.4rem;
		margin: 2rem;
	}

</style>
</head>
<body>
<div class="top-container">
	<header>
		<div class="header-loginBox">
			<div class="header-loginBoxDiv">로그인</div>
			<div class="header-loginBoxDiv">회원가입</div>
		</div>
		<div class="header-mainBox">
			<div class="nav-logoDiv"><h1>양심 도서관</h1></div>
			<div class="header-profile">프로필 공간</div>
		</div>
	</header>
	<nav>
		<div class="nav-main-menu">
			<ul>
				<li>도서관소개</li>
				<li>자료검색</li>
				<li><a href="/club/clubList">북클럽</a></li>
				<li>도서관이용</li>
				<li>참여마당</li>
			</ul>
		</div>
	</nav>
</div>
</body>
</html>