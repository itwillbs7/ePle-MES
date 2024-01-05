<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<title>반품 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">출하번호 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
			<form action="" method="post" id="searchManager">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>회사명</label> 
							<input class="form-control" type="text" placeholder="업체명을 입력하세요" name="manager" id="manager">
						</div>
						<div class="form-group">
							<label>품명</label> 
							<input class="form-control" type="text" placeholder="품명을 입력하세요" name="managerName" id="managerName">
						</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-success" onclick="submitForm();">
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
			<table class="table table-striped" id="tableId">
			<thead>
				<tr>
					<th>출하번호</th>
					<th>품번</th>
					<th>출하일자</th>
					<th>출하량</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${List}" var="item">
				<tr onclick="selectWork('${item.code}','${item.product}','${item.clientName}','${item.date}','${item.amount}','${item.reqs_code}')">
					<th >${item.code}</th>
					<th >${item.product }</th>
					<th >${item.date}</th>
					<th >${item.amount}</th>
				</tr>
				</c:forEach>
			</tbody>
			</table>
			
			
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
	 <script type="text/javascript">
		function submitForm(){
			
		$.ajax({
		    url: '/return/searchShipment',
		    type: 'POST',
		    data: { 
		    	clientName: $('#manager').val(),
		    	productName: $('#managerName').val() 
		    },
		    success: function(data) {
		    	// 서버로부터 받은 데이터를 사용하여 테이블 업데이트
	            var table = '';
	            $.each(data, function(index, item) {
	                table += '<tr onclick="selectWork(\'' + item.code + '\',\'' + item.product + '\',\'' +item.clientName+ '\',\''+item.date+ '\',\''+ item.amount
	                		+ '\',\'' +item.reqs_code  + '\')">';
	                table += '<th>' + item.code + '</th>';
	                table += '<th>' + item.product + '</th>';
	                table += '<th>' + item.date+ '</th>';
	                table += '<th>' + item.amount + '</th>';
	                table += '</tr>';
	            });
	            // 기존 테이블 헤더를 유지하면서 테이블 바디 내용을 업데이트
	            $('#tableId tbody').html(table);  
		    }
		});
		}
		
		
	//부모창으로 데이터 넘기기
    function selectWork(a,b,c,d,e,f){ // 부모창으로 값 넘기기
		
    		opener.document.getElementById("reqs_code").value = a //수주번호
    		opener.document.getElementById("product").value = b //품번
    		opener.document.getElementById("clientName").value = c //회사명
    		opener.document.getElementById("reqsdate").value = d //수주일자
    		opener.document.getElementById("reqsamount").value = e // 수주량
    		opener.document.getElementById("ware_code").value = f // 창고코드
    		
    		opener.document.getElementById("reqs_code").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("product").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("clientName").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("reqsdate").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("reqsamount").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("ware_code").dispatchEvent(new Event('input'));
    	    
    		self.close();
    	

      }
	
	
	</script> 
</body>
</html>