<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>사용자(사원) 추가</title>
<!-- Kakao 지도 API 스크립트 추가 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_MAPS_API_KEY"></script>
<!-- 다음 우편번호 서비스 스크립트 추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">사용자(사원) 추가</h1>
			</div>
			<!-- 폼 -->
			<form role="form" method="post" name="userForm">
				<!-- 입력 구간 -->
					<input type="hidden" value="1" name="active">
					<input type="hidden" value="DEP" name="dep_group">
					<input type="hidden" value="POS" name="pos_group">
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>이름</label> <input class="form-control" type="text" placeholder="이름" name="name">
						</div>
						<div class="form-group">
							<label>아이디</label> <input class="form-control" type="text" placeholder="아이디" name="id">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input class="form-control" type="password" placeholder="비밀번호" name="pw">
						</div>
						<div class="form-group">
							<label>부서</label><br>
							<select class="custom-select col-sm-12 mb-3" name="dep">
									<option value=null>부서를 선택하세요</option>
								<c:forEach items="${DepList }" var="dep">
									<option value="${dep.code_name },${dep.code_id}">${dep.code_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>직책</label><br>
							<select class="custom-select col-sm-12 mb-3" name="pos">
									<option value=null>직책을 선택하세요</option>
								<c:forEach items="${PosList }" var="pos">
									<option value="${pos.code_name },${pos.code_id}">${pos.code_name }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="date">입사일</label> 
							<input class="form-control " name="hiredate" type="date" id="date"
							placeholder="클릭 시 달력이 뜹니다" autocomplete="off" required="required">
						</div>
						<div class="form-group">
							<label>휴대전화번호</label> <input class="form-control" placeholder="'-'를 제외한 11자리 숫자" name="phone">
						</div>
						<div class="form-group">
							<label>이메일</label> <input class="form-control" placeholder="이메일" name="email">
						</div>
                        <!-- 우편번호 검색 버튼 및 결과 표시 -->
                        <div class="form-group">
                            <label>우편번호</label>
                            <input type="text" id="sample6_postcode" name="postcode" class="form-control" placeholder="우편번호" readonly>
                            <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="btn btn-primary">
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" id="sample6_address" name="address1" class="form-control" placeholder="주소" readonly>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" id="sample6_detailAddress" name="address2" class="form-control" placeholder="상세주소">
                        </div>
						<div class="form-group">
							<label>권한</label><br>
							<select class="custom-select col-sm-12 mb-3" name="auth">
								<option selected=null>권한을 선택하세요</option>
								<option value="1">사원</option>
								<option value="2">매니저</option>
								<option value="3">관리자</option>
							</select>
						</div>
				<!-- 입력 구간 -->
		
				<!-- 버튼 -->
				<div class="row">
					<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary" onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="button" class="btn btn-success">
							<b>추가</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	
	<script type="text/javascript">
	
        
		$(document).ready(function() {
			
			var formObj = $('form[role="form"]');
			var isOk = false; // 중복검사용
 	        
 	        // 확인(submit) 클릭 시 유효성 검사 후 submit
	 		$(".btn-success").click(function(){
				// 입력 값
		        var name = document.forms["userForm"]["name"].value;
		        var id = document.forms["userForm"]["id"].value;
		        var pw = document.forms["userForm"]["pw"].value;
		        var dep = document.forms["userForm"]["dep"].value;
		        var pos = document.forms["userForm"]["pos"].value;
		        var hiredate = document.forms["userForm"]["hiredate"].value;
		        var phone = document.forms["userForm"]["phone"].value;
		        var email = document.forms["userForm"]["email"].value;
		        var postcode = document.forms["userForm"]["postcode"].value;
		        var address1 = document.forms["userForm"]["address1"].value;
		        var auth = document.forms["userForm"]["auth"].value;
	 	        // 입력값이 비어있다면 false
	 	        if (name === "" || id === "" || pw === "" || dep === "null" || pos === "null" || 
	 	        		hiredate === "" || phone === "" || email === "" || postcode === "" || address1 === "" || auth === "null") {
	 	            alert("모든 항목을 입력해주세요.");
	 	            return false;
	 	        }
	 	        
	 	        $.ajax({
	 	        	
	 	        	type : "GET", 
	 	        	url : "/systemAjax/user", 
	 	        	dataType : "json", 
	 	        	data : {
	 	        		id : id, 
	 	        		phone : phone, 
	 	        		email : email
	 	        	}, 
	 	        	contentType : "application/json; charset=UTF-8", 
	 	        	success : function(data) {
	 	        		console.log(data);
	 	        		if(data.idResult > 0) {
	 	        			alert('아이디 중복입니다');
	 	        			return false;
	 	        		}
	 	        		if(data.emailResult > 0) {
	 	        			alert('이메일 중복입니다');
	 	        			return false;
	 	        		}
	 	        		if(data.phoneResult > 0) {
	 	        			alert('휴대전화번호 중복입니다');
	 	        			return false;
	 	        		}
	 	        		
	 	        		isOk = true;
			 			
	 	        	}, 
	 	        	error : function() {
	 	        		alert('서버 오류 발생! 다시 시도해주세요');	 	        	
	 	        	}
	 	        	
	 	        }); // ajax
	 	        
	 	        if(phone.length != 11) {
	 	        	alert('휴대전화번호는 11자리로 입력해주세요');
	 	        }
	 	        
	 	        if(isOk) {
	 			formObj.attr("action","/system/user/add");
	 			formObj.attr("method","POST");
	 			formObj.submit(); 
	 	        }
	 		}); // click
			
		}); // jquery
		
	    <!-- 다음 우편번호 서비스 스크립트 추가 -->
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.address;
                    var extraAddr = '';

                    if(data.userSelectedType === 'R'){
                        if(data.buildingName !== ''){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        addr += extraAddr !== '' ? ' (' + extraAddr + ')' : '';
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById('sample6_address').value = addr;
                    document.getElementById('sample6_detailAddress').focus();
                }
            }).open();
        }
		
	</script>
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>