<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>보전 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="closePopup();">×</button>
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">일상 보전 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 설비 목록에서 사번으로 체크 후, 담당한 것이 없을 경우 설비 정보를 입력하도록 함! -->
						<!-- inputs -->
						<div class="form-group">
							<label>사번</label> <input type="text" readonly class="form-control-plaintext" value="${sessionScope.userid}">
						</div>
						<c:choose>
							<c:when test="${facilityCount == null or facilityCount == 0}">
								<div class="form-group">
									<label>설비 번호</label> <input class="form-control" type="text" placeholder="PRO-001">
								</div>
							</c:when>
							<c:when test="${facilityCount == 1}">
								<div class="form-group">
									<label>설비 번호</label> <input type="text" readonly class="form-control-plaintext" value="설비 번호">
								</div>
							</c:when>
							<c:when test="${facilityCount > 1 }">
								<div class="form-group">
									<label class="col-form-label">설비 목록</label> <select class="custom-select col-12">
										<option selected>선택</option>
										<c:forEach items="${list}" var="i">
											<option value="${i.code}">${i.code}-${i.name}(${i.model})</option>
										</c:forEach>
									</select>
								</div>
							</c:when>
						</c:choose>
						<div class="form-group">
							<label class="col-form-label">보전 결과</label>
							<div class="custom-control custom-radio mb-5">
								<input type="radio" id="radio1" name="mt_subject" class="custom-control-input" value="이상 없음" checked>
								<label class="custom-control-label" for="radio1">이상 없음</label>
							</div>
							<div class="custom-control custom-radio mb-5">
								<input type="radio" id="radio2" name="mt_subject" class="custom-control-input" value="이상 있음">
								<label class="custom-control-label" for="radio2">이상 있음</label>
							</div>
						</div>
						<div class="form-group">
							<label>상세 내용</label>
							<textarea class="form-control" id="form_textbox" name="mt_content"></textarea>
						</div>
						<!-- inputs -->
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
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>