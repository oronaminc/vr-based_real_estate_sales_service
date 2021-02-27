<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<link
	href='https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css'
	rel='stylesheet' type='text/css'>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root}/css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<style>
* {
	font-family: 'NanumSquare', 'Sans-serif';
}

#joinTitle {
	font-size: 30px;
	font-weight: bold;
}

.form-group {
	width : 70%;
	margin:auto
}

</style>
</head>
<body id="page-top">
	<jsp:include page="title.jsp" />
	<div class="container">
		<section class="page-section bg-light" id="contact">
			<div class="text-center">
				<div id="joinTitle">회원 가입</div>
			</div>
			<form id="joinform" name="joinform" method="post" action=""
				novalidate="novalidate">
				<input type="hidden" name="join_hidden" id="join_hidden">

					<div class="form-group">
						<input class="form-control" id="userId" type="text" name="userid"
							placeholder="User ID" required="required" />
					</div>
					<div class="form-group">
						<input class="form-control" id="userPwd" type="password"
							name="userpwd" placeholder="영문 숫자 포함 6자리 이상 " required="required" />
						<div id="pwdmessage">
							<p id="pwdletter" class="invalid">
								A <b>lowercase</b> letter
							</p>
							<p id="pwdnumber" class="invalid">
								A <b>number</b>
							</p>
							<p id="pwdlength" class="invalid">
								Minimum <b>8 characters</b>
							</p>
						</div>
					</div>
					<div class="form-group">
						<input class="form-control" id="userName" type="text"
							name="username" placeholder="User Name" required="required" />
					</div>
					<div class="form-group">
						<input class="form-control" id="userEmail" type="email"
							name="email" placeholder="email" required="required" />
					</div>
					<div class="form-group">
						<input class="form-control" id="userPhone" type="tel" name="phone"
							placeholder="010-xxxx-xxxx" required="required" />
					</div>
					<div class="form-group">
						<input class="form-control" id="userAddr" type="text"
							name="address" placeholder="서울시 종로구" required="required" />
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary text-uppercase"
							id="join">회원가입</button>
						<button type="reset" class="btn btn-warning">초기화</button>
					</div>
			</form>
		</section>
	</div>
	<script>
	$('#join').on("click", function() {
		if($("#userId").val() == "") {
	        alert("아이디 필수 입력!");
	        return false;
	    } else if($("#userPwd").val() == "") {
	        alert("비밀번호 필수 입력!");
	        return false;
	    } else if($("#userName").val() == "") {
	        alert("이름 필수 입력!");
	        return false;
	    } else if($("#userEmail").val() == "") {
	        alert("이메일 필수 입력!");
	        return false;
	    } else if($("#userPhone").val() == "") {
	        alert("연락처 필수 입력!");
	        return false;
	    } else if($("#userAddr").val() == "") {
	        alert("주소 필수 입력!");
	        return false;
	    } else {
	        $("#joinform").attr("action", "${root}/join").submit();
	    }
	});
</script>
	<jsp:include page="copyright.jsp" />
</body>
</html>