<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>창고 등록</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center text-primary">창고 등록</h1>
			</div>
			
			<div class="tab">
				
				<div class="tab-content">

					<!------------------------------ 첫번째 폼 ------------------------------>
					<div class="tab-pane fade active show" id="ord-Warehousing" role="tabpanel">
						<form method="post" id="pro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								
									<div class="form-group">
    									<label>창고 정보</label>
    									<select class="form-control" name="category" required>
        									<option value="" disabled selected hidden>창고를 선택하세요</option>
        									<option value="원자재">원자재</option>
        									<option value="완제품">완제품</option>
        									<option value="설비품">설비품</option>
    									</select>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" name="name" placeholder="창고이름" required>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" name="location" placeholder="창고위치" required>
									</div>
								
									
									<label>담당자 정보</label> 
									<div class="form-group">
										<input class="form-control" type="hidden" id="selectA">
										<input class="form-control" type="text" id="selectB" name="manager" placeholder="사원이름" readonly required>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" id="selectC" name="mng_phone" placeholder="사원연락처" readonly required>
									</div>

									
								</div>
							</div>
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
					</div>
					
					
				</div>
				<!------------------------------ 콘텐츠 끝 ------------------------------>
			</div>
		</div>
	</div>

	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
	window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight() + 13);
	
	
	
	function openPopup(url) {
	    var width = 550;
	    var height = 550;
	    var left = (screen.width - width) / 2;
	    var top = (screen.height - height) / 2;
	    var popupWindow = window.open(url, '_blank', "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
	    popupWindow.focus();
	}
	$(document).ready(function() {
		// 등록 - 사원 리스트 (자재부)
	    $("#selectB,#selectC").click(function() {
	        var url = '${pageContext.request.contextPath}/stock/searchEmployees';
	        openPopup(url);
	    });
	 
	});
		
		
	
	
	
	</script>
</body>
</html>