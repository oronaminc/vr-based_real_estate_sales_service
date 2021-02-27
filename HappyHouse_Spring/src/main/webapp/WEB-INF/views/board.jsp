<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Agency - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"	rel="stylesheet" type="text/css" />
<link	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"	rel="stylesheet" type="text/css" />
<link	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"	rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Myeongjo&display=swap&subset=korean" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css' rel='stylesheet' type='text/css'>
<link href='https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css' rel='stylesheet' type='text/css'>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root}/css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#newPostBtn").click(function() {
		console.log("${userinfo.userid}");
		if ("${userinfo.userid}" == ""){
			alert("글을 등록하려면 로그인을 하세요!");
			return;
		} else {
			location.href = "${root}/board/newpost";
		}
	});
	
	$("td").click(function() {
		console.log($(this).attr('id'));
		location.href = "${root}/board/detail?postid="+$(this).attr('id');
	})
	
	$("#searchBtn").click(function() {
		location.href = "${root}/board/search?isselling="+$("#isSellingType").val() 
				+"&ispetallowed="+$("#canPet").val()
				+"&housetype="+$("#houseType").val()
				+"&dealtype="+$("#dealType").val();
	})
	


});
</script>

<style>
 *{ font-family: 'NanumSquare', 'Sans-serif'; }
 
	img{
 		margin:auto;
 	}
 	
 #boardTitleBlock{
 	margin:20px 0
 }
 #boardTitle{
 	font-size : 30px;
 	font-weight : bold;
 }
 
 #boardSubTitle {
 	font-style:italic;
 }
 
 #btnBlock {
 	margin: 10px 0 10px 10px
 }
  .dealTypeTag {
    background-color: #6DD66D;
  }
  
  .houseTypeTag{
  	background-color: #41CDCD;
  }
  
  .petTag {
  	background-color: #FFDCE1;
  }
  
  .postTags > div {
  	border-radius : 1.0em;
  	padding : 2px 10px;
  	margin: 0 5px 0 0;
	float:left;
  }
  
  .usertag {
  	border-radius : 1.0em;
  	padding : 2px 10px;
  	margin: 0 5px 0 0;
	float:left;
	background-color : #FFC7AD
  }
  
  .postTitle {
  	font-size:25px;
  	font-weight: bold;
  	
  }
  
  .postLeftBlock{ 
  	width:200px; 
  	height:130px; 
  	float:left; 
  	margin:0 20px
  
  }
  
  .postRightBlock{
  	margin:10px
  }
  
  .postAddress{
  	margin:5px 0
  }
  
  #typeSelect > * {
  	float:left
  }
  
  #typeSelect > .form-group { 
  	width : 20%;
  	margin : 0 25px 20px 0
  }
  
  #searchBtn {
  	width : 10%
  }
  
