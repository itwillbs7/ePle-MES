<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">일상 보전 등록</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 설비 목록에서 사번으로 체크 후, 입력된 것이 없을 경우 설비 정보를 입력하도록 함! -->
						<!-- inputs -->
						<div class="form-group">
							<label>사번</label> <input type="text" readonly class="form-control-plaintext" value="직원 사번">
						</div>
						<div class="form-group">
							<label>설비 번호</label> <input type="text" readonly class="form-control-plaintext" value="설비 번호">
						</div>
						<div class="form-group">
							<label>설비 번호</label> <input class="form-control" type="text" placeholder="PRO-001">
						</div>
						<div class="form-group">
							<label class="col-form-label">보전 결과</label>
							<select class="custom-select col-12">
								<option selected>선택</option>
								<!-- 공통 코드 추가 -->
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
								<!-- 공통 코드 추가 -->
							</select>
						</div>
						<div class="form-group">
							<label>상세 내용</label>
							<textarea class="form-control"></textarea>
						</div>
						<!-- inputs -->
					</div>
				</div>
				<!-- 입력 구간 -->

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
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>

</body>
</html>