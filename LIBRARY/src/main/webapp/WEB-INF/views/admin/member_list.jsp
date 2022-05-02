<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.subDiv{
	margin-left: 100px;
}
.dropdown-menu{
	width: 20rem;
}
</style>
</head>
<body>
<div class="row">
	<div class="col-2">
		<div class="subDiv">
			<a href="/club/clubList">북클럽조회</a><br>
			<c:if test="${sessionScope.loginInfo.clubAdmin eq 'Y' }">
				<a href="/clubAdmin/clubAdmin?clubCode=${sessionScope.loginInfo.clubCode }">북클럽관리</a><br>
			</c:if> 
			<a href="/admin/memberManage">회원관리</a><br>
			
		</div>
	</div>
	<div class="col-8">
		<div class="row">
			<div class="col-4">
				<form action="/admin/memberManage" method="post" id="searchForm">
					<input type="hidden" value="1" id="nowPage" name="nowPage">
					<div class="input-group mb-3">
					  <input type="text" class="form-control" name="keyword" placeholder="회원 ID" aria-label="Recipient's username" aria-describedby="button-addon2">
					  <button class="btn btn-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</form>
			</div>
			<div class="col-4 justify-content-end">
				<button type="button" class="send-modal btn btn-secondary" onclick="sendMsgList();">알림전송내역</button>
			</div>
		</div>
		<table class="table table-hover text-center" >
			<thead>
			    <tr>
			      <th scope="col">No</th>
			      <th scope="col">회원 ID</th>
			      <th scope="col">성명</th>
			      <th scope="col">생년월일</th>
			      <th scope="col">대여</th>
			      <th scope="col">알림</th>
			    </tr>
			</thead>
			<tbody>
		  		<c:choose>
		  			<c:when test="${not empty memList }">
					  	<c:forEach items="${memList }" var="mem" varStatus="status">
					    <tr>
					      <th scope="row">${mem.rowNum }</th>
					      <td>${mem.memId }</td>
					      <td>${mem.memName }</td>
					      <td>${mem.memBirth }</td>
					      <td>
							  <button type="button" class="btn btn-secondary" onclick="borrowInfo('${mem.memId}');">
							    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
						  		<path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
								</svg>
								</button>
						  </td>
					      <td><button type="button" class="open-msgModal btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#messageModal" data-id="${mem.memId }"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
						  		<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
								</svg></button>
						</td>
					    </tr>
					  </c:forEach>
		  			</c:when>
		  			<c:otherwise>
		  				<tr>
		  					<td colspan="5">
		  						검색 ID에 해당하는 멤버가 없습니다.
		  					</td>
		  				</tr>
		  			</c:otherwise>
		  		</c:choose>
		  </tbody>
		</table>
		<div class="row">
			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item <c:if test="${!memberVO.prev }">disabled</c:if>">
						<a class="page-link" href="/admin/memberManage?nowPage=${clubBoardVO.beginPage - 1 }"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="${memberVO.beginPage }" end="${memberVO.endPage }" var="pageIndex">
								<li class="page-item <c:if test="${memberVO.nowPage eq pageIndex }">active</c:if>"><a class="page-link" 
								href="javascript:search(${pageIndex });">${pageIndex }</a></li>
							</c:forEach>
						<li class="page-item <c:if test="${!memberVO.next }">disabled</c:if>"><a class="page-link" href="/club/clubDetail?nowPage=${memberVO.endPage + 1 }"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>


<!--알림 전송 Modal -->
<div class="messageModal modal fade" id="messageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/admin/sendMessage" method="post">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">회원 ID :</label>
            <input type="text" class="form-control" id="get-name" name="getId" readonly>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">내용 :</label>
            <textarea class="form-control" id="message-content" rows="7" name="msgContent" style="resize: none;" onkeyup="byteCheck(this, '500');"></textarea>
            <div style="text-align: right;"><span id="byteInfo">0</span> /500bytes</div>
          <div class="mb-3 justify-content-md-end">
	        <button type="button" class="btn btn-secondary justify-content-md-end" data-bs-dismiss="modal">닫기</button>
	        <button type="submit" class="btn btn-primary justify-content-md-end">메세지 전송</button>
          </div>
          </div>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>

<!-- 알림 전송 내역Modal -->
<div class="modal fade" id="msgModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">알림전송내역</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	     <div class="modal-body">
	     
		</div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#msgModalToggle2" data-bs-toggle="modal">Open second modal</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="msgModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">Modal 2</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      		<input type="hidden" id="get-msgCode" class="msgCode">
        	<table class="table">
        	<colgroup>
        		<col width="25%">
        		<col width="25%">
        		<col width="25%">
        		<col width="25%">
			    <tr>
			      <th scope="col">회원ID</th>
			      <td>${msg.getId }</td>
			      <th scope="col">전송날짜</th>
			      <td>2022/4/5</td>
			    </tr>
			    <tr>
			      <th scope="row">내용</th>
			      <td colspan="4" style="word-break: break-all">OttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoOttoMarkMarkMarkMarkMarkMark</td>
			    </tr>
			</table>
      	</div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#msgModalToggle" data-bs-toggle="modal">목록</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="/resources/js/admin/member_list.js"></script>
</body>
</html>