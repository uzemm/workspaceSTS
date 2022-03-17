<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.loginSpan:hover{
	cursor: pointer;
}
</style>
</head>
<body>
<div class="row">
	<div class="col text-end">
		<span class="loginSpan" data-bs-target="#loginModal" data-bs-toggle="modal" >Login</span> 
		<span class="loginSpan" data-bs-target="#joinModal" data-bs-toggle="modal" >join</span> 
	</div>
</div>
<div class="row">
	<div class="col text-center">
		<h1>만음사</h1>
	</div>
</div>
<div class="row">
	<div class="col">
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Navbar</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">IT/인터넷</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">사회/과학</a>
						</li>
						<li class="nav-item"><a class="nav-link">경제/경영</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</div>



<!-- loginModal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
	 <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">로그인</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="mb-3">
        		<input class="form-control" type="text" placeholder="ID" >
        	</div>
        </div>
        <div class="row">
        	<div class="mb-3">
        		<input class="form-control" type="text" placeholder="PASSWORD" >
        	</div>
        </div>
        <div class="row">
        	<div class="col d-grid gap-2">
        		<button type="button" class="btn btn-primary">login</button>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- joinModal -->
<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
	 <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form class="row g-3" action="/member/join" method="post">
	        <div class="col-12">
	           <label for="inputEmail4" class="form-label">ID</label>
	           <input type="text" class="form-control" id="inputEmail4" name="memId">
	        </div>
	        <div class="col-12">
	           <label for="inputEmail4" class="form-label">PASSWORD</label>
	           <input type="password" class="form-control" id="inputEmail4" name="memPw" >
	        </div>
	        <div class="col-12">
	           <label for="inputEmail4" class="form-label">NAME</label>
	           <input type="text" class="form-control" id="inputEmail4" name="memName">
	        </div>
	        <div class="col-12">
	           <label for="inputEmail4" class="form-label">EMAIL</label>
	           <input type="email" class="form-control" id="inputEmail4" name="memEmail">
	        </div>
	        <div class="col-8">
	           <label for="addr" class="form-label">ADDRESS</label>
	           <input type="text" class="form-control" id="addr" name="memAddrs" onclick="sample4_execDaumPostcode();">
	        </div>
	        <div class="col-4 d-grid">
	           <label for="inputEmail5" class="form-label">&nbsp;</label>
	           <button type="button" class="btn btn-secondary" id="inputEmail5" onclick="sample4_execDaumPostcode();">우편번호</button>
	        </div>
	        <div class="col-12">
	           <input type="text" class="form-control" id="inputEmail4" name="memAddrs">
	        </div>
	        <div class="col-4">
	           <label for="inputState" class="form-label">TELL</label>
	           <select id="inputState" class="form-select" name="memTells">
	              <option value="010" selected>010</option>
	              <option value="011">011</option>
	           </select>
	        </div>
	        <div class="col-4">
	           <label for="inputCity" class="form-label">&nbsp;</label>
	           <input type="text" class="form-control" id="inputCity" name="memTells">
	        </div>
	        <div class="col-4">
	           <label for="inputCity" class="form-label">&nbsp;</label>
	           <input type="text" class="form-control" id="inputCity" name="memTells">
	        </div>
	        <div class="col-12 d-grid gap-2">
	           <button type="submit" class="btn btn-primary">JOIN</button>
	        </div>
      	</form>
      </div>
    </div>
  </div>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//joinModalEl 선택
var joinModalEl = document.getElementById('joinModal');
//joinModalEl이 닫힐 때 자동 시작하는 이벤트
joinModalEl.addEventListener('hidden.bs.modal', function (event) {
	//joinModal안에 있는 모든 input태그 선택
	var tags = document.querySelectorAll('#joinModal input');
	

	for(var i = 0; i<tags.length; i++){
		tags[i].value = '';
	}
});

//loginModalEl 선택
var joinModalEl = document.getElementById('loginModal');
//loginModalEl이 닫힐 때 자동 시작하는 이벤트
joinModalEl.addEventListener('hidden.bs.modal', function (event) {
	//loginModal안에 있는 모든 input태그 선택
	var tags = document.querySelectorAll('#loginModal input');

	for(var i = 0; i<tags.length; i++){
		tags[i].value = '';
	}
});

//우편번호 검색 api
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                document.getElementById("addr").value = roadAddr;
            }
        }).open();
    }
</script>
</body>
</html>