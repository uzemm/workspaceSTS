<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boardBtn:hover{
	background-color: #FAF1E6;
	color: black;
}
.cmtImg{
	width: 30px; 
	height: 30px; 
	border-radius: 70%;
}
.boardDiv{
	margin-bottom: 20px; 
	margin-top: 20px;
}
.boardTitle{
	font-size: 25px;  
	margin-bottom: 5px;
}
.boardImg{
	width: 40px; 
	height: 40px; 
	border-radius: 70%;
}
.nameDiv{
	font-size: 14px; 
	margin-bottom: 20px;
}
.nameSpan{
	font-size: 14px;
}
.dateSpan{
	font-size: 12px; 
	font-weight: normal;
}
.boardContent{
	margin-top: 100px; 
	margin-bottom: 100px;
}
.deletebtn{
	color:#dc3545;
}
.form-control{
	resize: none;
}
.regCmt{
	margin-top: 5px; 
	margin-bottom: 10px;
}
.cmtDiv{
	margin-top: 20px; 
	margin-bottom: 5px;
}
.byteSpan{
	margin-top: 10px; 
	font-size: 14px;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-4"></div>
	<div class="boardDiv col-4 text-left" >
		<div class="boardTitle">${clubBoard.cbBoardTitle } </div>
		<div class="row">
			<div class="col-1">
				<img class="boardImg" src="/resources/images/member/${clubBoard.memImage }">
			</div>
			<div class="nameDiv col-4 fw-bold">
				<span class="nameSpan">${clubBoard.memName } </span><br>
				<span class="dateSpan">${clubBoard.cbBoardDate } 조회 ${clubBoard.cbReadCnt }</span>
			</div>
		</div>
			<hr>
		<div class="boardContent"><pre>${clubBoard.cbBoardContent }</pre></div>
		<hr>
		<div class="col-12 d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="button" class="boardBtn btn justify-content-md-end" onclick="location.href='/club/clubDetail?clubCode=${clubBoard.clubCode}'">목록</button>
			<c:if test="${clubBoard.memId eq sessionScope.loginInfo.memId }">
			<button type="button" class="boardBtn btn justify-content-md-end" 
				onclick="location.href='/club/clubBoardUpdate?cbBoardNum=${clubBoard.cbBoardNum}&&clubCode=${clubBoard.clubCode }';">수정</button>
			<button type="button" class="deletebtn btn justify-content-md-end"  
				onclick="deleteBoard('${clubBoard.cbBoardNum}', '${clubBoard.clubCode }');">삭제</button>
			</c:if>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-4"></div>
	<div class="col-4">
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">${clubBoard.cbCmtCount }개의 댓글</label>
		  <form action="/club/clubBoardRegCmt" method="post" id="cbRegCmt">
		  	<input type="hidden" name="memName" value="${sessionScope.loginInfo.memName }">
		  	<input type="hidden" name="memId" value="${sessionScope.loginInfo.memId }">
			<input type="hidden" name="cbBoardNum" value="${clubBoard.cbBoardNum }">
			<input type="hidden" name="clubCode" value="${clubBoard.clubCode }">
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="cbCmtContent" onkeyup="byteCheck(this, '500');"></textarea>
			  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			  	<span class="byteSpan"><span id="byteInfo">0</span> /500bytes</span>
			  	<button type="submit" class="regCmt btn btn-success">댓글등록</button>
			  </div>
		  </form>
		</div>
	</div>
</div>

<div class="row" >
	<div class="col-4"></div>
	<div class="col-4">
			<div class="row">
			<c:forEach items="${cbCmtList }" var="cmt">
				<div class="col-1"><img class="cmtImg" src="/resources/images/member/${cmt.memImage }" ></div>
					<div class="col-4 fw-bold">
						<span class="nameSpan">${cmt.memName }</span><br>
						<span class="dateSpan">${cmt.cbCmtDate }</span>
					</div>
			<div class="cmtDiv col-12" >
				<form action="/club/clubCmtUpdate" method="post">
				<input type="hidden" name="memId" value="${sessionScope.loginInfo.memId }">
				${cmt.cbCmtContent }
				</form>
			</div>
			<c:if test="${sessionScope.loginInfo.memId eq cmt.memId}">
				<div class="col-12 d-grid gap-2 d-md-flex justify-content-md-end">
					<button type="button" class="btn btn-sm justify-content-md-end" 
						onclick="updateCmt(this, '${cmt.memId }', '${cmt.cbCmtNum }', '${cmt.clubCode }', '${cmt.cbBoardNum }', '${cmt.cbCmtContent}');" >수정</button>
					<button type="button" class="deletebtn btn btn-sm justify-content-md-end"
						onclick="deleteCmt('${cmt.memId }', '${cmt.cbCmtNum }');" >삭제</button>
				</div>
			</c:if>
			<div class="col-12">
				<hr>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript" src="/resources/js/club/club_board_detail.js?ver=9"></script>
</body>
</html>