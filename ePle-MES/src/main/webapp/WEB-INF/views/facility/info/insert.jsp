<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 추가</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 추가</h1>
			</div>
			<div class="tab">
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#production" role="tab" aria-selected="true">생산</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#non-production" role="tab" aria-selected="false">비생산</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#etc" role="tab" aria-selected="false">기타</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade active show" id="production" role="tabpanel">
						<form method="post" id="pro-form" onsubmit="return formCheck('#pro-form');"  enctype="multipart/form-data">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<input type="hidden" name="category" value="production">
									<!-- examples -->
									<div class="form-group">
										<label>모델명</label> <input class="form-control" type="text" name="model" required>
									</div>
									<div class="form-group">
										<label>이름</label> <input class="form-control" type="text" name="name"  required>
									</div>
									<div class="form-group">
										<label>구매 일자</label> <input class="form-control" type="date" name="purchase_date"  required>
									</div>
									<div class="form-group">
										<label>구매 금액</label> <input class="form-control" type="number" name="inprice"  required>
									</div>
									<div class="form-group">
										<label>위치</label> <input class="form-control" type="text" name="location"  required>
									</div>
									<div class="form-group">
										<label>시간당 생산량</label> <input class="form-control" type="number" name="uph"  required>
									</div>
									<div class="form-group">
										<label>라인 정보</label> <input class="form-control" type="text" name="line_code"  required>
									</div>
									<div class="form-group">
										<label>이미지</label> <input type="file" name="image" class="form-control-file form-control height-auto">
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
					<div class="tab-pane fade" id="non-production" role="tabpanel">
						<form method="post" id="nonpro-form" onsubmit="return formCheck('#nonpro-form');"  enctype="multipart/form-data">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<input type="hidden" name="category" value="non-production">
									<!-- examples -->
									<div class="form-group">
										<label>모델명</label> <input class="form-control" type="text" name="model"  required>
									</div>
									<div class="form-group">
										<label>이름</label> <input class="form-control" type="text" name="name"  required>
									</div>
									<div class="form-group">
										<label>구매 일자</label> <input class="form-control" type="date" name="purchase_date"  required>
									</div>
									<div class="form-group">
										<label>구매 금액</label> <input class="form-control" type="number" name="inprice"  required>
									</div>
									<div class="form-group">
										<label>위치</label> <input class="form-control" type="text" name="location"  required>
									</div>
									<div class="form-group">
										<label>라인 정보</label> <input class="form-control" type="text" name="line_code"  required>
									</div>
									<div class="form-group">
										<label>이미지</label> <input type="file" name="image" class="form-control-file form-control height-auto"  required>
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
					<div class="tab-pane fade" id="etc" role="tabpanel">
						<form method="post" id="etc-form" onsubmit="return formCheck('#etc-form');" enctype="multipart/form-data">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<input type="hidden" name="category" value="etc">
									<!-- examples -->
									<div class="form-group">
										<label>모델명</label> <input class="form-control" type="text" name="model"  required>
									</div>
									<div class="form-group">
										<label>이름</label> <input class="form-control" type="text" name="name"  required>
									</div>
									<div class="form-group">
										<label>구매 일자</label> <input class="form-control" type="date" name="purchase_date"  required>
									</div>
									<div class="form-group">
										<label>구매 금액</label> <input class="form-control" type="number" name="inprice"  required>
									</div>
									<div class="form-group">
										<label>위치</label> <input class="form-control" type="text" name="location"  required>
									</div>
									<div class="form-group">
										<label>라인 정보</label> <input class="form-control" type="text" name="line_code"  required>
									</div>
									<div class="form-group">
										<label>이미지</label> <input type="file" name="image" class="form-control-file form-control height-auto">
									</div>
									<!-- examples end -->
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
					</div>
				</div>
			</div>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
	
</body>
</html>