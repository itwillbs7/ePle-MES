<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>품목 상세</title>
</head>
<body>
<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">품목 상세</h1>
			</div>
			<!-- 폼 -->
			<form action="/product/productInfo" method="get">
				<!-- 비입력 구간 -->
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						
								<div class="form-group">
									<label>품목 코드</label> 
									<input class="form-control" type="text" name="code"  readonly value="${infoProduct.code}">
								</div>
								<div class="form-group">
									<label>원자재 or 완제품 품번</label> 
									<input class="form-control" type="text" name="group_id"  readonly value="${infoProduct.group_id}">
								</div>
								<div class="form-group">
									<label>소분류</label> 
									<input class="form-control" type="text" name="code_id"  readonly value="${infoProduct.code_id}">
								</div>
								<div class="form-group">
									<label>원자재 or 완제품 품명</label> 
									<input class="form-control" type="text" name="name"  readonly value="${infoProduct.name}">
								</div>
								<div class="form-group">
									<label>규격</label> 
									<input class="form-control" type="text" name="size"  readonly value="${infoProduct.size}">
								</div>
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>단위</label>
				                            <input class="form-control" type="text" name="unit" value="${infoProduct.unit}" readonly>
				                        </div>
				                    </div>
				                </div>
								<!-- 입고단가 (원) -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>입고단가 (원)</label>
				                            <input class="form-control" type="text" name="inprice" value="${infoProduct.inprice}" readonly>
				                        </div>
				                    </div>
				                </div>
				                <!-- 출고단가 (원) -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>출고단가 (원)</label>
				                            <input class="form-control" type="text" name="outprice" value="${infoProduct.outprice}" readonly>
				                        </div>
				                    </div>
				                </div>
								<!-- 등록자 사원코드 -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>등록자 사원코드</label>
				                            <input class="form-control" type="text" name="reg_emp" value="${infoProduct.reg_emp}" readonly>
				                        </div>
				                    </div>
				                </div>
				                
				                <!-- 등록일 -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>등록일</label>
				                            <input class="form-control" type="text" name="reg_date" value="${infoProduct.reg_date}" readonly>
				                        </div>
				                    </div>
				                </div>
				                
				                <!-- 수정자 사원코드 -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>수정자 사원코드</label>
				                            <input class="form-control" type="text" name="update_emp" value="${infoProduct.update_emp}" readonly>
				                        </div>
				                    </div>
				                </div>
				                
				                <!-- 수정일 -->
				                <div class="row">
				                    <div class="col-sm-12 mb-3">
				                        <div class="form-group">
				                            <label>수정일</label>
				                            <input class="form-control" type="text" name="update_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly>
				                        </div>
				                    </div>
				                </div>
				
								<!-- 사용 여부 -->
								<div class="row">
								    <div class="col-sm-12 mb-3">
								        <div class="form-group">
								            <label>사용여부</label>
								            <input class="form-control" type="text" name="active" value="${infoProduct.active == 'true' ? 'Y' : 'N'}" readonly>
								        </div>
								    </div>
								</div>
				                
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();"><b>닫기</b></button>
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
	    document.addEventListener("DOMContentLoaded", function () {
	        // 등록일
	        var regDateInput = document.getElementsByName("reg_date")[0];
	        regDateInput.value = regDateInput.value.substring(0, 10);
	
	        // 수정일
	        var updateDateInput = document.getElementsByName("update_date")[0];
	        updateDateInput.value = updateDateInput.value.substring(0, 10);
	    });
	    
	</script>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>