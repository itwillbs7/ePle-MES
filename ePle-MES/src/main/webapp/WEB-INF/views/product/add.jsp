<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>품목 등록</title>

    <script>
        function generateItemCode() {
            // 품목 코드를 자동으로 생성
            var prefix = "F"; // 품목 코드 접두사
            var currentNumber = 1; // 품목 코드의 현재 번호 (실제로는 DB에서 가져와야 함)

            // 여기에서 서버로부터 다음 번호를 가져오는 Ajax 요청을 보낼 수 있음

            // 생성된 품목 코드를 품목 코드 입력란에 넣기
            document.getElementsByName("code")[0].value = prefix + pad(currentNumber, 3);
        }

        // 숫자를 지정한 자릿수로 채우는 함수
        function pad(number, length) {
            var str = '' + number;
            while (str.length < length) {
                str = '0' + str;
            }
            return str;
        }

        function checkDuplicate() {
            var itemCode = document.getElementsByName("code")[0].value;

            // 여기에서 서버로 중복 여부를 확인하는 Ajax 요청을 보낼 수 있음
            // 실제로는 서버에서 DB를 조회하여 중복 여부를 판단해야 함

            // 임시로 중복 여부를 확인하는 예시
            if (itemCode === 'F001') {
                alert("이미 존재하는 품목 코드입니다.");
            }
        }
    </script>

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
                        <label>품목 코드</label> 
                        <div class="input-group">
                            <input class="form-control" type="text" name="code" placeholder="품목 코드 입력" readonly>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-primary" onclick="generateItemCode()">자동 생성</button>
                                <button type="button" class="btn btn-info" onclick="checkDuplicate()">중복 확인</button>
                        	</div>
                        </div>
                        <div class="form-group">
                            <label>원자재 or 완제품 품번</label> <input class="form-control" type="text" name="group_id" placeholder="원자재 또는 완제품 품번 입력" required>
                        </div>
                        <div class="form-group">
                            <label>소분류</label> <input class="form-control" type="text" name="code_id" placeholder="소분류 입력" required>
                        </div>
                        <div class="form-group">
                            <label>원자재 or 완제품 품명</label> <input class="form-control" type="text" name="name" placeholder="원자재 또는 완제품 품명 입력" required>
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
						        <input class="form-control" type="text" name="inprice" placeholder="입고 단가 입력" required>
						        <div class="input-group-append">
						            <span class="input-group-text">원</span>
						        </div>
							</div>
						</div>
						<div class="form-group">
						    <label>출고 단가</label>
						    <div class="input-group">
						        <input class="form-control" type="text" name="outprice" placeholder="출고 단가 입력" required>
						        <div class="input-group-append">
						            <span class="input-group-text">원</span>
						        </div>
							</div>
						</div>
						<div class="form-group">
                            <label>등록자 사원코드</label> <input class="form-control" type="text" name="reg_emp" placeholder="등록자 사원코드 입력" required>
                        </div>
                        <div class="form-group">
                            <label>등록일</label>
                            <input class="form-control" type="text" name="reg_date" placeholder="등록일 입력" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>수정자 사원코드</label> <input class="form-control" type="text" name="update_emp" placeholder="수정자 사원코드 입력" required>
                        </div>
                        <div class="form-group">
                            <label>수정일</label>
                            <input class="form-control" type="text" name="update_date" placeholder="수정일 입력" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly>
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
	<!-- 콘텐츠 끝> -->

	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>