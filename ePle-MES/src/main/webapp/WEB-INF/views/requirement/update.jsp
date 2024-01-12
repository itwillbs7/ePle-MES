<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>소요량 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary mb-20">소요량 수정</h1>
				<h4 class="text-center">${info.name}</h4>
			</div>
			<!-- 폼 -->
			<form action="/requirement/update" method="post">
				<!-- 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>재료</b></label>
							<c:forEach items="${list}" var="i">
								<div class="custom-control custom-checkbox mb-5">
									<input type="checkbox" class="custom-control-input" id="${i.bno}" name="code" value="${i.bno}"> <label class="custom-control-label" for="${i.bno}"><b>${i.materialName}</b></label>
								</div>
								<!-- 입력 구간 -->
								<div class="col-sm-12 mb-3 form-data" id="toggle-${i.bno}">
									<!-- examples -->
									<div class="form-group">
										<label><b>메모</b></label> <input class="form-control" type="text" name="content" value="${i.content}" id="content-${i.bno}" placeholder="내용 입력" required>
									</div>
									<div class="form-group">
										<label><b>소요량</b></label> <input class="form-control" type="number" value="${i.amount}" name="amount" id="amount-${i.bno}" placeholder="소요량 입력" required>
									</div>
									<!-- examples end -->
								</div>
								<!-- 입력 구간 -->
							</c:forEach>
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
	<!-- 콘텐츠 끝 -->
	
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".form-data").toggle();
			$("input:checkbox").change(function() {
				var i = $(this).val();
				$("#toggle-" + i).toggle();
			});
		});
		
		$("form").on("submit", function(){
			if($("input:checkbox:checked").length == 0){
				alert("선택된 데이터가 없습니다!");
				var result = $("input:checkbox");
				return false;
			}
			else{
				$('input:checkbox[name="code"]').each(function(){
					if(!$(this).is(':checked')){
						var del = $(this).val();
						$("#content-" + del).remove();
						$("#amount-" + del).remove();
					}
				});
				return true;
			}
		});
	</script>
</body>
</html>