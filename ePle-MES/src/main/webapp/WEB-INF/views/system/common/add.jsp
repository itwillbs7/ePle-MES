<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>공통코드 추가</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 추가</h1>
			</div>
			<!-- 폼 -->
			<form role="form" method="post">
				<!-- 입력 구간 -->
					<input type="hidden" value="1" name="active">
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>그룹ID</label> <input class="form-control" type="text" placeholder="그룹ID" name="group_id">
						</div>
						<div class="form-group">
							<label>그룹명</label> <input class="form-control" placeholder="그룹명" name="group_name">
						</div>
						<div class="form-group">
							<label>코드ID</label> <input class="form-control" placeholder="코드ID" name="code_id">
						</div>
						<div class="form-group">
							<label>코드명</label> <input class="form-control" placeholder="코드명" name="code_name">
						</div>
						<div class="form-group">
							<label>정렬순서</label> <input class="form-control" placeholder="정렬순서" name="sortorder">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>중복확인</b>
							</button>
						</div>
				<!-- 입력 구간 -->
		
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="button" class="btn btn-success">
							<b>등록</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	
	<script type="text/javascript">
			
		$(document).ready(function() {
			
			var formObj = $('form[role="form"]');
			
	 		$(".btn-success").click(function(){
	 			formObj.attr("action","/system/common/add");
	 			formObj.attr("method","POST");
	 			formObj.submit(); 
	 			alert('추가 완료!');
	 		});
			
		});
		
	</script>
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>