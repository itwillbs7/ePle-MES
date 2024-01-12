<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>공통코드 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 수정</h1>
			</div>
			<!-- 폼 -->
			<form role="form" name="commonForm">
				<!-- 입력 구간 -->
					<input type="hidden" value="1" name="active">
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>그룹ID</label><br>
							<input class="form-control groupId-input col-12" value="${cvo.group_id }" placeholder="입력하세요" required="required">
						</div>
						<div class="form-group">
							<label>그룹명</label> 
							<input class="form-control" id="passive-group-name" value="${cvo.group_name }" placeholder="입력하세요" required="required">
						</div>
						<div class="form-group">
							<label>코드ID</label> <input class="form-control" value="${cvo.code_id }" name="code_id" placeholder="입력하세요" required="required">
						</div>
						<div class="form-group">
							<label>코드명</label> <input class="form-control" value="${cvo.code_name }" name="code_name" placeholder="입력하세요" required="required">
						</div>
						<div class="form-group">
							<label>사용여부</label><br>
							<c:if test="${cvo.active==1 }">
								<input type="checkbox" checked="checked" class="switch-btn" data-color="#26bf36" data-size="large" name="activeCheckbox">
							</c:if>
							<c:if test="${cvo.active==0 }">
								<input type="checkbox" class="switch-btn" data-color="#26bf36" data-size="large" name="activeCheckbox">
							</c:if>
						</div>
					</div>
				</div>
				<!-- 입력 구간 -->
		
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-success">
							<b>수정</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝> -->
	<script type="text/javascript">
	
	$(document).ready(function() {
		
		$.ajax({
        	
        	type : "GET", 
        	url : "/systemAjax/checkDuplicateCommon", 
        	dataType : "json", 
        	data : {
        		group_id : group_id, 
        		group_name : group_name, 
        		code_id : code_id, 
        		code_name : code_name
        	}, 
        	contentType : "application/json; charset=UTF-8", 
        	success : function(data) {
        		isOk = true; 
        		
        		if(data==1) {
        			alert('중복 데이터가 존재합니다');
        			isOk = false;
        		}
        		
        		
 			
        	}, 
        	error : function() {
        		alert('서버 오류 발생! 다시 시도해주세요');	 	        	
        	}
        	
        }); // ajax
		
		window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight());
		/* outerWidth : 바깥 둘레 포함 가로 크기
		innerWidth : 내부 가로 크기
		500 -> 내부 가로 수치
		outerHeight : 바깥 둘레 포함 세로 크기
		innerHeight : 내부 세로 크기
	
		$(".login-box").outerHeight() : 모달창 박스 크기 추적
		+11은 자유(스크롤바 없애려고 늘임) -> 수치 조정 가능 */
		
	}); // jquery
    
	</script>
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>