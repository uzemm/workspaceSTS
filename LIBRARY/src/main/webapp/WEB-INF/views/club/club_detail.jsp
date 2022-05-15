<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.clubInfo{
	text-align: left;
	margin-bottom: 20px;
}
img{
	width: 40px;
	height : 40px;
	border-radius: 70%;
	overflow : hidden;
}
.page-item.active .page-link {
	background-color: #ffa900;
	border-color: #ffa900;
}
.page-link {
	color: #ffa900;
}
.page-link:hover{
	color: #ffa900; 
}
.table{
/*  --bs-table-striped-bg: #c7e2d1;  */
	 --bs-table-hover-bg:#ecf7f1; 
	 margin-bottom: 0;
 
}

button.img-button{
	border: none;
	background: transparent;
	font-size: 1.125rem;
}
.fas{
	color: black;
}
.keyword{
	border: none;
	border-bottom: 1px solid black;
	outline: none;
	background: transparent;
	width: 300px;
	color: black;
	font-size: 1.063rem;
	font-style: "Malgun Gothic";
}
select{
	border: none;
	outline: none;
	width: 80px;
	font-size: 1.125rem;
	font-weight: 200;
	background: transparent;
	color: black;
}
.memListT {
	border-spacing: 0 15px;
	border-collapse: separate;
	text-align: left;
}
.memListT thead tr th,
.memListT thead tr td,
.memListT tbody tr th,
.memListT tbody tr td {
	vertical-align: middle;
	border: none;
}
.memListT tbody tr {
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}
.memListT tbody tr td {
	background: #fff;
}
.memListT tbody tr td:nth-child(1) {
	border-radius: 5px 0 0 5px;
}
.memListT tbody tr td:nth-last-child(1) {
	border-radius: 0 5px 5px 0;
}

