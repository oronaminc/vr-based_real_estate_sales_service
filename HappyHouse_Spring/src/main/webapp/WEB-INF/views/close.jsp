<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<section class="page-section bg-light" id="portfolio">
	<div class="container">
		<div class="text-center d-inline d-flex justify-content-center p-2">
			<h2 class="section-heading text-uppercase ">동네 업종 및 대기오염 정보</h2>
		</div>
		<div class="row text-center d-flex justify-content-center">
			<div class="col-4">
				<div class="btn-group btn-group-toggle p-3" data-toggle="buttons">
					<label class="btn btn-light active"> <input type="radio"
							name="options" id="option1" autocomplete="off" checked>
						동네 업종 정보
					</label> <label class="btn btn-light"> <input type="radio"
							name="options" id="option2" autocomplete="off"> 대기오염 정보
					</label>
				</div>
				<table class="table table-striped" id="table2">
					<tbody>
						<tr value="서울특별시+강남구+역삼동+테헤란로+212">
							<th scope="row">1</th>
							<td>현대뜨레비앙
								<button type="button" class="btn btn-secondary btn-sm"
									data-toggle="modal" data-target="#exampleModal">자세히</button>
							</td>
						</tr>

						<tr value="서울특별시 강남구 역삼동 테헤란로 334 LG 화재빌딩">
							<th scope="row">2</th>
							<td>효성쥬얼리시티
								<button type="button" class="btn btn-secondary btn-sm"
									data-toggle="modal" data-target="#exampleModal">자세히</button>
							</td>
						</tr>
						<tr value="대전광역시 유성구 덕명동 124">
							<th scope="row">3</th>
							<td>동성아파트
								<button type="button" class="btn btn-secondary btn-sm"
									data-toggle="modal" data-target="#exampleModal">자세히</button>
							</td>

						</tr>
						<tr value="대전광역시 유성구 봉명동 대학로 60 봉명가든 6층">
							<th scope="row">4</th>
							<td>CS 타워
								<button type="button" class="btn btn-secondary btn-sm"
									data-toggle="modal" data-target="#exampleModal">자세히</button>
							</td>
						</tr>

					</tbody>
				</table>

			</div>
			<div class="col-8">
				<div id="map2" style="width: 100%; height: 300px; margin: auto;"></div>
			</div>
		</div>
	</div>
</section>
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
<script>
	$('#table2 > tbody > tr').on("click", function() {
		var area = $(this).attr("value");
		console.log("??");
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
			addMarker2(officemarker);
		}, "json");//get
	});
</script>