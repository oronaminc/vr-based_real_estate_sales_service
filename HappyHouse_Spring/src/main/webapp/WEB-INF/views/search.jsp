<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>

<head>
    <meta charset="UTF-8">
    <title>BackEnd Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="img/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<script    src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<section class="page-section" id="services">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">실거래가 검색 및 결과</h2>
            <h3 class="section-subheading text-muted">아파트, 다세대, 주택의 매매와 전월세를 보여드립니다.</h3>
        </div>
        <div class="row text-center d-flex justify-content-center font-weight-bold p-3">
            <script>
            
                let colorArr = ['table-primary','table-success','table-danger'];
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
                    $("#dong").change(function() {
                    	$.ajax({
                    		url:'${pageContext.request.contextPath}/map/'+$("#sido").val()+'/'+$("#gugun").val()+'/'+$("#dong").val()+'/'+$("#type").val(),
                    		post:'GET',
                    		contentType:'application/json;charset=utf-8',
            				dataType:'json',
            				success:function(data, status){
                                $("#searchResult").empty();
                                $.each(data, function(index, vo) {
                                    let str = "<tr value="+vo.dong+"+"+vo.aptName+"+"+vo.jibun+" class='clickeTr'"+" no="+vo.no+" dong="+vo.dong+" aptName="+vo.aptName+" jibun="+vo.jibun+" code="+vo.code+ " rentMoney=" +vo.rentMoney+" dealAmount="+vo.dealAmount+">"
                                    +"<th scope='row'>"+vo.no+"</th>"
                                    +"<td>" + vo.aptName
                                    +"<button type='button'"+" no="+vo.no+" dong="+vo.dong+" aptName="+vo.aptName+" jibun="+vo.jibun+" code="+vo.code+ " rentMoney=" +vo.rentMoney+" dealAmount="+vo.dealAmount+ " class='btn btn-secondary btn-sm detail' data-toggle='modal' data-target='#exampleModal'>자세히</button>"
                                    +"</td>"
                                    +"</tr>"
                                    $("#searchResult").append(str);
                                });//each
                                //geocode(data);
                            }
                    	})
                    });//change
                });//ready

            </script>
            <div class="col-3">
                <form class="form-inline">
                    <label class="pr-2">타입</label>
                    <select class="form-control" id="type">
                        <option value="1">아파트 매매가</option>
                        <option value="2">주택 매매가</option>
                        <option value="3">아파트 전/월세</option>
                        <option value="4">주택 전/원세</option>
                    </select>
                </form>
            </div>
            <div class="col-3">
                <form class="form-inline">
                    <label class="pr-2">시도</label>
                    <select class="form-control" id="sido">
                        <option value="0">선택하세요</option>
                    </select>
                </form>
            </div>
            <div class="col-3">
                <form class="form-inline">
                    <label class="pr-2">구군</label>
                    <select class="form-control" id="gugun">
                        <option value="0">선택하세요</option>
                    </select>
                </form>
            </div>
            <div class="col-3">
                <form class="form-inline">
                    <label class="pr-2">읍면동</label>
                    <select class="form-control" id="dong">
                        <option value="0">선택하세요</option>
                    </select>
                </form>
            </div>
        </div>
        <div class="row text-center d-flex justify-content-center">
            <div class="col-4">
                <table class="table table-striped" id="table1">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>아파트이름</th>
                        </tr>
                    </thead>
                    <tbody id="searchResult">
                        <tr value="서울특별시+강남구+역삼동+테헤란로+212">
                            <th scope="row">1</th>
                            <td>멀티캠퍼스
                                <button type="button" class="btn btn-secondary btn-sm"
                                    data-toggle="modal" data-target="#exampleModal">자세히</button>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
            
            <div class="col-8">
                <div id="map1" style="width: 100%; height: 300px; margin: auto;"></div>

            </div>
        </div>
    </div>
