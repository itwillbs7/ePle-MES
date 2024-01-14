<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>품목 등록</title>

</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">품목 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/product/add" method="post">

                <!-- 입력 구간 -->
				<div class="row">
				    <div class="col-sm-12 mb-3">
				        <!-- examples -->
				        <label>품번</label>
				        <div class="form-group">
				            <input class="form-control" type="text" name="code" id="productCode" placeholder="품목 코드 입력" oninput="validateProductCode(this)" required>
				            <small id="codeValidationMsg" style="color: red;"></small>
				        </div>
						    <input class="form-control" type="hidden" name="group_id" value="PROD">
                        <div class="form-group">
                            <label>소분류</label>
							<select class="custom-select col-12" name="code_id">
								<option value="001">원자재</option>
								<option value="002">반제품</option>
								<option value="003">완제품</option>
							</select>    
                        </div>
                        <div class="form-group">
                            <label>품명</label> <input class="form-control" type="text" name="name" placeholder="원자재 또는 완제품 품명 입력" required>
                        </div>
                        <div class="form-group">
                            <label>규격</label> <input class="form-control" type="text" name="size" placeholder="규격 입력" required>
                        </div>
                        <div class="form-group">
						    <label>단위</label>
						    <select class="form-control" name="unit" required>
						        <option value="" disabled selected>단위 선택</option>
						        <option value="EA">EA</option>
						    </select>
						</div>
                        <div class="form-group">
						    <label>입고 단가</label>
						    <div class="input-group">
						        <input class="form-control" type="number" name="inprice" placeholder="입고 단가 입력" required>
						        <div class="input-group-append">
						            <span class="input-group-text">원</span>
						        </div>
							</div>
						</div>
				        <input class="form-control" type="hidden" name="outprice" value="100">
						<div class="form-group">
                            <input class="form-control" type="hidden" name="reg_emp" value="${sessionScope.code }">
                        </div>
						<div class="form-group">
						    <label>등록일</label>
						    <input class="form-control" type="text" name="reg_date" placeholder="등록일 입력" id="regDate" readonly required>
						</div>
                        <div class="form-group">
                            <input class="form-control" type="hidden" name="update_emp" value="${sessionScope.code }">
                        </div>
						<div class="form-group">
						    <label>수정일</label>
						    <input class="form-control" type="text" name="update_date" placeholder="수정일 입력" id="updateDate" readonly required>
						</div>
						<div class="form-group">
						    <label>사용여부</label>
						    <select class="form-control" name="active" required>
						        <option value="" disabled selected>사용여부 선택</option>
						        <option value="true">Y</option>
						        <option value="false">N</option>
						    </select>
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
	<!-- 콘텐츠 끝 -->

	<%@ include file="../include/footer.jsp"%>
	
	<script>
	    function validateProductCode(inputField) {
	        var inputValue = inputField.value;
	        var pattern = /^[A-Z0-9]+$/;
	
	        if (!pattern.test(inputValue)) {
	            document.getElementById('codeValidationMsg').innerText = '영문 대문자와 숫자를 조합하여 입력하세요.';
	            inputField.setCustomValidity('영문 대문자와 숫자를 조합하여 입력하세요.');
	        } else {
	            document.getElementById('codeValidationMsg').innerText = '';
	            inputField.setCustomValidity('');
	        }
	    }
	    
	    // 등록일과 수정일을 현재 날짜로 채우는 함수
	    function fillCurrentDate(fieldId) {
	        var currentDate = new Date();
	        var year = currentDate.getFullYear();
	        var month = ('0' + (currentDate.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더해줍니다.
	        var day = ('0' + currentDate.getDate()).slice(-2);

	        var formattedDate = year + '-' + month + '-' + day;

	        document.getElementById(fieldId).value = formattedDate;
	    }

	    // 페이지 로드 시 현재 날짜로 등록일과 수정일 채우기
	    document.addEventListener('DOMContentLoaded', function () {
	        fillCurrentDate('regDate');
	        fillCurrentDate('updateDate');
	    });
	</script>
	
</body>
</html>