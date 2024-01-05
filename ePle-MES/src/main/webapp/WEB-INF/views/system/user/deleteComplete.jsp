<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>삭제완료</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 삭제</h1>
				<h4 class="text-center">총 ${result }개 삭제완료!</h4>
			</div>
		
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-6 mb-2 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-success" onclick="closePopup();">
							<b>확인</b>
						</button>
					</div>
					
				</div>
				<!-- 버튼 -->
		</div>
	</div>
	
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>