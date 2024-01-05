<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 결과</title>
</head>
<body>
	<!-- 직원의 경우 사후보전만 실시 -->

	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">보전 결과</h1>
			</div>
			<div class="pd-20">
				<!-- 폼 -->
				<form method="post">

					<!-- 카테고리 -->
					<!-- 예방보전/긴급보전의 경우 예약 시간 표시 -->
					<div class="row">
						<div class="col-sm-12 mb-3">
							<div class="form-group">
								<label><b>카테고리</b></label> <select class="custom-select2 form-control" name="code" style="width: 100%; height: 38px">
									<!-- 공통 코드로 받아오기 -->
									<c:choose>
										<c:when test="${role eq 'emp'}">
											<option value="BM">사후 보전</option>
										</c:when>
										<c:when test="${role eq 'manager'}">
											<option value="PM">예약 보전</option>
											<option value="CM">개량 보전</option>
											<option value="BM">사후 보전</option>
										</c:when>
									</c:choose>
								</select>
							</div>
						</div>
					</div>

					<!-- 입력 구간 -->
					<div class="row">
						<div class="col-sm-12 mb-3">
							<!-- examples -->
							<div class="form-group">
								<label>사유</label> <input class="form-control" name="mt_subject" type="text" placeholder="입력">
							</div>
							<input type="hidden" name="group_id" value="MT">
							<div class="col-md-6 col-sm-12">
								<label class="weight-600">원인</label>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio1" name="code_id" value="001" class="custom-control-input" checked> <label class="custom-control-label" for="customRadio1">초기 고장</label>
								</div>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio2" name="code_id" value="002" class="custom-control-input"> <label class="custom-control-label" for="customRadio2">우발 고장</label>
								</div>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio3" name="code_id" value="003" class="custom-control-input"> <label class="custom-control-label" for="customRadio3">마모 고장</label>
								</div>
								<div class="custom-control custom-radio mb-5">
									<input type="radio" id="customRadio4" name="code_id" value="004" class="custom-control-input" checked> <label class="custom-control-label" for="customRadio4">기타 검사</label>
								</div>
							</div>
							<div class="form-group">
								<label>상세 내용</label>
								<textarea class="form-control" name="mt_content"></textarea>
							</div>
							<!-- examples end -->
						</div>
					</div>
					<!-- 입력 구간 -->

					<!-- 버튼 -->
					<div class="row">
						<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
							<button type="button" class="btn btn-secondary" onclick="closePopup();">
								<b>취소</b>
							</button>
							<button type="submit" class="btn btn-success">
								<b>등록</b>
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
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>