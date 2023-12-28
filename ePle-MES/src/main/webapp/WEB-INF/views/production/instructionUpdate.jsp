<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>작업지시 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">작업지시 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/production/updateInstruction" method="post">
				<!-- 카테고리 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label><b>수주번호</b></label>
							<select class="custom-select2 form-control" name="request" style="width: 100%; height: 38px" id="requestSelect" required="required">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${requestList }" var="request">
									<option value="${request }">${request }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label><b>제품</b></label>
							<select class="custom-select2 form-control" name="product" style="width: 100%; height: 38px" id="productSelect" required="required">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${productList }" var="product">
									<option value="${product }">${product }</option>
								</c:forEach>
							</select>
						</div>
						<!-- 수량 받아와서 최대치 설정하기 -->
						<div class="form-group">
							<label>수량</label>
							<input class="form-control" type="number" max="10" min="0" placeholder="수량" required="required" name="amount">
						</div>
						<!-- 수량 받아와서 최대치 설정하기 -->
					</div>
				</div>
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label><b>라인</b></label>
							<select class="custom-select2 form-control" name="line_code" style="width: 100%; height: 38px" id="line_codeSelect" required="required">
								<!-- 공통 코드로 받아오기 -->
								<c:forEach items="${line_codeList }" var="line_code">
									<option value="${line_code }">${line_code }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>지시사항</label>
							<textarea class="form-control" name="content"></textarea>
						</div>
						<!-- 세션에서 받아오기 -->
						<div class="form-group">
							<label>등록자</label>
							<input class="form-control" type="text" placeholder="등록자 정보가 없습니다" readonly="" value="관리자1"  required="required" name="reg_emp">
						</div>
						<!-- 세션에서 받아오기 -->
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
	<script type="text/javascript">
		$('#requestSelect').change(function() {
			ajaxGetProductList(this.value);
		});
	</script>
	<script type="text/javascript">
		function ajaxGetProductList(request) {
			$.ajax({
				type : 'post',
				url : '/production/ajaxGetProductList',
				data : {"request":request},
				error: function(){
					alert("error");
				},
				success : function(data){
					var html = "";
					$('#productSelect').find('option').remove();
					$(data).each(function () {
						html += "<option value='" + this + "'>" + this + "</option>";
					});
					$("#productSelect").append(html);
				}
			});
		}
	</script>
	<script type="text/javascript">
		$('#productSelect').change(function() {
			alert('변경');
		});
	</script>
	<script type="text/javascript">
		$(function(){
			var request = '<c:out value='${instruction.request}'/>';
			var line_code = '<c:out value='${instruction.line_code}'/>';
			alert(1);
			//수주번호 선택하기
			//$("#requestSelect option:eq(1)").prop("selected", true);
			$('#requestSelect').val(request).prop("selected",true);
			$('#line_codeSelect').val(line_code).prop("selected",true);
			alert(2);
			//ajax
			
			//품번 선택하기
			
			//라인코드 선택하기
			//$('#requestSelect').val("${asd}").prop("selected", true);
			//$('#requestSelect').val("${asd}").prop("selected", true);
		});
	</script>
</body>
</html>