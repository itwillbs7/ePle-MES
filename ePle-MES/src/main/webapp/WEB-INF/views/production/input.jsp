<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<html>
<head>
<%@ include file="../include/head.jsp"%>
<style>
input[readonly] {
  background-color: white;
}
</style>
<title>재료 투입</title>
</head>
<body>

	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
		<button type="button" class="close" onclick="window.close();">×</button>

			<div class="login-title">
				<h1 class="text-center text-primary">재료 투입</h1>
			</div>
			
				
				<div class="tab-content">
					<!------------------------------ 첫번째 폼 ------------------------------>
						<form method="post">
							<div class="pd-20">
								<div class="col-sm-12 mb-3">
									<div class="form-group">
										<label>실적 코드</label> 
										<input class="form-control" type="text" id="result_code" name="result_code" placeholder="실적코드" value="${result.code }" readonly>
									</div>
									<div class="form-group">
										<label>품목</label> 
										<input class="form-control" type="text" id="mapdName" placeholder="품명"  value="${result.vo.product }" readonly>
									</div>
									<div class="form-group">
										<label>수량</label>
										<input class="form-control" type="number" id="orderAmount" value="${result.vo.amount }" placeholder="수량" readonly>
									</div>
									<div class="table-responsive">
										<table id="materials" class="table table-striped">
											<thead>
												<tr>
													<th scope="col">#</th>
													<th>재료코드</th>
													<th>소요량</th>
													<th>총합</th>
													<th>재고</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- 버튼 -->
							<div class="row">
								<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
									<button type="button" class="btn btn-secondary" onclick="window.close();">
										<b>취소</b>
									</button>
									<button type="button" class="btn btn-success" onclick="arrayThrow();">
										<b>투입</b>
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
	<!-- BOM업데이트 시작 -->
	<script type="text/javascript">
		$("#materials>tbody").empty();
		var product = "<c:out value='${result.vo.product}'/>";
		var planedAmount = "<c:out value='${result.vo.amount}'/>";
		$.ajax({
			url : "/production/getBOM",
			type : "POST",
			data : {
				mapd_code : product
			},
			error : function() {
				alert("error");
			},
			success : function(data) {
				console.log(data);
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html = "";
					html += "<tr>";
					html += "<td>" + data[i].bno +"</td>";
					html += "<td>" + data[i].material + "<input type='hidden' name='mapd_code' value='" + data[i].material + "'></td>";
					html += "<td>" + data[i].amount + "</td>";
					html += "<td>" + data[i].amount * planedAmount + "<input type='hidden' name='amount' value='" + data[i].amount * planedAmount + "'></td>";
					html += "<td>" + data[i].inventory + "<input type='hidden' name='inventory' value='" + data[i].inventory + "'></td>";
					html += "</tr>";
					$("#materials>tbody").append(html);
				}
			}
		});
	</script>
	<!-- BOM업데이트 끝 -->
	<!-- 배열로 넘기기 시작 -->
	<script type="text/javascript">
		function arrayThrow() {
			var arr = [];
			var mapd_code = [];
			var amount = [];
			var inventory = [];
			$("input[name='mapd_code']").each(function() {
		        mapd_code.push($(this).val());
		    });
			$("input[name='amount']").each(function() {
		        amount.push($(this).val());
		    });
			$("input[name='inventory']").each(function() {
				inventory.push($(this).val());
		    });
			var result_code = $("#result_code").val();
			for (var i = 0; i < mapd_code.length; i++) {
				if (Number(inventory[i]) < Number(amount[i])) {
					alert('재고가 부족합니다');
					return false;
				}
				arr.push({code:null,mapd_code:mapd_code[i],amount:amount[i],result_code:result_code});
			}
			$.ajax({
				url : "/production/input",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(arr),
				error : function() {
					alert("error");
				},
				success : function(data) {
					alert('success');
					window.opener.postMessage("refresh", "*");
					window.close();
				}
			});
		}
	</script>
	<!-- 배열로 넘기기 끝 -->
</body>
</html>