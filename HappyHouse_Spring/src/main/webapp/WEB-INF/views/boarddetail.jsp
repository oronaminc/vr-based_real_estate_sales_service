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
#btnBlock{
	margin: 10px 10%
}
#postTable {
	margin: 0 auto;
	width: 80%;
}

#postBlock {
	border: 1px solid gray;
	overflow: hidden;
}

#postTitle {
	font-size: 30px;
	text-align: center;
	margin: 10px
}

.dealTypeTag {
	background-color: #6DD66D;
}

.houseTypeTag {
	background-color: #41CDCD;
}

.petTag {
	background-color: #FFDCE1;
}

.usertag {
	border-radius: 1.0em;
	padding: 2px 10px;
	margin: 0 5px 0 0;
	float: left;
	background-color: #FFC7AD
}

/*


  .postTags > div {

  	margin: 0 5px 0 0;
	float:left;
  }

*/
.postTags>* {
	border-radius: 1.0em;
	padding: 2px 10px;
	margin: 0 5px 0 0;
	float: left;
	/* display:inline-block; */
	left: 50%;
	position: relative;
}

.postTags {
	float: right;
	position: relative;
	left: -50%;
	/*   	text-align:center;
  	margin:0 auto */
}

#priceBlock {
	font-size: 20px;
	font-weight:bold;
	text-align : center;
}

#contentBlock {
	border: 1px solid lightgray;
	padding: 10px;
	width: 72%;
	margin: 0 auto;
}

#vrBlock {
	float: right;
	position: relative;
	left: -50%;
}

#vrBlock>div {
	/* /* 		width : 40%; 
		height:150px;  */
	float: left;
	/* display:inline-block; */
	left: 50%;
	position: relative;
	background-color: green;
	margin: 15px;
	width: 300px;
	height: 210px;
}
</style>
<script>
$(document).ready(function(){
	$("#updateBtn").click(function(){
		location.href = "${root}/board/detail/update?postid=${post.postid}";
	})
});
</script>
</head>
<body id="page-top">
	<jsp:include page="title.jsp" />
	<section class="page-section bg-light" id="team">
		<div class="container">
			<!-- <div>
				<h1>게시물 내용</h1>
			</div> -->
			<div class="container" align="center">
				<div class="text-center d-inline d-flex justify-content-center p-2">
					<!-- <h2 class="section-heading text-uppercase ">게시물 내용</h2> -->
				</div>
			</div>
			<div id="btnBlock" align="right">
				<button id="updateBtn" class="btn btn-primary">수정</button>
				<button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
			</div>
			<table class="table" id="postTable">
				<thead>
					<tr>
						<th>
							<div id="tagsBlock">
								<div id="postTitle">
									<c:choose>
										<c:when test="${post.isselling}">
										[팝니다]
									</c:when>
										<c:otherwise>
										[삽니다]
									</c:otherwise>
									</c:choose>
									${post.title}
								</div>
								<div class="postTags">
									<div class="dealTypeTag">
										<div>
											<c:choose>
												<c:when test="${post.dealtype eq 1}">
											전/월세
											</c:when>
												<c:when test="${post.dealtype eq 2}">
											매매
											</c:when>
											</c:choose>
										</div>
									</div>
									<div class="houseTypeTag">
										<div>
											<c:choose>
												<c:when test="${post.housetype eq 1}">
											원룸
											</c:when>
												<c:when test="${post.housetype eq 2}">
											투룸
											</c:when>
												<c:when test="${post.housetype eq 3}">
											주택
											</c:when>
												<c:when test="${post.housetype eq 4}">
											오피스텔
											</c:when>
												<c:when test="${post.housetype eq 5}">
											아파트
											</c:when>

											</c:choose>
										</div>
									</div>
									<div class="petTag">
										<div>
											<c:choose>
												<c:when test="${post.ispetallowed}">
											반려동물 가능
											</c:when>
											</c:choose>
										</div>
									</div>


									<div class="usertag1 usertag">
										<c:if test="${!empty post.usertag1}">
											#${post.usertag1} 
										</c:if>
									</div>
									<div class="usertag2 usertag">
										<c:if test="${!empty post.usertag2}">
											#${post.usertag2} 
										</c:if>
									</div>
									<div class="usertag3 usertag">
										<c:if test="${!empty post.usertag3}">
											#${post.usertag3} 
										</c:if>
									</div>



								</div>
								<div style="clear: both"></div>
							</div>


						</th>
					</tr>
				</thead>
				<tbody id="tbody">

					<tr>
						<td>

							<div id="priceBlock" >
								<div>
									<div id="price" class="leftFloat">
										<c:choose>
											<c:when test="${post.dealtype eq 1}">매물유형 및 가격 | 전/월세
										</c:when>
											<c:when test="${post.dealtype eq 2}">매물유형 및 가격 | 매매
										</c:when>
										</c:choose>${post.price}
									</div>
									<div style="clear: both"></div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>


							<div id="contentBlock">
								<div id="content">${post.content}</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="vrBlock" style="margin: 0 auto;">
								<div id="roomMap">
									<img src="${root}/house/house_resize1.png" usemap="#testVR">
									<map name="testVR" id="testVR">
									<area shape="rect" coords="128,106,220,206" id="first" href="#">
									<area shape="rect" coords="222,106,295,182" id="second" href="#">
								</div>
								
								<div id="vrShowRoom">
									<img src="${root}/house/readyImage.png" style="width:100%;height:100%"/>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<script>
				if (${post.ispetallowed}==false){
					console.log("we are here");
					
					$(".petTag").css("display","none");
				}
				
				if ("${post.usertag1}" == ""){
					$id_post = ${post.postid};
					$(" .usertag1").css("display","none");
				}
				if ("${post.usertag2}" == ""){
					$id_post = ${post.postid};
					$(" .usertag2").css("display","none");
				}
				if ("${post.usertag3}" == ""){
					$id_post = ${post.postid};
					$(".usertag3").css("display","none");
				}
				$(document).ready(function(){
					
			    	$("#first").click(function() {
			    		$("#vrShowRoom").empty();    		
			    		$("#vrShowRoom").append('<iframe src="https://www.google.com/maps/embed?pb=!4v1606286471990!6m8!1m7!1sCAoSLEFGMVFpcFBQV1hUV3V0R3FqZS02VzFMOE1NeVItRWp2V2dmeGhQUUNPd2g1!2m2!1d37.2613984!2d126.95976829999998!3f47!4f0!5f0.7820865974627469" width="300" height="210" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>')
			    	});
			    	$("#second").click(function() {
			    		$("#vrShowRoom").empty();    		
			    		$("#vrShowRoom").append('<iframe src="https://www.google.com/maps/embed?pb=!4v1606286491995!6m8!1m7!1sCAoSLEFGMVFpcE5sOHAtUGk4R2FZUEl4dURhWDlCNFRicmJKQ3hiZElSTnhLRV9Y!2m2!1d37.2613877!2d126.9599004!3f325!4f0!5f0.7820865974627469" width="300" height="210" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>')
			    	});
			    });
				$(document).ready(function(){
					if (!${post.isselling}){
						$("#vrBlock").css("display", "none");
					}
				});
			</script>

		</div>

	</section>
	<jsp:include page="copyright.jsp" />
</body>
</html>