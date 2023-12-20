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
	<div class="invoice-wrap">
		<div class="invoice-box">
			<div class="pull-right">
				<button type="button" class="close" onclick="window.close();">
					<span>×</span>
				</button>
			</div>
			<div class="invoice-header">
				<div class="logo text-center">
					<img src="vendors/images/deskapp-logo.png" alt="">
				</div>
			</div>
			<!-- 타이틀 -->
			<h1 class="text-center text-primary">내보내기</h1>
			<!-- 카테고리 -->
			<div class="row">
				<div class="col-sm-12 mb-3">
					<div class="form-group">
						<label><h5>카테고리</h5></label>
						<!-- 버튼 -->
						<div class="row">
							<div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
								<button type="button" class="btn btn-secondary btn-lg">
									<b>복사</b>
								</button>
								<button type="button" class="btn btn-secondary btn-lg">
									<b>PDF</b>
								</button>
								<button type="button" class="btn btn-secondary btn-lg">
									<b>CSV</b>
								</button>
								<button type="button" class="btn btn-secondary btn-lg">
									<b>인쇄</b>
								</button>
							</div>
						</div>
						<!-- 버튼 -->
					</div>
				</div>
			</div>
		</div>
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

		if (array.size == 0) {
			// 상세 검색 불러오기
			// 비동기 방식으로 전체 리스트 불러오기

		}
	</script>
</body>
</html>