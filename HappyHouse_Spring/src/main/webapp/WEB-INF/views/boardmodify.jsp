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
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${root}/css/styles.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<style>
	#formFirstBlock > * {
		float:left
	}
	
	#formAddressBlock > .form-group {
		float:left;
	}
</style>
     <script>

		/*$(document).ready(function(){
			console.log("here");
			let text = "${post.content}";
			text = text.replace(/<br\s*\/?>/img, "\n");
			console.log(text);
			
			$("#content").val(text);
		});*/

         $(document).ready(function(){
	         $("#updateBtn").click(function() {

	        	 if ($("#title").val() == ""){
	        		 alert("제목 필수 입력!");
	        		 return false;
	        	 } else if ($("#sido").val() == "0"){
	        		 alert("시/도 정보 필수!");
	        		 return false;
	        	 } else if ($("#gugun").val() == "0") {
	        		 alert("구/군 정보 필수!");
	        		 return false;
	        	 } else if ($("#isselling").val() == "0")  {
	        		 alert("말머리 선택 필수!"); 
	        		 return false;
	        	 }
	        	 else {
	        		 let text = $("#content").val().replace(/\n/g, "<br>");
	    			 $("#content").val(text);
	        		 $("#postform").attr("action","${root}/board/update");
	        	 }
	         })
         });
     </script>
     
     <style>
     	 #updateTitleBlock{
 	margin:20px 0 20px 0
 	}
	 #updateTitle{
	 	font-size : 30px;
	 	font-weight : bold;
	 }
	 
	 #wholePostBlock {
	 	width : 50%
	 }
 
	#formFirstBlock > * {
		float:left;
	}
	
	#formIssellingBlock{
		width:20%;
		margin:0 1% 0 0
	}
	#formTitleBlock{
		width:79%
	}
	
	#formSidoBlock, #formGugunBlock{
		margin:0 2% 0 0
	}
	
	#formAddressBlock > .form-group {
		float:left;
		width: 32%;
	}
	
	
	
	#formUserTagsBlock input {
		float:left;
		width : 25%;
		margin: 0 5px 
	}
	
	 *{ font-family: 'NanumSquare', 'Sans-serif'; }
     </style>
</head>
<body id="page-top">
<jsp:include page="title.jsp"/>
	<section class="page-section bg-light" id="team">
		<div class="container" id="wholePostBlock">
		
			<div id="updateTitleBlock" class="text-center">
				<div id ="updateTitle">매물 게시글 등록</div>
			</div>
			<form id="postform" name="postform" method="post" action="">
			<input type="hidden" name="userid" id="userid" value="${userinfo.userid}">
		  	<div class="container" align="center">
				<div align="center">	
					<div id="formFirstBlock">		
						<div class="form-group" id="formIssellingBlock">
							<select class="form-control" id="isselling" name="isselling">
								<option value="0">말머리</option>
								<option value="true">팝니다</option>
								<option value="false">삽니다</option>
							</select>
							<script>
								$(document).ready(function(){
			             			$('#isselling option[value="${post.isselling}"]').prop("selected", true);
								});
							</script>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="title" name="title" placeholder="제목" value="${post.title}">
						</div>
						
					</div>	
					

					<div id="formAddressBlock">
						<script>
							$(document).ready(function(){
								$.ajax({
									url:'${pageContext.request.contextPath}/board/addrName/'+'${post.gugun}',
				             		post:'GET',
				             		contentType:'application/json;charset=utf-8',
				     				dataType:'json',
				     				success:function(data, status){
				     					console.log(data[0], data[1]);
				     					$("#formAddressBlock").append(data[0]+" "+data[1]+ " "+ "${post.dong}");
				                     }	
								})
							});
				            
						</script>   
					</div>
					<div id="formOptionBlock">
	<!-- 					<form> -->
						<!-- <label for="optionDealtype">거래 유형</label> -->
						<div class = "form-group" id="optionDealtype">
							<label for="">거래 유형</label>
							<input type="radio" name="dealtype" id="deal1" value="1"/> 전월세
							<input type="radio" name="dealtype" id="deal2" value="2"/> 매매
						<!-- </form> -->
						
							<script>
								$(document).ready(function(){
									if ("${post.dealtype}" == "1"){
										$("#deal1").attr("checked", "checked");
									} else if ("${post.dealtype}" == "2"){
										$("#deal2").attr("checked", "checked");
									} 
								});
							</script>
						</div>
						
						<!-- <label for="optionDealtype">매물 유형</label> -->
						<div class = "form-group" id="optionHousetype">
							<label for="">매물 유형</label>
							<input type="radio" name="housetype" id="house1" value="1"/> 원룸
							<input type="radio" name="housetype" id="house2" value="2"/> 투룸
							<input type="radio" name="housetype" id="house3" value="3"/> 주택
							<input type="radio" name="housetype" id="house4" value="4"/> 오피스텔
							<input type="radio" name="housetype" id="house5" value="5"/> 아파트
							
							<script>

							</script>
							
						</div>
						
						<div class = "form-group" id="optionPet">
							<label for="">반려동물 키우기</label>
							
							<input type="radio" name="ispetallowed" id="petyes" value="true"/> 가능
							<input type="radio" name="ispetallowed" id="petno" value="false"/> 불가능
							<script>
								$(document).ready(function(){
									if ("${post.housetype}" == "1"){
										$("#house1").attr("checked", "checked");
									} else if ("${post.housetype}" == "2"){
										$("#house2").attr("checked", "checked");
									} else if ("${post.housetype}" == "3"){
										$("#house3").attr("checked", "checked");
									} else if ("${post.housetype}" == "4"){
										$("#house4").attr("checked", "checked");
									} else if ("${post.housetype}" == "5"){
										$("#house5").attr("checked", "checked");
									}
								});
								$(document).ready(function(){
									if (${post.ispetallowed}){
										$("#petyes").attr("checked", "checked");
									} else {
										$("#petno").attr("checked", "checked");
									}
								});
							</script>
						<!-- </form> -->
						</div>
						
						<div class="form-group" align="left">
							<label for="">가격</label>
							<input type="text" class="form-control" id="price" name="price" value="${post.price}"/>
						</div>
					</div>
					
					<div id="formContentBlock">
						<div class="form-group" align="left">
							  <textarea id="content" name="content" cols="100%" rows="8" placeholder="내용 입력" ></textarea>
						</div>
					</div>
					
					<div id="btnBlock" align="right">
						<button id="updateBtn" type="submit" class="btn btn-primary">수정</button>
						<button type="button" class="btn btn-secondary">취소</button>
					</div>
				</div>
			</div>
			</form>
		</div>
			

	</div> 

</section>
<jsp:include page="copyright.jsp"/>
</body>
</html>