</style>
</head>
<body id="page-top">
<jsp:include page="title.jsp"/>
	<section class="page-section bg-light" id="team">
		<div class="container">
			<div id="boardTitleBlock" class="text-center">
				<div id ="boardTitle">[ 우리끼리 당근매물 ]</div>
				<div id ="boardSubTitle">매물을 사고 팔 수 있는 게시판입니다.</div>
				<h4 id="favoriteArea">서울시 마포구</h4>
			</div>
			<hr>
			
		     <div id="typeSelect">
		     	<div class="form-group">
		                <select id="isSellingType" class="form-control">
		                    <option value='-1'>말머리</option>
		                    <option value='1'>팝니다</option>
		                    <option value='0'>삽니다</option>
		        		</select>
	            </div>
		     
	             <div class="form-group">
		                <select id="houseType" class="form-control">
		                    <option value="0">집 유형</option>
		                    <option value='1'>원룸</option>
		                    <option value='2'>투룸</option>
		                    <option value='3'>주택</option>
		                    <option value='4'>오피스텔</option>
		                    <option value='5'>아파트</option>
		        		</select>
	            </div>
	            
	            <div class="form-group">
		                <select id="dealType" class="form-control">
		                    <option value="0">거래 유형</option>
		                    <option value='1'>전월세</option>
		                    <option value='2'>매매</option>
		        		</select>
		        </div>
		        
		        <div class="form-group">
		                <select id="canPet" class="form-control">
		                    <option value="-1">반려동물 키우기</option>
		                    <option value='1'>반려동물 가능</option>
		                    <option value='0'>반려동물 불가</option>
		        		</select>
		        </div>
       	    <button class ="btn btn-danger" id="searchBtn">검색</button>
			<div style="clear:left"><br></div>    
			</div>
			<table class="table table-hover table-striped">
				<tbody id="tbody">
					<c:set var="idx" value="0"/>
					<c:if test="${posts.size() != 0}">
						<c:forEach var="vo" items="${posts}">
							<c:set var="idx" value="${idx+1}"/>
							<tr>
								<td id="${vo.postid}">
								<div class="postBlock" style="margin:auto">
									<div class="postLeftBlock" >
									<c:set var="imgname" value="${vo.housepicimg}" />
									<script>
									$(document).ready(function(){
										var filePathSplit = "${imgname}".split('\\'); 
										var filePathLength = filePathSplit.length;
										$housepicname = filePathSplit[filePathLength-1];
										//$("td#${vo.postid}" + " .housepic").attr("src","/assets/img/"+$housepicname);
										$("td#${vo.postid}" + " .housepic").attr("src","${root}/house/houseImage"+"${vo.postid}"+".jpg").attr("height", "120px").attr("width","200px");
										console.log($("td#${vo.postid}" + " .housepic").attr("src"));	
										console.log(">>>>>"+"${idx}");

									});
									</script>
										
										<img class="housepic" src="/HappyHouse_Spring/src/main/webapp/WEB-INF/views/assets/img/create.JPG" style="max-width: 100%; display: block;" alt="${root}/assets/img/room1.JPG">
										
									</div>
									
									<div class="postRightBlock">
										<div class="postTitle" >
											<c:choose>
												<c:when test="${vo.isselling}">
													[팝니다]
												</c:when>
												<c:otherwise>
													[삽니다]
												</c:otherwise>	
											</c:choose>
											${vo.title}
											

										</div>
										
										
										<div class="postAddress" style="font-size:20px;">
											<script>
												//let gugunCode = '${vo.gugun}';
												$(document).ready(function(){
													$.ajax({
														url:'${pageContext.request.contextPath}/board/addrName/'+'${vo.gugun}',
									             		post:'GET',
									             		contentType:'application/json;charset=utf-8',
									     				dataType:'json',
									     				success:function(data, status){
									     					console.log(data[0], data[1]);
									     					$("td#${vo.postid} .postAddress").append(data[0]+" "+data[1]+ " "+ "${vo.dong}");
									                     }	
													})
												});
											</script>
										</div>
										<div class="postTags">
											<div class="dealTypeTag" >
												<div>
													<c:choose>
														<c:when test="${vo.dealtype eq 1}">
														전/월세
														</c:when>
														<c:when test="${vo.dealtype eq 2}">
														매매
														</c:when>
													</c:choose>
												</div>
											</div>
											<div class="houseTypeTag" >
												<div>
													<c:choose>
														<c:when test="${vo.housetype eq 1}">
														원룸
														</c:when>
														<c:when test="${vo.housetype eq 2}">
														투룸
														</c:when>
														<c:when test="${vo.housetype eq 3}">
														주택
														</c:when>
														<c:when test="${vo.housetype eq 4}">
														오피스텔
														</c:when>
														<c:when test="${vo.housetype eq 5}">
														아파트
														</c:when>
														
													</c:choose>
												</div>
											</div>
											<div class="petTag" >										
												<div>
													<c:choose>
														<c:when test="${vo.ispetallowed}">
														반려동물 가능
														</c:when>
													</c:choose>
												</div>
											</div>			
											<span style="clear:left"></span>				
										</div>
										<div class="postUserTags">
											<div class="usertag1 usertag">
												<c:if test="${!empty vo.usertag1}">
													#${vo.usertag1} 
												</c:if>
											</div>
											<div class="usertag2 usertag">
													<c:if test="${!empty vo.usertag2}">
														#${vo.usertag2} 
													</c:if>
											</div>
											<div class="usertag3 usertag">
													<c:if test="${!empty vo.usertag3}">
														#${vo.usertag3} 
													</c:if>
											</div>
											
										</div>
									</div>
								</div>
								<script>
									if (${vo.ispetallowed}==false){
										console.log("we are here");
										$id_post = ${vo.postid};
										$("#"+$id_post+" .petTag").css("display","none");
									}
									
									if ("${vo.usertag1}" == ""){
										$id_post = ${vo.postid};
										$("#"+$id_post+" .usertag1").css("display","none");
									}
									if ("${vo.usertag2}" == ""){
										$id_post = ${vo.postid};
										$("#"+$id_post+" .usertag2").css("display","none");
									}
									if ("${vo.usertag3}" == ""){
										$id_post = ${vo.postid};
										$("#"+$id_post+" .usertag3").css("display","none");
									}

								</script>
							</td>

							</tr>
						</c:forEach>
					</c:if>
				
				</tbody>
			</table>
			<div id="btnBlock" align="center">
				<button id="newPostBtn" class="btn btn-primary">게시물 등록</button>
			</div>


<!-- 		<form id="searchform" class="searchUser" style="margin: auto; max-width: 50%">
			<select name='key' id='key'>
			  	<option value='all'>--선택하세요--</option>
			  	<option value='userid'>아이디</option>
			  	<option value='username'>이름</option>
		 	</select>
		 	<input type="text"  class="form-control" placeholder="회원 정보 검색" id="word"  name='word'>
		  	<button type="submit" class="btn btn-primary" id="searchbtn">검색</button>
		  	
		</form> -->
		
<%-- 		<table class="table table-hover">
		    <thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>해드폰</th>
					<th>주소</th>
				</tr>				
		    </thead>
		    <tbody id="tbody">
		    	<c:if test="${members.size() !=0 }">
					<c:forEach var="vo" items="${members}">
						<tr>
	   						<td><a href="${root}/info?userid=${vo.userid}">${vo.userid}</a></td>
	   						<td>${vo.username}</td>
	   						<td>${vo.email}</td>
	   						<td>${vo.phone}</td>
	   						<td>${vo.address}</td>
	   					</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	</section>
	<!-- The Modal -->
	<div class="modal" id="memberUpdate">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원 정보 수정</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					<form action="#">
						<div class="form-group">
							<label>아이디</label>
							<input type="text" value="test1">
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<input type="password" value="z1z1z1">
						</div>
						<div class="form-group">
							<label>이름</label>
							<input type="text" value="최다애">
						</div>
						<div class="form-group">
							<label>이메일</label>
							<input type="email" value="zzzzddz@naver.com">
						</div>
						<div class="form-group">
							<label>전화번호</label>
							<input type="tel" value="010-1234-5672">
						</div>
						<div class="form-group">
							<label>주소</label>
							<input type="text" value="서울특별시">
						</div>
						<button type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
					</form>
				</div>
			</div>
		</div>--%>
	</div> 
</section>

<jsp:include page="copyright.jsp"/>
</body>
</html>