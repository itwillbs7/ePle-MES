<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
			<form action="" method="post" id="addForm">
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
						<button type="button" class="btn btn-success" onclick="finished()">
							<b>검색</b>
						</button>
					</div>
				</div>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
			
			<table class="table table-striped">
				<tr>
					<th>업체코드</th>
					<th>업체명</th>
				</tr>
				<c:forEach items="${List}" var="List">
				<tr>
					<th>${List.client_code }</th>
					<th>${List.clientName }</th>
				</tr>
				</c:forEach>
			</table>
			
			
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<%@ include file="../include/footer.jsp"%>
	
	 <script type="text/javascript">
	$(document).ready(function(){
	
		
// 검색을 누르면 밑에 정보 띄우기(ajax!)
// 계속 시도하기
	function finished(){
		
		$.ajax({
			url:'/request/add',
			type:'POST',
			success:function(data){
				alert('등록성공');
				window.close();
			},
			error: function(){
				alert('다시 입력하세요');
				location.reload();
			}
			
		});
	
	}
	
	
	});//끝
	</script> 
</body>
</html>