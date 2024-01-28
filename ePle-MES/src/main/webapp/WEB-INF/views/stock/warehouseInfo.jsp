<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
label {
font-weight: bold;
}
</style>
<title>창고 상세</title>
</head>
<body>
<c:if test="${sessionScope.id eq null}">
	<c:redirect url="/" />
</c:if>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">창고 상세</h1>
			</div>
			<!-- 폼 -->
			<form action="/stock/warehouseEdit" method="get" id="editForm">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
									<label>창고코드</label> 
								<div class="form-group">
								<input class="form-control" type="text" name="code" id="code" readonly value="${List.code }">
								</div>
								
									<label>창고 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" name="category"  readonly value="${List.category}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="wh_name"  readonly value="${List.wh_name}">
								</div>
								<div class="form-group">
									<input class="form-control" type="text" name="location"  readonly value="${List.location}">
								</div>

									<label>담당자 정보</label> 
								<div class="form-group">
									<input class="form-control" type="text" name="manager"  readonly value="${List.name}">
								</div>
								<div class="form-group">
    								<input class="form-control" type="text" name="mng_phone" readonly value="${List.phone}" id="formattedPhone">
								</div>


				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>취소</b></button>
						
						<c:if test="${sessionScope.pos_id.equals('005') or sessionScope.dep_group.equals('자재')}">
						<input type="submit" class="btn btn-success" value="수정" id="update">
						</c:if>
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<script type="text/javascript">
	window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 13);
	

    document.addEventListener('DOMContentLoaded', function() {
        var phoneNumberInput = document.getElementById('formattedPhone');
        var originalPhoneNumber = phoneNumberInput.value;

        var formattedPhoneNumber = originalPhoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

        phoneNumberInput.value = formattedPhoneNumber;
    });

		
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>