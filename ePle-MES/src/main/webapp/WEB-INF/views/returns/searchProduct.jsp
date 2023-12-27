<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<title>수주 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">품목 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
			<form action="" method="post" id="searchClient">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>품번</label> 
							<input class="form-control" type="text" placeholder="업체코드를 입력하세요" name="product" id="product">
						</div>
						<div class="form-group">
							<label>품명</label> 
							<input class="form-control" type="text" placeholder="업체이름을 입력하세요" name="productName" id="productName">
						</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-success" >
							<b>검색</b>
						</button>
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			</div>
			<!-- 폼 -->
			<table class="table table-striped">
				<tr>
					<th>품번</th>
					<th>품명</th>
				</tr>
				<c:forEach items="${List}" var="List">
				<tr onclick="selectWork('${List.product }','${List.productName }')">
					<th >${List.product }</th>
					<th >${List.productName }</th>
				</tr>
				</c:forEach>
			</table>
			
			
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
	 <script type="text/javascript">
		function submitForm(){
			
		$.ajax({
		    url: '/request/searchProduct',
		    type: 'POST',
		    data: { 
		    	product: $('#product').val(),
		    	productName: $('#productName').val() 
		    },
		    success: function(data) {
		    	// 서버로부터 받은 데이터를 사용하여 테이블 업데이트
	            var table = '';
	            $.each(data, function(index, item) {
	                table += '<tr onclick="selectWork(\'' + item.product + '\',\'' + item.productName + '\',\'' + item.unit+ '\',\'' + item.stock+ '\',\'' + item.currency + '\')">';
	                table += '<th>' + item.product + '</th>';
	                table += '<th>' + item.productName + '</th>';
	                table += '</tr>';
	            });
	            // 기존 테이블 헤더를 유지하면서 테이블 바디 내용을 업데이트
	            $('#tableId tbody').html(table);  
		    }
		});
		}
		
		
	//부모창으로 데이터 넘기기
    function selectWork(a,b,c,d,e){ // 부모창으로 값 넘기기
		  
    		opener.document.getElementById("product").value = a
    		opener.document.getElementById("productName").value = b
    		opener.document.getElementById("unit").value = c
    		opener.document.getElementById("stock").value = d
    		opener.document.getElementById("currency").value = e
    		self.close();
    	

      }
	
	
	</script> 
</body>
</html>