<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>소요량 삭제</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary mb-20">소요량 삭제</h1>
				<h4 class="text-center">${info.name}</h4>
			</div>
			<!-- 폼 -->
			<form action="/requirement/delete" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>재료 선택</b></label>
							<ul class="list-group">
								<c:forEach items="${list}" var="i">
									<li class="list-group-item">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input" id="${i.bno}" name="code" value="${i.bno}"> <label class="custom-control-label" for="${i.bno}"><b>${i.materialName}</b></label>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<!-- 리스트 목록 -->
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
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

	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function(){
			window.resizeTo(outerWidth - innerWidth + 500,
					outerHeight - innerHeight
							+ $(".login-box").outerHeight()
							+ 12);
			$("form").on("submit", function(){
				if($("input:checkbox:checked").length == 0){
					alert("선택된 데이터가 없습니다!");
					return false;
				}
				else 
					return true;
			});
		});
	</script>
</body>
</html>