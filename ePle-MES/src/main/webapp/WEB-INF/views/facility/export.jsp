<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>저장/인쇄</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">테이블 내보내기</h1>
			</div>

			<!-- 카테고리 -->
			<div class="row">
				<div class="col-sm-12 mb-3">
					<div class="form-group">
						<label><b>카테고리</b></label> <select class="custom-select2 form-control" name="category" style="width: 100%; height: 38px">
							<!-- 공통 코드로 받아오기 -->
							<optgroup label="클립보드">
								<option value="copy">복사</option>
							</optgroup>
							<optgroup label="저장">
								<option value="pdf">PDF</option>
								<option value="csv">CSV</option>
							</optgroup>
							<option value="print">인쇄</option>
						</select>
					</div>
				</div>
			</div>
			
			<!-- 버튼 -->
			<div class="row">
				<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
					<button type="button" class="btn btn-secondary" onclick="window.close();">
						<b>닫기</b>
					</button>
					<button type="submit" class="btn btn-success">
						<b>저장</b>
					</button>
				</div>
			</div>
			<!-- 버튼 -->
		</div>
	</div>
	
	<!-- 콘텐츠 끝 -->
	<%@ include file="../include/footer.jsp"%>
	<script type="text/javascript">
		// 부모의 체크박스 목록 불러오기
		var delList = opener.document.getElementsByName('tableCheck');

		// 제목 저장
		var array = [];

		for (var i = 0; i < delList.length; i++) {
			if (delList[i].checked) { // == true
				// 부모에서 체크한 리스트의 제목 불러오기
				array.push(delList[i].value);
			}
		}
		
		if(array.size == 0){
			// 상세 검색 불러오기
			// 비동기 방식으로 전체 리스트 불러오기
			
		}
	</script>
</body>
</html>