<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
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
            <form action="/facility/mapd/add" method="post">
                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <input type="hidden" name="code" value="F">
						<div class="form-group">
						    <label>종류</label>
						    <select class="selectpicker form-control" id="group" name="group_id" data-style="btn-primary" data-size="5" required>
						        <option value="" disabled selected hidden="hidden">선택</option>
						        <option value="FACPRO">생산</option>
						        <option value="FACNPR">비생산</option>
						        <option value="FACETC">기타</option>
						    </select>
						</div>
						<div class="selectpicker form-group" id="codeForm" style="display: none;">
						    <label>소분류</label>
						    <select class="form-control" id="code" name="code_id" data-style="btn-info" data-size="5" required>
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
						    <select class="selectpicker form-control" name="unit" data-style="btn-info" data-size="5" required>
						        <option value="" disabled selected hidden="hidden">단위 선택</option>
						        <option value="EA">EA</option>
						    </select>
						</div>
                        <div class="form-group">
						    <label>단가</label>
						    <div class="input-group">
						        <input class="form-control" type="text" name="inprice" placeholder="입고 단가 입력" required>
						        <div class="input-group-append">
						            <span class="input-group-text">원</span>
						        </div>
							</div>
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

	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
	$("#group").on("change", function() {
		$("#codeForm").css('display', 'block');
		var value = $(this).val();
		$("#code").empty();
		$("#code").append("<option selected disabled hidden>선택</option>");
		if (value == 'FACPRO') {
			<c:forEach var="i" items="${FACPRO}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		} else if (value == 'FACNPR') {
			<c:forEach var="i" items="${FACNPR}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		} else if (value == 'FACETC') {
			<c:forEach var="i" items="${FACETC}">
				$("select#code").append("<option value='${i.code_id}'data-subtext='${i.code_id}'>${i.code_name}</option>");
			</c:forEach>
		}
		$("#code").selectpicker('refresh');
	});
	</script>
</body>
</html>