<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ page session="false"%>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
label {
font-weight: bold;
}
.back {
  background-color: white !important;
}
</style>
<title>입고 등록</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center" style="color: #7CB342;">입고 등록</h1>
			</div>
			
			<div class="tab">
				<ul class="nav nav-pills" role="tablist">
					<!-- <li class="nav-item"><a class="nav-link text-blue active" data-toggle="tab" href="#ord-Warehousing" role="tab" aria-selected="true">발주</a></li> -->
					<!-- <li class="nav-item"><a class="nav-link text-blue" data-toggle="tab" href="#pro-Warehousing" role="tab" aria-selected="false">생산</a></li> -->
				</ul>
				
				<div class="tab-content">
					<!------------------------------ 첫번째 폼 ------------------------------>
					<div class="tab-pane fade active show" id="ord-Warehousing" role="tabpanel">
						<form method="post" id="pro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								
    									<label>자재 유형</label>
									<div class="form-group">
    									<select class="form-control" name="category" required>
        									<option value="" disabled selected hidden>창고를 선택하세요</option>
        									<option value="원자재">원자재</option>
        									<option value="설비">설비</option>
    									</select>
									</div>
									
										<label>발주 정보</label> 
									<div class="form-group">
										<input class="form-control back" type="text" id="orderCode" name="order_num" placeholder="발주코드" required readonly>
									</div>
									<div class="form-group">
										<input class="form-control back" type="text" id="mapdName" placeholder="품명" readonly>
										<input class="form-control back" type="hidden" id="mapdCode" name="mapd_code" placeholder="자재코드" required readonly>
									</div>
									<div class="form-group">
										<input class="form-control back" type="number" id="orderAmount" name="amount" placeholder="수량" required readonly>
									</div>

										<label>창고 정보</label> 
									<div class="form-group">
										<input class="form-control back" type="text" id="warehouseCode" name="warehouse_code" placeholder="창고코드" required readonly>
									</div>
									<div class="form-group">
										<input class="form-control back" type="text" id="empName" placeholder="담당자" required readonly>
										<input class="form-control back" type="hidden" id="empCode" name="emp_code" placeholder="담당자" required readonly>
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
					
					<!------------------------------ 두번째 폼 ------------------------------>
					<div class="tab-pane fade" id="pro-Warehousing" role="tabpanel">
						<form method="post" id="nonpro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<!-- <input type="hidden" name="group_id" value="FACNPR"> -->
									<div class="form-group">
										<label>자재 유형</label> <input class="form-control" readonly type="text" name="category" value="'완제품'">
									</div>
									






								</div>
							</div>
							<!------------------------------ 버튼 시작 ------------------------------>
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="closePopup();">
										<b>취소</b>
									</button>
									<button type="submit" class="btn btn-success">
										<b>등록</b>
									</button>
								</div>
							</div>

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
		// 등록 - 발주 리스트 (발주완료, 입고X)
	    $("#orderCode,#mapdName,#orderAmount").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchOrder';
	        openPopup(url);
	    });
	 
	 	// 등록 - 창고 리스트
	    $("#warehouseCode, #empName").click(function() {
	        var url = '${pageContext.request.contextPath}/material/searchOrderWarehouse';
	        openPopup(url);
	    });
	});
		
		
	
	
	
	</script>
</body>
</html>