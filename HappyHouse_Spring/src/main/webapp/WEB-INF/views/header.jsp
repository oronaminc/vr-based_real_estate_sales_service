<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="masthead">
	<c:set var="root" value="${pageContext.request.contextPath}" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#mapwrap{position:relative;overflow:hidden;top:5px;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {position:absolute;overflow:hidden;top:10px;left:10px;width:250px;height:300px;z-index:10;border:0px solid white;border-radius:10px;font-family:'Montserrat';font-size:17px;text-align:left;background-color:#fff;}
	
	.resultList{position:absolute; overflow:hidden; top:10px; right:30px; width:500px; height:700px; z-index:10;}
	/* .more {  display:block;  width: 55px;  height: 16px;  background-image:url('https://s.pstatic.net/static/www/img/2017/sp_nav_v170523.png');  background-position: 0 -78px;} */
	.more{display:flex;}
	.blind {  position: absolute;  overflow: hidden;  clip: rect(0 0 0 0);  margin: -1px;  width: 1px;  height: 1px;}
	.moreInfo:hover, .close:hover {  cursor:pointer;}
	/*.close {  display:block;  background-image:url('https://s.pstatic.net/static/www/img/2017/sp_nav_v170523.png');  width: 42px;  height: 16px;  background-position: -166px -78px;}*/
	.closeInfo{display:flex;}
	.board {  font-family:'Montserrat';  font-size:13px;  position:absolute;  top:40px;  width:500px;  height:700px;  background:#fff;  visibility:hidden;}
	.list {  float:left;}
	.list li {  list-style:none;  margin-top:5px;}
	.list li:hover {  text-decoration:underline;  cursor:pointer;}
	
	.my-custom-scrollbar {position: relative;height: 650px;overflow: auto;}
	.table-wrapper-scroll-y {display: block;}

</style>

<!--
	<iframe src="https://www.google.com/maps/embed?pb=!4v1606241812090!6m8!1m7!1sCAoSLEFGMVFpcE5sOHAtUGk4R2FZUEl4dURhWDlCNFRicmJKQ3hiZElSTnhLRV9Y!2m2!1d37.2613877!2d126.9599004!3f325!4f0!5f0.7820865974627469" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
-->

<div id="mapwrap"> 
	<div id="map" style="width:100%;height:800px;"></div>
	<div class="category">
		<div class="input-group mb-3 p-2">
			<input type="text" class="form-control" placeholder="검색할 단어" aria-label="Recipient's username" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary bg-light" type="button" id="searchAddrBtn">Button</button>
			</div>
		</div>
		<hr>
		<div class="col p-2">
			<div class="row-3 p-2 ml-4">
				<input class="form-check-input" id="parkMap" type="checkbox">
				<label class="form-check-label" for="parkMap">
					반려동물 출입 가능 공원
				</label>
			</div>
			
			<div class="row-3 p-2 ml-4">
			<input class="form-check-input" id="cafeMap" type="checkbox">
			<label class="form-check-label" for="cafeMap">
				반려동물 출입 가능 카페
			</label>
			</div>
			<!-- 
			<button type="checkbox" data-toggle="toggle" data-onstyle="primary" data-offstyle="secondary" id="cafeMap">애견 카페
			 -->
			<div class="row-3 p-2 ml-4">
			<input class="form-check-input" id="hotelMap" type="checkbox">
			<label class="form-check-label" for="hotelMap">
				위탁 관리 센터
			</label>
			</div>
			
			<div class="row-3 p-2 ml-4">
			<input class="form-check-input" id="hospitalMap" type="checkbox">
			<label class="form-check-label" for="hospitalMap">
				동물 병원
			</label>
			</div>
		</div>
		<hr>
		<div class="bg-primary" data-toggle="modal" data-target="#interestModal">
			<label id="sample5_address" class="ml-2 p-2 text-light">None</label>
		</div>
	</div>
	
	<div class="resultList">
		<div>
			<a class="btn btn-primary moreInfo text-light" role="button">세부 정보 표시 버튼</a>
		</div>
		<div class="board">
			<div class="row text-left p-3 ">
				<table class="table table-striped" id="detailTable">
					<thead>
						<tr>
							<th class="text-center font-weight-bold"><h5>반경 1KM 아파트 목록</h5> </th>
						<tr>
					</thead>
					<tbody id="serachResultDetail" class="table-wrapper-scroll-y my-custom-scrollbar">
						
					</tbody>
				</table>
			</div>
			<hr>
        </div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e6dbaa15131f48ffe6cfff2991f99d2&libraries=services,clusterer,drawing"></script>
<script>
	$(document).ready(function(){
		
		var aptIdx=1;
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		var KEY = '6a6359724173756e3130387454495865';

		var hospitalPositions = [];
		var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		    coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		    storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다
		var hospitalMarkers = [],
			parkMarkers=[],
			cafeMarkers=[],
			hotelMarkers=[],
			hospitalPnts=[],
			parkPnts=[],
			cafePnts=[],
			hotelPnts=[];
		var houseInfoMarkers=[];
		$('.moreInfo').click(function(){
			if($('.moreInfo').hasClass('moreInfo')){
		       $('.moreInfo').addClass('closeInfo').removeClass('moreInfo');
		       $('.board').css('visibility', 'visible');
		    }else if($('.closeInfo').hasClass('closeInfo')){
		       $('.closeInfo').addClass('moreInfo').removeClass('closeInfo');  
		       $('.board').css('visibility', 'hidden');
		    }
		});
		    /*
		 $.ajax({
	            type: "GET",
	            url : "http://openapi.seoul.go.kr:8088/6a6359724173756e3130387454495865/json/LOCALDATA_020301/1/1000",
	            success: function(response){
	            	var geocoder = new kakao.maps.services.Geocoder();
	            	$.each(response['LOCALDATA_020301']['row'], function(index, item){
	            		if(item['DTLSTATENM']=="정상" && item["RDNWHLADDR"]!=""){
	            			var coords = new kakao.maps.Coords(item['X'], item['Y']);
	            			//console.log(coords.toLatLng());
	            			hospitalPositions.push(new kakao.maps.LatLng(coords.toLatLng()['Ma']+2.3, coords.toLatLng()['La']+1.3));	            			
	            			//hospitalPositions.push(coords.toLatLng());
	            		}
	            	});
	            	createHospitalMarkers();
	            }
		 });
		    */
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.498004414546934, 127.02770621963765),
			//center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 5
		};
		var map = new kakao.maps.Map(container, options);
		// Map Type 바꾸기
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMRIGHT);
		
		// Zoom Controller
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 마커 클러스터를 생성합니다
		var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 3 // 클러스터 할 최소 지도 레벨 
	    });
		
		$.get("${pageContext.request.contextPath}/map/all", function(data) {
	        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	        houseInfoMarkers = data;
	        var imageSrc = 'icon/home.svg', // 마커이미지의 주소입니다    
	        imageSize = new kakao.maps.Size(32, 35), // 마커이미지의 크기입니다
	        imageOption = {offset: new kakao.maps.Point(10, 24)};
	        var markers = $(data).map(function(i, position) {
	            return new kakao.maps.Marker({
	                position : new kakao.maps.LatLng(position.lat, position.lng),
	           		image : new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	            });
	        });

	        // 클러스터러에 마커들을 추가합니다
	        clusterer.addMarkers(markers);
	    });
		
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 공원을 검색합니다
		for(var idx=1; idx<=45; idx++){
			ps.keywordSearch('서울 공원', placesSearchPark, {page:idx});
		}
		for(var idx=1; idx<=45; idx++){
			ps.keywordSearch('서울 애견 카페', placesSearchCafe, {page:idx});
		}
		for(var idx=1; idx<=2; idx++){
			ps.keywordSearch('서울 애견 호텔', placesSearchHotel, {page:idx});
		}
		for(var idx=1; idx<=35; idx++){
			ps.keywordSearch('서울 동물 병원', placesSearchHospital, {page:idx});
		}
		
		
		function placesSearchHospital (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var imageSrc = 'icon/hospital.svg', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(42, 45), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(16, 34)};

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		        var temp = "";
		        for (var i=0; i<data.length; i++) {
		            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		            markerPosition = new kakao.maps.LatLng(data[i].y, data[i].x); // 마커가 표시될 위치입니다
		            
		            var marker = new kakao.maps.Marker({
						position:markerPosition,
						image:markerImage
		            });
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="padding:5px;color:black;font-size:10px;text-align:center;">'+data[i].place_name+'</div>' // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		            hospitalMarkers.push(marker);
		            hospitalPnts.push(markerPosition);
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        //map.setBounds(bounds);
		    } 
		}

		function placesSearchPark (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var imageSrc = 'icon/park.svg', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(42, 45), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(16, 34)};
		        for (var i=0; i<data.length; i++) {
		        	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		            markerPosition = new kakao.maps.LatLng(data[i].y, data[i].x); // 마커가 표시될 위치입니다
		            var marker = new kakao.maps.Marker({
					    position: markerPosition,
					    image:markerImage
					});
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="padding:5px;color:black;font-size:10px;text-align:center;">'+data[i].place_name+'</div>' // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		            parkMarkers.push(marker);
		            parkPnts.push(markerPosition);
		        }
		    } 
		}
		
		function placesSearchHotel (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var imageSrc = 'icon/hotel.svg', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(42, 45), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(16, 34)};
		        for (var i=0; i<data.length; i++) {
		        	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		            markerPosition = new kakao.maps.LatLng(data[i].y, data[i].x); // 마커가 표시될 위치입니다
		            var marker = new kakao.maps.Marker({
					    position: markerPosition,
					    image:markerImage
					});
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="text-align:center;padding:5px;color:black;font-size:11px;">'+data[i].place_name+'</div>' // 인포윈도우에 표시할 내용
		            });
		            
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		            hotelMarkers.push(marker);
		            hotelPnts.push(markerPosition);
		        }
		    } 
		}
		
		function placesSearchCafe (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		    	var imageSrc = 'icon/cafe.svg', // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(42, 45), // 마커이미지의 크기입니다
		        imageOption = {offset: new kakao.maps.Point(16, 34)};
		        for (var i=0; i<data.length; i++) {
		        	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		            markerPosition = new kakao.maps.LatLng(data[i].y, data[i].x); // 마커가 표시될 위치입니다
		            var marker = new kakao.maps.Marker({
					    position: markerPosition,
					    image:markerImage
					});
		            var infowindow = new kakao.maps.InfoWindow({
		                content: '<div style="padding:5px;color:black;font-size:10px;text-align:center;">'+data[i].place_name+'</div>' // 인포윈도우에 표시할 내용
		            });
		            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		            cafeMarkers.push(marker);
		            cafePnts.push(markerPosition);
		        }
		    } 
		}
		
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
		    var markerImage = new kakao.maps.MarkerImage(src, size, options);
		    return markerImage;            
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
		    var marker = new kakao.maps.Marker({
		        position: position,
		        image: image
		    });
		    
		    return marker;  
		}   
		   

		// 병원 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {
		    for (var i = 0; i < carparkMarkers.length; i++) {  
		    	carparkMarkers[i].setMap(map);
		    }        
		}

		// 병원 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setHospitalMarkers(map) {
			console.log("count : "+hospitalMarkers.length);
		    for (var i = 0; i < hospitalMarkers.length; i++) {  
		        hospitalMarkers[i].setMap(map);
		    }        
		}
		
		// 공원 마커들의 지도 표시 여부를 설정하는 함수입니다.
		function setParkMarkers(map) {
			console.log("count : "+parkMarkers.length);
			for (var i = 0; i < parkMarkers.length; i++) {  
		        parkMarkers[i].setMap(map);
		    }        
		}
		
		// 호텔 마커들의 지도 표시 여부를 설정하는 함수입니다.
		function setHotelMarkers(map) {
			console.log("count : "+hotelMarkers.length);
			for (var i = 0; i < hotelMarkers.length; i++) {  
		        hotelMarkers[i].setMap(map);
		    }        
		}
		
		// 카페 마커들의 지도 표시 여부를 설정하는 함수입니다.
		function setCafeMarkers(map) {
			console.log("count : "+cafeMarkers.length);
			for (var i = 0; i < cafeMarkers.length; i++) {  
		        cafeMarkers[i].setMap(map);
		    }        
		}
		

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		kakao.maps.event.addListener(map, 'dragend', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
			var tempMarkers=[];
			// 지도의  레벨을 얻어옵니다
		    var level = map.getLevel();

		    // 지도의 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter(); 
			
		    for(var idx=0; idx<houseInfoMarkers.length; idx++){
		    	if(Math.abs(houseInfoMarkers[idx].lat-latlng.getLat())<0.005 && Math.abs(houseInfoMarkers[idx].lng-latlng.getLng())<0.005){
		    		tempMarkers.push(houseInfoMarkers[idx]);
		    	}
		    }
		    $("#serachResultDetail").empty();
		    for(var idx=0; idx<tempMarkers.length; idx++){
		    	var price = tempMarkers[idx].dealAmount.split('.')[0]+'억,'+tempMarkers[idx].dealAmount.split('.')[1]+'천';
		    	var area = Math.round(tempMarkers[idx].area*0.3025)+'평';
		    	var aptname = tempMarkers[idx].aptname;
		    	var date = tempMarkers[idx].dealYear+'년,'+ tempMarkers[idx].dealMonth+'월,'+ tempMarkers[idx].dealDay+'일';
		    	var lng = tempMarkers[idx].lng;
		    	var lat = tempMarkers[idx].lat;
		    	var str =	'<tr><td><div class="row"><div class="col-5">'
		    				+'<img src="apt/apt'+aptIdx+'.jpg" class="rounded" alt="apt" width="200" height="150"></div>'
		    				+'<div class="col-7"><div class="col">'
		    				+'<div class="row-3 font-weight-bold"><h3>[매매] '+price.split(',')[0]+" "+price.split(',')[1]+'</h3></div>'
				  			+'<div class="row-2"><h6>'+area+' / ' + tempMarkers[idx].dong+'</h6></div>'
				  			+'<div class="row-2"><h6>'+aptname+'</h6></div>'
				  			+'<div class="row-2 text-primary"><h7>거래일 : '+date.split(',')[0]+" "+date.split(',')[1]+" "+date.split(',')[2]+'</h7></div>'
				  			+'<div class="row-2"><button type="button" '
				  			+'price='+price+' '
				  			+'area='+area+' '
				  			+'aptname='+aptname+' '
				  			+'date='+date+' '
				  			+'lng='+lng+' '
				  			+'lat='+lat+' '
				  			+'class="btn btn-secondary btn-sm detail"  data-toggle="modal" data-target="#detailModal">매물 정보 상세 보기</button></div>'
				  			+'</div></div></div></td></tr>';
				  			
				$("#serachResultDetail").append(str);
				aptIdx++;
				aptIdx = (aptIdx%50)+1;
		    }

		});
		
		
		$('#parkMap').change(function () {
			if(this.checked){
				setParkMarkers(map);
			}else{
				setParkMarkers(null);	
			}
		});
		$('#cafeMap').change(function () {
			if(this.checked){
				setCafeMarkers(map);
			}else{
				setCafeMarkers(null);	
			}
		});
		$('#hotelMap').change(function () {
			if(this.checked){
				setHotelMarkers(map);
			}else{
				setHotelMarkers(null);	
			}
		});
		$('#hospitalMap').change(function () {
			if(this.checked){
				setHospitalMarkers(map);
			}else{
				setHospitalMarkers(null);	
			}
		});
		$('#detailTable').on("click", ".detail", function() {
			
			// 반려견 지수
			var step=1, hotelFlag=false, cafeFlag=false, parkFlag=false, hospitalFlag=false;
			
			// modal 관련
			var aptname = $(this).attr("aptname");
	        $("#detailNameModal").text(aptname);
	        var area = $(this).attr("area");
	        $("#detailAreaModal").text(area);
	        var price = $(this).attr("price").replaceAll(',', ' ');
	        $("#detailPriceModal").text(price);
	        var date = $(this).attr("date").replaceAll(',', ' ');
	        $("#detailDateModal").text(date);
	        var lat = $(this).attr('lat');
	        var lng = $(this).attr('lng');
	        
	        // 로드뷰 관련
	        var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
			var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
			var position = new kakao.maps.LatLng(lat, lng);
			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			roadviewClient.getNearestPanoId(position, 50, function(panoId) {
			    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
			});
			
			// hotelPnts
			for(var idx=0; idx<hotelPnts.length; idx++){
		    	if(Math.abs(hotelPnts[idx].Ma-lat)<0.005 && Math.abs(hotelPnts[idx].La-lng)<0.005){
		    		hotelFlag=true;
		    		$("#hotelStatusImage").empty();
		    		$("#hotelStatusImage").append('<img src="statusImage/hotel_on.png" class="img-rounded" alt="hotel" width="80px" height="80px">')
		    		step+=1;
		    		break;
		    	}
		    }
			if(!hotelFlag){
				$("#hotelStatusImage").empty();
	    		$("#hotelStatusImage").append('<img src="statusImage/hotel_off.png" class="img-rounded" alt="hotel" width="80px" height="80px">')
	    	}
			
			// parkPnts
			for(var idx=0; idx<parkPnts.length; idx++){
		    	if(Math.abs(parkPnts[idx].Ma-lat)<0.005 && Math.abs(parkPnts[idx].La-lng)<0.005){
		    		parkFlag=true;
		    		$("#parkStatusImage").empty();
		    		$("#parkStatusImage").append('<img src="statusImage/park_on.png" class="img-rounded" alt="park" width="80px" height="80px">')
		    		step+=1;
		    		break;
		    	}
		    }
			if(!parkFlag){
				$("#parkStatusImage").empty();
	    		$("#parkStatusImage").append('<img src="statusImage/park_off.png" class="img-rounded" alt="park" width="80px" height="80px">')
	    	}
			
			// hospitalPnts
			for(var idx=0; idx<hospitalPnts.length; idx++){
		    	if(Math.abs(hospitalPnts[idx].Ma-lat)<0.005 && Math.abs(hospitalPnts[idx].La-lng)<0.005){
		    		hospitalFlag=true;
		    		$("#hospitalStatusImage").empty();
		    		$("#hospitalStatusImage").append('<img src="statusImage/hospital_on.png" class="img-rounded" alt="hospital" width="80px" height="80px">')
		    		step+=1;
		    		break;
		    	}
		    }
			if(!hospitalFlag){
				$("#hospitalStatusImage").empty();
	    		$("#hospitalStatusImage").append('<img src="statusImage/hospital_off.png" class="img-rounded" alt="hospital" width="80px" height="80px">')
	    	}
			
			// cafePnts
			for(var idx=0; idx<cafePnts.length; idx++){
		    	if(Math.abs(cafePnts[idx].Ma-lat)<0.005 && Math.abs(cafePnts[idx].La-lng)<0.005){
		    		cafeFlag=true;
		    		$("#cafeStatusImage").empty();
		    		$("#cafeStatusImage").append('<img src="statusImage/cafe_on.png" class="img-rounded" alt="cafe" width="80px" height="80px">')
		    		step+=1;
		    		break;
		    	}
		    }
			if(!cafeFlag){
				$("#cafeStatusImage").empty();
	    		$("#cafeStatusImage").append('<img src="statusImage/cafe_off.png" class="img-rounded" alt="cafe" width="80px" height="80px">')
	    	}
			
			
			//detailStatusModal
	        $("#detailStatusModal").empty();
			for(var temp=0; temp<step; temp++){
				$("#detailStatusModal").append('<img src="statusImage/star.png" class="img-rounded" alt="star" width="30px" height="30px">');
			}
			
			
			
			
	    });
		
		function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
		}
		
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        $("#sample5_address").text(result[1].address_name);
		        $("#concernEnroll").text(result[1].address_name);
		        $("#favoriteArea").text(result[1].address_name);
		        
		    }    
		}
		
		$('#searchAddrBtn').on("click", function () {
			var geocoder = new daum.maps.services.Geocoder();
			console.log("클릭되었어요!")
			new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수

	                // 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById("sample5_address").text = addr;
	                $("#sample5_address").text(addr);
	                $("#concernEnroll").text(addr);
	                $("#favoriteArea").text(addr);
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        container.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        //marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
		});
		
		
	});
	

