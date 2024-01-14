<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>추가완료</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 추가완료!</h1>
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
	<script type="text/javascript">
	
	$(document).ready(function(){
		window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight());
		});

		/* outerWidth : 바깥 둘레 포함 가로 크기
		innerWidth : 내부 가로 크기
		500 -> 내부 가로 수치
		outerHeight : 바깥 둘레 포함 세로 크기
		innerHeight : 내부 세로 크기

		$(".login-box").outerHeight() : 모달창 박스 크기 추적
		+11은 자유(스크롤바 없애려고 늘임) -> 수치 조정 가능 */
	
	</script>
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>