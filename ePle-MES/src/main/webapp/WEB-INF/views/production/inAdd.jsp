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
input[readonly] {
  background-color: white;
}
</style>
<title>입고 등록</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center text-primary">입고 등록</h1>
			</div>
			
				
				<div class="tab-content">
					<!------------------------------ 첫번째 폼 ------------------------------>
					<div class="tab-pane fade active show" id="ord-Warehousing" role="tabpanel">
						<form method="post" id="pro-form">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								
									<div class="form-group">
    									<label>자재 유형</label>
    									<select class="form-control" name="category" required>
        									<option value="" disabled selected hidden>창고를 선택하세요</option>
        									<option value="원자재">원자재</option>
        									<option value="설비품">설비품</option>
    									</select>
									</div>
									
									<div class="form-group">
										<label>발주 정보</label> 
										<input class="form-control" type="text" id="orderCode" name="order_num" placeholder="발주코드" readonly>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" id="mapdName" placeholder="품명" readonly>
										<input class="form-control" type="hidden" id="mapdCode" name="mapd_code" placeholder="자재코드" readonly>
									</div>
									<div class="form-group">
										<input class="form-control" type="number" id="orderAmount" name="amount" placeholder="수량" readonly>
									</div>

									<div class="form-group">
										<label>창고 정보</label> 
										<input class="form-control" type="text" id="warehouseCode" name="warehouse_code" placeholder="창고코드" readonly>
									</div>
									<div class="form-group">
										<input class="form-control" type="text" id="empName" placeholder="담당자" readonly>
										<input class="form-control" type="hidden" id="empCode" name="emp_code" placeholder="담당자" readonly>
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
	<%@ include file="../include/footer.jsp"%>
</body>
</html>