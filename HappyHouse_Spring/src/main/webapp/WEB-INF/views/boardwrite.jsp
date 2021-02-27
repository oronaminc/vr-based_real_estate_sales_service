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
<style>
	label{
		font-weight:bold;
		margin:1px 5px
	}
	 #postTitleBlock{
 	margin:20px 0 20px 0
 }
	 #postTitle{
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
     <script>
     
         // let colorArr = ['table-primary','table-success','table-danger'];
         $(document).ready(function(){
         	$.ajax({
         		url:'${pageContext.request.contextPath}/map',
         		post:'GET',
         		contentType:'application/json;charset=utf-8',
 				dataType:'json',
 				success:function(data, status){
                     $.each(data, function(index, vo) {
                         $("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
                     });//each
                 }
         	})
         });//ready
         $(document).ready(function(){
             $("#sido").change(function() {
             	$.ajax({
             		url:'${pageContext.request.contextPath}/map/'+$("#sido").val(),
             		post:'GET',
             		contentType:'application/json;charset=utf-8',
     				dataType:'json',
     				success:function(data, status){
                         $("#gugun").empty();
                         $("#gugun").append('<option value="0">선택</option>');
                         $.each(data, function(index, vo) {
                             $("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
                         });//each
                     }
             	})
             });//change
             $("#gugun").change(function() {
             	$.ajax({
             		url:'${pageContext.request.contextPath}/map/'+$("#sido").val()+'/'+$("#gugun").val(),
             		post:'GET',
             		contentType:'application/json;charset=utf-8',
     				dataType:'json',
     				success:function(data, status){
                         $("#dong").empty();
                         $("#dong").append('<option value="0">선택</option>');
                         $.each(data, function(index, vo) {
                             $("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
                         });//each
                     }
             	})
             });//change
         });//ready
         $(document).ready(function(){
	         $("#submitBtn").click(function() {
	        	 
	        	 /*
	        	     $t = $(this).val().replace(/<br\s*\/?>/img,"x");
    $(this).html($t)
	        	 */
	        	 console.log($("#housepicimg").val());

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
	    			 console.log($("#content").val());
	        		 $("#postform").attr("action","${root}/board/newpost");
	        	 }
	         })
         });
     </script>
</head>
<body id="page-top">
<jsp:include page="title.jsp"/>
	<section class="page-section bg-light" id="team">
		<div class="container" id="wholePostBlock">
		
			<div id="postTitleBlock" class="text-center">
				<div id ="postTitle">매물 게시글 등록</div>
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
						</div>
						<div class="form-group" id="formTitleBlock">
							<input type="text" class="form-control" id="title" name="title" placeholder="제목">
						</div>
						<div style="clear:left"><br></div>
					</div>	
					

					<div id="formAddressBlock">
						<div class="form-group" id="formSidoBlock">
				                <select id="sido" name="sido" class="form-control">
				                    <option value="0">시/도</option>
				                </select>
			            </div>
			            <div class="form-group" id="formSidoBlock">
				                <select id="gugun" name="gugun" class="form-control">
				                    <option value="0">구/군</option>
				                </select>
			            </div>
			            <div class="form-group" id="formDongBlock">
				                <select id="dong" name="dong" class="form-control">
				                    <option value="0">읍/면/동</option>
				                </select>
			            </div>    
			            <div style="clear:left"><br></div>
			            
					</div>
					<div id="formOptionBlock">
	<!-- 					<form> -->
						<!-- <label for="optionDealtype">거래 유형</label> -->
						<div class = "form-group" id="optionDealtype">
							<label for="">
								거래 유형 및 가격 | 
							</label>
							<input type="radio" name="dealtype" checked="checked" value="1"/> 전월세
							<input type="radio" name="dealtype" value="2"/> 매매
							
							<input type="text" class="form-control" id="price" name="price" placeholder="가격 (원하는 형식으로 자유롭게 작성  ex. 1000/50 , 20억 )" style="width:70%"/>
						<!-- </form> -->
						</div>
				


						
						<!-- <label for="optionDealtype">매물 유형</label> -->
						<div class = "form-group" id="optionHousetype" style="float:left">
							<label for="">매물 유형 | &nbsp;</label>
							<input type="radio" name="housetype" checked="checked" value="1"/> 원룸
							<input type="radio" name="housetype" value="2"/> 투룸
							<input type="radio" name="housetype" value="3"/> 주택
							<input type="radio" name="housetype" value="4"/> 오피스텔
							<input type="radio" name="housetype" value="5"/> 아파트
						</div>
						<span style="width:5%; float:left" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<div class = "form-group" id="optionPet" style="float:left">
							<label for="">반려동물 키우기  |  &nbsp;&nbsp;</label>
							<input type="radio" name="ispetallowed" checked="checked" value="true"/> 가능
							<input type="radio" name="ispetallowed" value="false"/> 불가능
						<!-- </form> -->
						</div>
						

					</div>
					
					<div id="formContentBlock">
						<div class="form-group" align="left">
							  <textarea id="content" name="content" cols="82%" rows="8" placeholder="내용 입력"></textarea>
						</div>
					</div>
					
					<div id="formUserTagsBlock">
						<div class="form-group" align="left">
						<label for="" style="float:left">사용자 자율 태그 | </label>
							<div style="overflow:default">
								<input type="text" class="form-control" id="usertag1" name="usertag1" placeholder="첫번째 태그"/>
								<input type="text" class="form-control" id="usertag2" name="usertag2" placeholder="두번째 태그"/>
								<input type="text" class="form-control" id="usertag3" name="usertag3" placeholder="세번째 태그"/>
								<div style="clear:left"><br></div>
							</div>
						</div>
					</div>
					
					<div id="formFileBlock">
						<div class="form-group" align="left">
							<label for='housepicimg'> 매물 사진 올리기 </label>
							  <input type="file" name="housepicimg" id="housepicimg" accept="image/*"><br>
							<label for='housemapimg'> 방 구조도 업로드 </label>  
							  <input type="file" name="housemapimg" id="housemapimg" accept="image/*">
<!-- 							<label for='housemapimg'>  </label>  
							  <input type="file" name="housemapimg" id="housemapimg" accept="image/*"> -->
						</div>
						<script>
							console.log($("#housepicimg").val());
						</script>
					</div>
					
					<div id="btnBlock" align="center">
						<button id="submitBtn" type="submit" class="btn btn-primary">등록</button>
						<button type="button" class="btn btn-secondary">취소</button>
					</div>
				</div>
			</div>
			</form>
		</div>
			



</section>
<jsp:include page="copyright.jsp"/>
</body>
</html>