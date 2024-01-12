<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>공통코드 추가</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 추가</h1>
			</div>
			<!-- 폼 -->
			<form role="form" name="commonForm">
				<!-- 입력 구간 -->
					<input type="hidden" value="1" name="active">
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>그룹ID</label><br>
							
							<select class="custom-select col-7" name="group_id" onchange="onchangeSelect(this);">
								<option value="null">선택하세요</option>
								<c:forEach items="${groupIdList }" var="val">
								<option>${val }</option>
								</c:forEach>
							</select>
							
							<input class="form-control groupId-input col-7" style="display: inline-block;" placeholder="입력하세요" disabled="disabled" hidden="">
							
							<button type="button" class="btn btn-success" id="aabb">
								<b>직접 입력하기</b>
							</button>
							
						</div>
						<div class="form-group">
							<label>그룹명</label> 
							<input class="form-control" id="auto-group-name" name="group_name" readonly="readonly">
							<input class="form-control" id="passive-group-name" hidden="" disabled="disabled" placeholder="입력하세요">
						</div>
						<div class="form-group">
							<label>코드ID</label> <input class="form-control" placeholder="코드ID" name="code_id">
						</div>
						<div class="form-group">
							<label>코드명</label> <input class="form-control" placeholder="코드명" name="code_name">
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
						<button type="button" class="btn btn-success btn-for-submit">
							<b>등록</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	
	<script type="text/javascript">
	
	function onchangeSelect(selectElement) {
		
		var group_id = selectElement.value;
		console.log(group_id);
		
	}
	
	$(document).ready(function() {
		
		window.resizeTo(outerWidth - innerWidth + 500, outerHeight - innerHeight + $(".login-box").outerHeight());
		/* outerWidth : 바깥 둘레 포함 가로 크기
		innerWidth : 내부 가로 크기
		500 -> 내부 가로 수치
		outerHeight : 바깥 둘레 포함 세로 크기
		innerHeight : 내부 세로 크기
	
		$(".login-box").outerHeight() : 모달창 박스 크기 추적
		+11은 자유(스크롤바 없애려고 늘임) -> 수치 조정 가능 */
		
		var formObj = $('form[role="form"]');
		var isOk = false; // 중복검사용
	        
		$(".btn-for-submit").click(function(){
			// 입력 값
	        var group_id = document.forms["commonForm"]["group_id"].value;
	        var group_name = document.forms["commonForm"]["group_name"].value;
	        var code_id = document.forms["commonForm"]["code_id"].value;
	        var code_name = document.forms["commonForm"]["code_name"].value;
	        console.log(group_id+", "+group_name+", "+code_id+", "+code_name);
		        // 입력값이 비어있다면 false
		        if (group_id === "" || group_id === "null" || group_name === "" || code_id === "" || code_name === "") {
		            alert("모든 항목을 입력해주세요.");
		            return false;
		        }
		        
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
		        
		        if(isOk) {
				formObj.attr("action","/system/common/add");
				formObj.attr("method","POST");
				formObj.submit(); 
		        }
			}); // click  
		
	}); // jquery
	
    // 요소에 대한 참조 가져오기
    var selectElement = document.querySelector('select[name="group_id"]');
    var inputElement1 = document.querySelector('.groupId-input');
    var inputElement2 = document.querySelector('#auto-group-name');
    var inputElement3 = document.querySelector('#passive-group-name');
    var buttonElement = document.getElementById('aabb');
    var autoGroupNameInput = document.getElementById('auto-group-name');
    var passiveGroupNameInput = document.getElementById('passive-group-name');
    var groupIdArr = '${groupIdList}';
    var groupNameArr = '${groupNameList}';
    groupIdArr = groupIdArr.substring(1, groupIdArr.length-1);
    groupNameArr = groupNameArr.substring(1, groupNameArr.length-1);
    var groupIdList = groupIdArr.split(',');
    var groupNameList = groupNameArr.split(',');
    
    for(var i=0; i<groupIdList.length; i++) {
		groupIdList[i] = groupIdList[i].trim();
		groupNameList[i] = groupNameList[i].trim();
    }

    // 버튼에 클릭 이벤트 리스너 추가
    buttonElement.addEventListener('click', function () {
    	var selectElement = document.querySelector('select[name="group_id"]');
        // 입력 요소 표시
        inputElement1.removeAttribute('hidden');
        inputElement3.removeAttribute('hidden');
        // 입력 요소 활성화
        inputElement1.removeAttribute('disabled');
        inputElement3.removeAttribute('disabled');
        // 입력 요소 name 부여
        inputElement1.setAttribute('name', 'group_id');
        inputElement3.setAttribute('name', 'group_name');
        // 선택 요소 숨김
        selectElement.setAttribute('hidden', 'hidden');
        inputElement2.setAttribute('hidden', 'hidden');
        // 선택 요소 비활성화
        selectElement.setAttribute('disabled', 'disabled');
        inputElement2.setAttribute('disabled', 'disabled');
        // 요소 name 제거
        selectElement.removeAttribute('name');
        inputElement2.removeAttribute('name');

    });
        
    
   	var selectElement = document.querySelector('select[name="group_id"]');
    // 그룹ID select 요소의 변경 이벤트 리스너 추가
    selectElement.addEventListener('change', function () {
    	var selectedIndex = selectElement.selectedIndex;
    	console.log(groupNameList[selectedIndex-1]);
        if (selectedIndex !== 0) { // 선택된 값이 "선택하세요"가 아닌 경우
        	inputElement2.value = groupNameList[selectedIndex - 1];
            autoGroupNameInput.removeAttribute('hidden');
            passiveGroupNameInput.setAttribute('hidden', 'hidden');
        } else {
            autoGroupNameInput.setAttribute('hidden', 'hidden');
            passiveGroupNameInput.removeAttribute('hidden');
        }
    });
    
 	// 확인(submit) 클릭 시 유효성 검사 후 submit
		
		
	</script>
	
	<!-- 콘텐츠 끝> -->
	<%@ include file="../../include/footer.jsp"%>
</body>
</html>