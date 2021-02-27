<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>title</title>
<meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript">
function login() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("userpwd").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("loginform").action = "${root}/login";
		document.getElementById("loginform").submit();
	}
}
function forgotPwd() {
	if(document.getElementById("hintid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("hintemail").value == "") {
		alert("이메일 입력!!!");
		return;
	} else {
		document.getElementById("forgotform").action = "${root}/forgotpwd.member";
		document.getElementById("forgotform").submit();
		alert("$(getpwd)")
	}
}
</script>
</head>
<c:if test="${!empty msg}">
	<script type="text/javascript">
	alert('${msg}')
	</script>
	<c:remove var='msg'/>
</c:if>
<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="${root}">
				<img src="${root}/assets/img/navbar-logo.svg" style="width:50px;height:50px;" alt=""> VR 기반 PET HOUSE
			</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation"> Menu <i class="fas fa-bars ml-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item">
						<a class="nav-link js-scroll-trigger" href="${root}/board">게시판</a>
					</li>
					<c:choose>
						<c:when test="${empty userinfo}">
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" data-toggle="modal" data-target="#loginModal">로그인</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href='${root}/join'>회원가입</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href='${root}/logout'>로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="${root}/user?key">회원정보</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
<!-- The Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="loginform" method="post" action="post">
						<div class="form-group">
							<label for="loginid">아이디</label>
							<input type="text" class="form-control" id="userid" name="userid">
						</div>
						<div class="form-group">
							<label for="loginpwd">비밀번호</label>
							<input type="password" class="form-control" id="userpwd" name="userpwd">
						</div>
						<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:login();">로그인</button>
						<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#forgotModal" data-dismiss="modal">비밀번호 찾기</button>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="forgotModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">비밀번호 찾기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form  method="post" action="post" id="forgotform">
						<div class="form-group">
							<label for="hintid">아이디</label>
							<input type="text" class="form-control" id="hintid" name="hintid">
						</div>
						<div class="form-group">
							<label for="hintemail">이메일</label>
							<input type="email" class="form-control" id="hintemail" name="hintemail">
						</div>
						<div id="forgotpwd_msg"></div>
						<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:forgotPwd();">비밀번호 찾기</button>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</html>