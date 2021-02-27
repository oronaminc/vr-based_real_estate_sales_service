<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
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