<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>수주 등록</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">수주업체 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
			<form method="post" id="searchClient" action="/request/searchClient">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="업체코드를 입력하세요" 
							name="client_code" id="client_code" >
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" placeholder="업체이름을 입력하세요" 
							name="clientName" id="clientName" >
						</div>

				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-success" onclick="submitForm();" >
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
					<th>업체코드</th>
					<th>업체명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${List}" var="List">
				<tr onclick="selectWork('${List.client_code }','${List.clientName }')">
					<th >${List.client_code }</th>
					<th >${List.clientName }</th>
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
		    url: '/request/searchClient',
		    type: 'POST',
		    data: { 
		        client_code: $('#client_code').val(),
		        clientName: $('#clientName').val() 
		    },
		    success: function(data) {
		    	// 서버로부터 받은 데이터를 사용하여 테이블 업데이트
	            var table = '';
	            $.each(data, function(index, item) {
	     			console.log(item.client_code);
	                table += '<tr onclick="selectWork(\'' + item.client_code + '\',\'' + item.clientName + '\')">';
	                table += '<th>' + item.client_code + '</th>';
	                table += '<th>' + item.clientName + '</th>';
	                table += '</tr>';
	            });
	            // 기존 테이블 헤더를 유지하면서 테이블 바디 내용을 업데이트
	            $('#tableId tbody').html(table);  
		    }
		});
		}
		
		
	//부모창으로 데이터 넘기기
    function selectWork(a,b){ // 부모창으로 값 넘기기
		  
		if(opener.document.getElementById("searchCompany") != null){
    		opener.document.getElementById("client_code").value = a
    		opener.document.getElementById("searchCompany").value = b
    		opener.document.getElementById("client_code").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("searchCompany").dispatchEvent(new Event('input'));
    		self.close();
			return;
		}

    		opener.document.getElementById("client_code").value = a
    		opener.document.getElementById("clientName").value = b
    		opener.document.getElementById("client_code").dispatchEvent(new Event('input'));
    	    opener.document.getElementById("clientName").dispatchEvent(new Event('input'));
    		self.close();
    	

      }
	
	
	</script> 
</body>
</html>