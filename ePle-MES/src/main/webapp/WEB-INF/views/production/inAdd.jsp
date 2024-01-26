<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
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
				<h1 class="text-center text-primary">입고 등록</h1>
			</div>
			
				
				<div class="tab-content">
					<!------------------------------ 첫번째 폼 ------------------------------>
						<form method="post" action="/material/inAdd" id="addForm" onsubmit="return validateForm()">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
								
									<div class="form-group">
    									<label>자재 유형</label>
										<input class="form-control" type="text" name="category" placeholder="자재 유형" value="완제품" readonly>
									</div>
									<div class="form-group">
										<label>실적 코드</label> 
										<input class="form-control" type="text" id="orderCode" name="order_num" placeholder="실적코드" value="${result.code }" readonly>
									</div>
									<div class="form-group">
										<label>품목 코드</label> 
										<input class="form-control" type="text" id="mapdName" placeholder="품명"  value="${result.vo.product }" readonly>
										<input class="form-control" type="hidden" id="mapdCode" name="mapd_code" placeholder="자재코드" value="${result.vo.product }" readonly>
									</div>
									<div class="form-group">
										<label>생산량</label>
										<input class="form-control" type="number" id="orderAmount" name="amount" value="${result.amount }" placeholder="수량" readonly>
									</div>

									<div class="form-group">
										<label>창고 정보</label> 
										<input class="form-control back" type="text" id="warehouseCode" name="warehouse_code" placeholder="창고코드" readonly>
									</div>
									<div class="form-group">
										<input class="form-control back" type="text" id="empName" placeholder="담당자" readonly>
									</div>
										<input class="form-control" type="hidden" readonly value="${sessionScope.code }" name="emp_code">
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="button" class="btn btn-success" id="submitBtn">
										<b>등록</b>
									</button>
								</div>
							</div>
							<!-- 버튼 -->
						</form>
				</div>
				<!------------------------------ 콘텐츠 끝 ------------------------------>
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
		 	// 등록 - 창고 리스트
		    $("#warehouseCode, #empName").click(function() {
		        var url = '${pageContext.request.contextPath}/material/searchOrderWarehouse';
		        openPopup(url);
		    });
		});
	</script>
	<script>
    $(document).ready(function () {
        // 폼이 제출되기 전에 실행할 함수
        $("#submitBtn").click(function (event) {
            // 여기에 원하는 동작을 추가
            var code = $("#orderCode").val();
            $.ajax({
				url : "/production/insertLot",
				type : "POST",
				data : {code : code},
				error : function() {
					alert("error");
				},
				success : function() {
					$("#addForm").submit();
				}
			});
        });
    });
    
    
	function validateForm() {
	    
	    var warehouseCode = document.getElementById("warehouseCode").value;
	    var empName = document.getElementById("empName").value;
	  
	    if (warehouseCode === "" || empName === "" ) {
	        alert("모든 내용을 입력해주세요!");
	        return false; 
	    }
	    return true;
	}
</script>
</body>
</html>