<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../include/head.jsp"%>
<title>공통코드 삭제</title>
<!-- 
	실행 방법
		- 테이블 페이지의 옵션에서 삭제클릭
		- 테이블 내에서 체크박스 클릭 후 상단의 삭제 클릭
		- 상세 정보에서 삭제 클릭
	
	taglib c 처리
	세션에서 부서 체크
	작성자 or 담당 부서가 아닌 경우 에러 메세지나 페이지 호출 및 닫기
	
	js & jquery 처리
	인덱스와 표에서 선택한 것이 아무것도 없는 경우 에러 메세지나 페이지 호출 및 닫기
	1개(표 옵션에서 인덱스로 들어옴) (우선 적용)
	여러 개(표에서 체크박스)
 -->
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">공통코드 삭제</h1>
			</div>
			<!-- 폼 -->
			<form method="post">
				<!-- 삭제 리스트 목록 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<ul class="list-group">
								<!-- 삭제 리스트 들어갈 공간 
								li class='list-group-item' -->
								
							</ul>
						</div>
					</div>
				</div>
				<!-- 삭제 리스트 목록 -->

				<!-- 버튼 -->
				<div class="row">
					<div
						class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
						<button type="button" class="btn btn-secondary"
							onclick="window.close();">
							<b>취소</b>
						</button>
						<button type="submit" class="btn btn-warning">
							<b>삭제</b>
						</button>
					</div>
				</div>
				<!-- 버튼 -->
			</form>
			<!-- 폼 -->
		</div>
	</div>
	<!-- 콘텐츠 끝 -->
	<%@ include file="../../include/footer.jsp"%>
	<script type="text/javascript">
		var listGroup = $(".list-group");
		var listHtml = "<li class='list-group-item'>"
		// get으로 불러온 인덱스가 있는 경우 인덱스 우선 진행

		// var del = <c:out value=el식/>
		// if(del != ""){get 방식}
		// else{체크박스}
		// var 제목 = opener.document.getElementById("tableTitle" + delList[i].value).innerText

		// 인덱스가 없는 경우 checkbox 리스트로 불러와서 진행!

		// 부모의 체크박스 목록 불러오기
		var delList = opener.document.getElementsByName('tableCheck');

		// 체크박스 checked 개수
		var delCheckedCount = 0;

		// 제목 저장
		var array = [];

		for (var i = 0; i < delList.length; i++) {
			if (delList[i].checked) { // == true
				// checked 개수 증가
				delCheckedCount++;
				// 부모에서 삭제하기 위해 체크한 리스트의 제목 불러오기
				array.push(opener.document.getElementById("tableTitle"
						+ delList[i].value).innerText);
			}
		}
		// 닫기 진행!
		if (delCheckedCount == 0)
			window.close();
		else {
			// alert(array[0]);
		}
	</script>
</body>
</html>