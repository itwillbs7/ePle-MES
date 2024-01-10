<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<title>발주 요청</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center text-primary">발주 요청</h1>
			</div>
			
			<div class="tab">
				
				<div class="tab-content">

					<!------------------------------ 첫번째 폼 ------------------------------>
					<div class="tab-pane fade active show" id="ord-Warehousing" role="tabpanel">
						<form method="post" id="pro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								
									<div class="form-group">
										<label>자재 유형</label> <input class="form-control" type="text" value="'원자재'" readonly>
									</div>

									<div class="form-group">
										<label>품목 정보</label> 
										<input class="form-control" type="text" id="mapdCode" name="material" placeholder="품목코드" readonly>
										<input class="form-control" type="text" id="mapdName" placeholder="품명" readonly>
									</div>

									<div class="form-group">
										<label>요청량</label> 
										<input class="form-control" type="number" name="amount" required min="1" max="100"  oninput="{(e:any) ->{if(e.target.value > 0){if(e.target.value > 100) e.target.value = 99;}else{e.target.value = 1;}}}">
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
		// 등록 - 품목 리스트 (원자재)
	    $("#mapdCode,#mapdName").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchMaterial';
	        openPopup(url);
	    });
	 
	});
		
		
	
	
	
	</script>
</body>
</html>