</script>
</header>
<!-- Modal -->
<div class="modal fade" id="detailModal" tabindex="-1"  role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailModalLabel">세부 거래 정보</h5>
                <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <tbody>
                    	<tr>
                        	<div id="roadview" style="width:100%;height:300px;"></div>
                        </tr>
                        <tr>
                        	<div class="row p-2">
                        		<div id="cafeStatusImage" class="col-3 p-2">
                        			<img src="statusImage/cafe_off.png" class="img-rounded" alt="cafe" width="80px" height="80px"> 
                        		</div>
                        		<div id="hospitalStatusImage" class="col-3 p-2">
                        			<img src="statusImage/hospital_off.png" class="img-rounded" alt="hospital" width="80px" height="80px">
                        		</div>
                        		<div id="hotelStatusImage" class="col-3 p-2">
                        			<img src="statusImage/hotel_off.png" class="img-rounded" alt="hotel" width="80px" height="80px">
                        		</div>
                        		<div id="parkStatusImage" class="col-3 p-2">
                        			<img src="statusImage/park_off.png" class="img-rounded" alt="park" width="80px" height="80px">
                        		</div>
                        	</div>
                        </tr>
                        <tr>
                            <th scope="col">아파트이름</th>
                            <td id="detailNameModal">멀티캠퍼스</td>
                        </tr>
                        <tr>
                            <th scope="col">평수</th>
                            <td id="detailAreaModal">11평</td>
                        </tr>
                        <tr>
                        	<th scope="col">가격</th>
                        	<td id="detailPriceModal">3억 5천</td>
                        </tr>
                        <tr>
                            <th scope="col">거래일</th>
                            <td id="detailDateModal">2019년 7월 18일</td>
                        </tr>
                        <tr>
                        	<th scope="col">반려동물 지수</th>
                        	<td id="detailStatusModal">
                        		<img src="statusImage/star.png" class="img-rounded" alt="star" width="30px" height="30px">
                        	</td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary"
                    data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Concern Modal -->
<div class="modal fade" id="interestModal" tabindex="-1" role="dialog" aria-labelledby="interestModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="interestModalLabel">관심 지역 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h3 id="concernEnroll"></h3>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"	data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
			</div>
		</div>
	</div>
</div>

<!-- Concern Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">관심 지역 등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-4">관심지역 설정</div>
					<div class="col-8">
						<select class="custom-select p-2">
							<option selected>도/광역시</option>
							<option value="1">서울</option>
							<option value="2">광주</option>
							<option value="3">대구</option>
						</select>
						<select class="custom-select p-2">
							<option selected>시/군/구</option>
							<option value="1">역삼</option>
							<option value="2">종로</option>
							<option value="3">홍대</option>
						</select>
						<select class="custom-select p-2">
							<option selected>동</option>
							<option value="1">관악</option>
							<option value="2">명륜</option>
							<option value="3">율전</option>
						</select>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>