.user-info {
	display: flex;
	align-items: center;
}
.user-info__img img {
	margin-right: 15px;
	height: 45px;
	width: 45px;
	border-radius: 45px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.active-circle {
	height: 10px;
	width: 10px;
	border-radius: 10px;
	margin-right: 5px;
}
.mem-name{
	margin-right: 15px;
	font-size: 14px;	
}
.dropdown-menu{
	position: absolute; 
	transform: translate3d(38px, 21px, 0px); 
	top: 0px; 
	left: 0px;
	will-change: transform;
}
.board-btn{
	margin-top: 10px;
}
.club-name{
	font-weight: bold;
	font-size: 25px;
	margin-bottom: 15px;
}
.member-count{
	font-size: 15px;
	font-weight: normal;
}
.club-intro{
	margin-bottom: 20px;
}
.club-name, .club-1{
	display: inline-block;
}
.club-name{
	margin-right: 30px;
}
.dropdown{
	margin-top: 20px;
	display: inline-block;
	text-align: right;
}
.club-img img{
	width: 366px;
	height: 205.875px;
	border-radius: 0;
	margin-bottom: 15px;
	image-rendering: -webkit-optimize-contrast;
}
.club-info{
	white-space:pre-line;
	line-height: 30px;
	margin-top: 30px;
	margin-bottom: 30px;
	font-size: 1rem;
}
.club-intro{
	margin-top: 0px;
}
.px-2{
	color: #ffa900;
}
.month-book{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
details{
	font-size: 20px;
	margin-bottom: 30px;
}
.join-btn{
	background-color: #ffa900;
	color: white;
	margin-bottom: 10px;
}
.write-btn {
	background-color: #ffa900;
	color: white;
}
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-9 justify-content-md-end">
			<div class="row">
				<div class="col-6">
						<div class="club-img"><img src="/resources/images/club/${club.cbAtName }"></div>
				</div>
				<div class="month-book col-3">
					5월의 책
					<c:if test="${sessionScope.loginInfo.clubAdmin eq 'Y' }">
						<button type="button" class="btn btn-success btn-sm">Success</button>
					</c:if>
					<div class="book-bg">
						<div>
							
						</div>
					</div>
				</div>
					<div class="board-info">
						<div class="club-name">${club.clubName }</div>
						<div>
							<div class="club-intro">${club.clubIntro}</div>
						</div>
						<div>
							<div class="club-name">모임 인원</div><div class="club-1">${club.clubNumberPeople} / ${club.clubHeadCnt }&nbsp;&nbsp;&nbsp;&nbsp;</div>
							<div class="dropdown">
							멤버목록<a href="#" class="px-2" id="triggerId3" data-bs-toggle="dropdown" aria-expanded="false">click
							</a>
								<div class="dropdown-menu" aria-labelledby="triggerId3">
									<table class="memListT table table-hover">
										<tr>
											<c:forEach items="${memList }" var="mem" >
													<td>
														<div class="user-info__img"><img src="/resources/images/member/${mem.memImage }"></div>
														<div class="mem-name">${mem.memName }</div>
													</td>
											</c:forEach>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div>
							<div class="club-name">모임 장소</div><div class="club-1">${club.clubPlace }</div>
						</div>
						<div>
							<div class="club-name">모임 일정</div><div class="club-1">${club.clubDate }</div>
						</div>
						<div>
							<div class="club-name">독후감&nbsp;&nbsp;&nbsp;&nbsp;</div><div class="club-1">매 모임 2일 전까지 클럽 모임 페이지에 제출 | 최소 글자수 400자</div>
						</div>
					</div>
			</div>
			
				<div>
					<details>
						<summary>북클럽 소개</summary>
						<div class="club-info"><div>${club.clubInfo }</div></div>
					</details>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<a href="#" class="join-btn btn" onclick="clubJoin('${club.clubCode}','${clubApplyCode }');">신청하기</a>
				</div>
				<table class="board-table table table-hover table-border text-center">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<thead>
					<tr>
						<th scope="col">No</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">날짜</th>
						<th scope="col">조회수</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${noticeList }" var="notic">
						<tr class="notic-tr">
							<th><button type="button" class="btn btn-danger btn-sm">공지</button></th>
							<c:choose>
								<c:when test="${sessionScope.loginInfo.clubCode eq notic.clubCode }">
									<th>
										<a href="/club/clubBoardDetail?cbBoardNum=${notic.cbBoardNum }&&clubCode=${notic.clubCode}">
											${notic.cbBoardTitle } (${notic.cbCmtCount })
											</a>
									</th>
								</c:when>
								<c:otherwise>
									<th>
										<a href="" onclick="cbDetail();">${notic.cbBoardTitle } (${notic.cbCmtCount })</a>
									</th>
								</c:otherwise>
							</c:choose>
							<th>${notic.memName }</th>
							<th>${notic.cbBoardDate }</th>
							<th>${notic.cbReadCnt }</th>
						</tr>
					</c:forEach>
					<c:choose>
						<c:when test="${not empty boardList}">
							<c:forEach items="${boardList }" var="boardInfo" varStatus="status">
								<tr>
									<td>${clubBoardVO.totalCnt - boardInfo.rowNum + 1 }</td>
									<c:choose>
										<c:when test="${sessionScope.loginInfo.clubCode eq boardInfo.clubCode }">
											<td><a href="/club/clubBoardDetail?cbBoardNum=${boardInfo.cbBoardNum }&&clubCode=${boardInfo.clubCode}">${boardInfo.cbBoardTitle } (${boardInfo.cbCmtCount })</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="" onclick="cbDetail();">${boardInfo.cbBoardTitle } (${boardInfo.cbCmtCount })</a></td>
										</c:otherwise>
									</c:choose>
									<td>${boardInfo.memName }</td>
									<td>${boardInfo.cbBoardDate }</td>
									<td>${boardInfo.cbReadCnt }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">
									등록된 게시글이 없습니다.
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="board-btn d-grid gap-2 d-md-flex justify-content-md-end" style="margin-bottom: 20px;">
					<c:if test="${sessionScope.loginInfo.clubCode eq club.clubCode  }">
						<button type="button" class="write-btn btn btn-sm" onclick="location.href='/club/clubBoardWrite?clubCode=${club.clubCode}';">글쓰기</button>
					</c:if>
					<c:if test="${sessionScope.loginInfo.clubAdmin eq 'Y' and sessionScope.loginInfo.clubCode eq club.clubCode}">
						<button type="button" class="write-btn btn btn-sm" onclick="location.href='/club/clubDetailUpdate?clubCode=${club.clubCode}';">수정</button>
					</c:if>
				</div>
				<div class="row">
					<div class="col-6">
						<div class="d-grid gap-2 d-md-flex justify-content-center">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm">
									<li class="page-item <c:if test="${!clubBoardVO.prev }">disabled</c:if>">
									<a class="page-link" href="/club/clubDetail?nowPage=${clubBoardVO.beginPage - 1 }&&clubCode=${clubBoardVO.clubCode }"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach begin="${clubBoardVO.beginPage }" end="${clubBoardVO.endPage }" var="pageIndex">
											<li class="page-item <c:if test="${clubBoardVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" 
											href="/club/clubDetail?nowPage=${pageIndex }&&clubCode=${clubBoardVO.clubCode }">${pageIndex }</a></li>
										</c:forEach>
									<li class="page-item <c:if test="${!clubBoardVO.next }">disabled</c:if>"><a class="page-link" href="/club/clubDetail?nowPage=${clubBoardVO.endPage + 1 }&&clubCode=${clubBoardVO.clubCode }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span></a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<div class="d-grid gap-2 d-md-flex justify-content-end">
					<form action="/club/clubDetail" method="post" id="searchForm">
					<input type="hidden" value="1" id="nowPage" name="nowPage">
					<input type="hidden" name="clubCode" value="${clubBoardVO.clubCode }">
						<select id="sort" name="sort" <c:if test="${clubBoardVO.sort eq 'MEM_NAME'}">selected</c:if>>
							<option value="CB_BOARD_TITLE">제목</option>
							<option value="MEM_NAME">작성자</option>
						</select>
						<input type="text" name="keyword" maxlength="255" autocomplete="off">
						<button class="img-button" type="submit" name="click">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<div class="col-3">
				<table class="table table-hover">
					<c:forEach items="${memList }" var="mem" >
						<tr>
							<td>
								<div class="user-info__img"><img alt="" src="/resources/images/member/${mem.memImage }" >
									${mem.memName }
									${mem.bookComplitCnt }
								</div>
							</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
	</div>

<!-- 도서관 책 검색 -->
<div class="modal fade" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="/resources/js/club/club_detail.js"></script>
</body>
</html>