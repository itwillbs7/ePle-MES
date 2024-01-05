<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>공통코드 수정</title>
<!-- 
	실행 방법
		- 테이블 페이지의 옵션에서 삭제클릭
		- 상세 정보에서 삭제 클릭
 -->
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/system/common/update" method="post">
				<!-- 인덱스 -->
				<input type="hidden" name="index" value="${cvo.group_id }_${cvo.code_id }">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label>그룹ID</label> <input class="form-control" name="group_id" type="text" value="${cvo.group_id }">
						</div>
						<div class="form-group">
							<label>그룹명</label> <input class="form-control" name="group_name" value="${cvo.group_name }" type="text">
						</div>
						<div class="form-group">
							<label>코드ID</label> <input class="form-control" name="code_id" value="${cvo.code_id }" type="text">
						</div>
						<div class="form-group">
							<label>코드명</label> <input class="form-control" name="code_name" value="${cvo.code_name }" type="text">
						</div>
						<div class="form-group">
							<label>정렬순서</label> <input class="form-control" name="sortorder" value="${cvo.sortorder }" type="text">
						</div>
						<div class="form-group">
							<label>사용여부</label> <input class="form-control" name="active" value="1" type="text">
						</div>
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
							<b>수정</b>
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