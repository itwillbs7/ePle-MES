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
				<h1 class="text-center text-primary">수주업체 검색</h1>
			</div>
			<!-- 폼 -->
			<div class="search_area">
			<form action="" method="post" id="searchClient">
				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- 필수입력내역 -->
						<div class="form-group">
							<label>업체코드</label> 
							<input class="form-control" type="text" placeholder="업체코드를 입력하세요" name="client_code" id="client_code">
						</div>
						<div class="form-group">
							<label>업체명</label> 
							<input class="form-control" type="text" placeholder="업체이름을 입력하세요" name="clientName" id="clientName">
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
					<th>업체코드</th>
					<th>업체명</th>
				</tr>
				<c:forEach items="${List}" var="List">
				<tr onclick="selectWork('${List.client_code }','${List.clientName }')">
					<th onclick="selectWork('${List.client_code }','${List.clientName }')">${List.client_code }</th>
					<th onclick="selectWork('${List.client_code }','${List.clientName }')">${List.clientName }</th>
				</tr>
				</c:forEach>
			</table>
			
			
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
	 <script type="text/javascript">
	$(document).ready(function(){
	
		$(".btn-success").on("click", function(e){
	        e.preventDefault();
	        
	        let client_code = $(".search_area input[name='client_code']").val();
	        let clientName = $(".search_area input[name='clientName']").val();
	        
	        if(!client_code && !clientName ){
	            alert("검색 종류를 선택하세요.");
	            return false;
	        }
	        
	        
	        moveForm.find("input[name='client_code']").val(client_code);
	        moveForm.find("input[name='clientName']").val(clientName);
	        moveForm.submit();
	    });

	
	//부모창으로 데이터 넘기기
    function selectWork(a,b){ // 부모창으로 값 넘기기
		  
    	if(opener){
    		opener.document.getElementById("client_code").value = a
    		opener.document.getElementById("clientName").value = b
    		window.close();
    	}else{
    		alert("부모창이 없습니다.");
    	}

      }
	
	
	});//끝
	</script> 
</body>
</html>