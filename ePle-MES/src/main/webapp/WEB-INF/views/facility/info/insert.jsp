<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>설비 등록</title>
</head>
<body>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">설비 등록</h1>
			</div>
			<div class="tab">
				<label><b>카테고리</b></label>
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#production" role="tab" aria-selected="true">생산</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#non-production" role="tab" aria-selected="false">비생산</a></li>
					<li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#etc" role="tab" aria-selected="false">기타</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane fade active show" id="production" role="tabpanel">
						<div class="pd-20">
							<form method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label><b>설비 종류</b></label> <select class="selectpicker form-control" name="mapd_code" data-size="5" data-style="btn-outline-primary">
												<option selected disabled hidden>선택</option>
												<optgroup id="production" label="생산용 설비">
													<c:forEach var="i" items="${FACPRO}">
														<option value="${i.code}" data-subtext="${i.total}개">${i.name}</option>
													</c:forEach>
												</optgroup>
											</select>
										</div>
										<div class="form-group row">
											<label class="col-sm-12 col-md-2 col-form-label"><b>모델</b></label>
											<div class="col-sm-12 col-md-10">
												<input class="form-control" name="model" type="text" required autocomplete="false">
											</div>
										</div>
										<div class="form-group">
											<label><b>라인</b></label> <select class="custom-select2 form-control" name="line_code" style="width: 100%; height: 38px">
												<option value="Null" selected disabled hidden>선택</option>
												<c:forEach var="i" items="${line}">
													<option value="${i.code}">${i.name}(${i.place})</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group row">
											<label class="col-sm-12 col-md-2 col-form-label"><b>uph</b></label>
											<div class="col-sm-12 col-md-10">
												<input class="form-control" name="uph" value="1" type="number" min="0" max="1000" required>
											</div>
										</div>
									</div>
								</div>
								<br>
								<!-- 버튼 -->
								<div class="row">
									<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
										<button type="button" class="btn btn-secondary" onclick="closePopup();">
											<b>취소</b>
										</button>
										<button type="submit" class="btn btn-success">
											<b>입력</b>
										</button>
									</div>
								</div>
								<!-- 버튼 -->
							</form>
							<!-- 폼 -->
						</div>
					</div>

					<div class="tab-pane fade" id="non-production" role="tabpanel">
						<div class="pd-20">
							<form method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label><b>설비 종류</b></label> <select name="mapd_code" class="selectpicker form-control" data-size="5" data-style="btn-outline-primary">
												<option selected disabled hidden>선택</option>
												<optgroup id="production" label="생산용 설비">
													<c:forEach var="i" items="${FACNPR}">
														<option value="${i.code}" data-subtext="${i.total}개">${i.name}</option>
													</c:forEach>
												</optgroup>
											</select>
										</div>
										<div class="form-group row">
											<label class="col-sm-12 col-md-2 col-form-label"><b>모델</b></label>
											<div class="col-sm-12 col-md-10">
												<input class="form-control" name="model" type="text" required autocomplete="false">
											</div>
										</div>
										<div class="form-group">
											<label><b>라인</b></label> <select class="custom-select2 form-control" name="line_code" style="width: 100%; height: 38px">
												<option value="" selected disabled hidden>선택</option>
												<c:forEach var="i" items="${line}">
													<option value="${i.code}">${i.name}(${i.place})</option>
												</c:forEach>
											</select>
										</div>
										<input type="hidden" name="uph" value="0">
									</div>
								</div>
								<br>
								<!-- 버튼 -->
								<div class="row">
									<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
										<button type="button" class="btn btn-secondary" onclick="closePopup();">
											<b>취소</b>
										</button>
										<button type="submit" class="btn btn-success">
											<b>입력</b>
										</button>
									</div>
								</div>
								<!-- 버튼 -->
							</form>
							<!-- 폼 -->
						</div>
					</div>

					<div class="tab-pane fade" id="etc" role="tabpanel">
						<div class="pd-20">
							<form method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label><b>설비 종류</b></label> <select name="mapd_code" class="selectpicker form-control" data-size="5" data-style="btn-outline-primary">
												<option selected disabled hidden>선택</option>
												<optgroup id="production" label="생산용 설비">
													<c:forEach var="i" items="${FACETC}">
														<option value="${i.code}" data-subtext="${i.total}개">${i.name}</option>
													</c:forEach>
												</optgroup>
											</select>
										</div>
										<div class="form-group row">
											<label class="col-sm-12 col-md-2 col-form-label"><b>모델</b></label>
											<div class="col-sm-12 col-md-10">
												<input class="form-control" name="model" type="text" required autocomplete="false">
											</div>
										</div>
										<div class="form-group">
											<label><b>라인</b></label> <select class="custom-select2 form-control" name="line_code" style="width: 100%; height: 38px">
												<option value="" selected disabled hidden>선택</option>
												<c:forEach var="i" items="${line}">
													<option value="${i.code}">${i.name}(${i.place})</option>
												</c:forEach>
											</select>
										</div>
										<input type="hidden" name="uph" value="0">
									</div>
								</div>
								<br>
								<!-- 버튼 -->
								<div class="row">
									<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
										<button type="button" class="btn btn-secondary" onclick="closePopup();">
											<b>취소</b>
										</button>
										<button type="submit" class="btn btn-success">
											<b>입력</b>
										</button>
									</div>
								</div>
								<!-- 버튼 -->
							</form>
							<!-- 폼 -->
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>