<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>보전 추가</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">작업지시 추가</h1>
			</div>
			<!-- 폼 -->
			<form action="" method="post">

				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>제품</b></label>
							<select class="custom-select2 form-control" name="category" style="width: 100%; height: 38px">
								<!-- 공통 코드로 받아오기 -->
								
							</select>
						</div>
						<div class="form-group">
							<label><b>라인</b></label>
							<select class="custom-select2 form-control" name="category" style="width: 100%; height: 38px">
								<!-- 공통 코드로 받아오기 -->
								
							</select>
						</div>
						<div class="form-group">
							<label><b>수주번호</b></label>
							<select class="custom-select2 form-control" name="category" style="width: 100%; height: 38px">
								<!-- 공통 코드로 받아오기 -->
								
							</select>
						</div>
					</div>
				</div>

				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label>수량</label>
							<input class="form-control" type="text" placeholder="수량">
						</div>
						<div class="form-group">
							<label>등록자</label>
							<input class="form-control" type="text" placeholder="등록자 정보가 없습니다" readonly="">
						</div>
						<!-- examples end -->
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
	<%@ include file="../include/footer.jsp"%>
</body>
</html>