</section>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
    role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">세부 거래 정보</h5>
                <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-striped">
                    <tbody>
                        <tr>
                            <th scope="col">번호</th>
                            <td id="detailNum">0</td>
                        </tr>
                        <tr>
                            <th scope="col">법정동</th>
                            <td id="detailAddr">SSAFY</td>
                        </tr>
                        <tr>
                            <th scope="col">아파트이름</th>
                            <td id="detailName">멀티캠퍼스</td>
                        </tr>
                        <tr>
                            <th scope="col">지번</th>
                            <td id="detailAddr2">235</td>
                        </tr>
                        <tr>
                            <th scope="col">지역코드</th>
                            <td id="detailCode">132450</td>
                        </tr>
                        <tr>
                        	<th scope="col">가격</th>
                        	<td id="detailPrice">500000</td>
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
<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNXC_mR7U_zy1v0r7xDTpnQK9Uxn4vIAw&callback=initMap"></script>
<script>
    

    var multi = {
        lat : 37.5012743,
        lng : 127.039585
    };
    var map;
    var markers = [];
    var infoWindow;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map1'), {
            center : multi,
            zoom : 15
        });

        map2 = new google.maps.Map(document.getElementById('map2'), {
            center : multi,
            zoom : 15
        });
        infoWindow = new google.maps.InfoWindow;

        const myposition = "assets/img/my_position.png";
        console.log(myposition);

        //멀티캠퍼스
        //const multimarker = new google.maps.Marker({coords: multi, content: '멀티캠퍼스', iconImage: myposition});
        var multimarker = {
            coords : multi,
            iconImage : myposition,
            content : '멀티캠퍼스(역삼)'
        };
        var multimarker2 = {
            coords : multi,
            iconImage : myposition,
            content : '멀티캠퍼스(역삼)'
        };
        addMarker(multimarker);
        addMarker2(multimarker2);
        //var marker2 = new google.maps.Marker({position:{lat: mutlti[0], lng: multi[1]}, map: map2}); 
        infoWindow.setPosition(multi);
        infoWindow.setContent('멀티캠퍼스.');
        infoWindow.open(map);
    }
    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ? 'Error: Geolocation 서비스 실패.' : 'Error: Geolocation을 지원하지 않는 브라우저.');
        infoWindow.open(map);
    }
    function addMarker2(props) {
        const marker = new google.maps.Marker({
            position : new google.maps.LatLng(parseFloat(props.coords.lat), parseFloat(props.coords.lng)),
            map : map2
        });
        map2.setCenter(marker.getPosition());
        map2.setZoom(15);

        if (props.iconImage) {
            marker.setIcon(props.iconImage);
        }

        if (props.content) {
            infoWindow = new google.maps.InfoWindow({
                content : props.content
            });

        }

        marker.addListener('click', function() {
            map2.setZoom(17);
            map2.setCenter(marker.getPosition());
            bounceMarker(marker);
        });
        markers.push(marker);
        setMapOnAll(map2);
    }

    function addMarker(props) {
        const marker = new google.maps.Marker({
            position : new google.maps.LatLng(parseFloat(props.coords.lat), parseFloat(props.coords.lng)),
            map : map
        });
        map.setCenter(marker.getPosition());
        map.setZoom(15);

        if (props.iconImage) {
            marker.setIcon(props.iconImage);
        }

        if (props.content) {
            infoWindow = new google.maps.InfoWindow({
                content : props.content
            });

        }

        marker.addListener('click', function() {
            map.setZoom(17);
            map.setCenter(marker.getPosition());
            bounceMarker(marker);
        });
        markers.push(marker);
        setMapOnAll(map);
    }

    function bounceMarker(marker) {
        if (marker.getAnimation() !== null) {
            marker.setAnimation(null);
        } else {
            marker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }

    function deleteMarkers() {
        clearMarkers();
        markers = [];
    }

    function clearMarkers() {
        setMapOnAll(null);
    }

    function setMapOnAll(map) {
        for (let i = 0; i < markers.length; i++) {
            markers[i].setMap(map);
        }
    }


    $('#table1').on("click", ".clickeTr", function() {
        var area = $(this).attr("value");
        console.log($(this).attr("no"));
        //console.log(area);
        $.get("https://maps.googleapis.com/maps/api/geocode/json", {
            key : 'AIzaSyDNXC_mR7U_zy1v0r7xDTpnQK9Uxn4vIAw',
            address : area
        }, function(data, status) {
            console.log(data);
            deleteMarkers();
            var officemarker = {
                coords : {
                    lat : data.results[0].geometry.location.lat,
                    lng : data.results[0].geometry.location.lng
                },
                iconImage : null,
                content : area
            };
            console.log(officemarker);
            addMarker(officemarker);
        }, "json");//get
    });

    $('#table1').on("click", ".detail", function() {
        var no = $(this).attr("no");
        $("#detailNum").text(no);
        var dong = $(this).attr("dong");
        $("#detailAddr ").text(dong);
        var aptName = $(this).attr("aptName");
        $("#detailName").text(aptName);
        var jibun = $(this).attr("jibun");
        $("#detailAddr2 ").text(jibun);
        var code = $(this).attr("code");
        $("#detailCode").text(code);
        var price = "";
        console.log("aptname"+$(this).attr("aptName"));
        console.log("rentmoney"+$(this).attr("rentMoney"));
        console.log("dealamount"+$(this).attr("dealAmount"));
        if($(this).attr("rentMoney") == "null"){
        	price = $(this).attr("dealAmount");
        }
        else{
        	price = $(this).attr("rentMoney");	
        }
        $("#detailPrice").text(price);

    });

    $('#table1 > tbody > tr').on("click", function() {
        var area = $(this).attr("value");
        //console.log(area);
        $.get("https://maps.googleapis.com/maps/api/geocode/json", {
            key : 'AIzaSyDNXC_mR7U_zy1v0r7xDTpnQK9Uxn4vIAw',
            address : area
        }, function(data, status) {
            console.log(data);
            deleteMarkers();
            var officemarker = {
                coords : {
                    lat : data.results[0].geometry.location.lat,
                    lng : data.results[0].geometry.location.lng
                },
                iconImage : null,
                content : area
            };
            console.log(officemarker);
            addMarker(officemarker);
        }, "json");//get
    });
</script>

