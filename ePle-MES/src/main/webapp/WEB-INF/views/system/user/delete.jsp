<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>사용자(사원) 삭제</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 삭제</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<!-- 삭제 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<c:forEach items="${userList }" var="vo">
								<input type="hidden" name="codeList" value="${vo.code }">
								<li class="list-group-item">
									사원코드 : ${vo.code } <br>
									사원명 : ${vo.name } <br>
									부서 : ${vo.dep_group } <br>
									직책 : ${vo.pos_group }
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!-- 삭제 리스트 목록 -->
				
				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="closePopup();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-danger">
							<b>삭제</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
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