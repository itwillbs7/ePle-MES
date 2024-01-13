<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>거래처 수정</title>
</head>
<body>
	<!-- 콘텐츠 시작 -->
	<div class="modal-content">
		<div class="login-box bg-white box-shadow border-radius-10">
			<!-- 타이틀 -->
			<div class="login-title">
				<h1 class="text-center text-primary">거래처 수정</h1>
			</div>
			<!-- 폼 -->
			<form action="/client/update" method="post">

				<!-- 품번 -->
                <input type="hidden" name="code" value="${cvo.code}">

				<!-- 입력 구간 -->
				<div class="row">
					<div class="col-sm-12 mb-3">
						<!-- examples -->
						<div class="form-group">
							<label>거래처명</label> 
							<input class="form-control" type="text" name="name" value="${cvo.name}">
						</div>
						<div class="form-group">
							<label>거래처 구분</label> 
							<input class="form-control" type="text" name="type" value="${cvo.type}">
						</div>
						<div class="form-group">
							<label>업태</label> 
							<input class="form-control" type="text" name="conditions" value="${cvo.conditions}">
						</div>
						<div class="form-group">
							<label>종목</label> 
							<input class="form-control" type="text" name="items" value="${cvo.items}">
						</div>
						<div class="form-group">
							<label>대표자</label> 
							<input class="form-control" type="text" name="ceo" value="${cvo.ceo}">
						</div>
						<div class="form-group">
							<label>담당자</label> 
							<input class="form-control" type="text" name="manager" value="${cvo.manager}">
						</div>
						<div class="form-group">
							<label>주소</label> 
							<input class="form-control" type="text" name="address" value="${cvo.address}">
						</div>
						<div class="form-group">
							<label>상세주소</label> 
							<input class="form-control" type="text" name="address2" value="${cvo.address2}">
						</div>
						<div class="form-group">
							<label>전화번호</label> 
							<input class="form-control" type="text" name="tel" value="${cvo.tel}">
						</div>
						<div class="form-group">
							<label>휴대폰 번호</label> 
							<input class="form-control" type="text" name="phone" value="${cvo.phone}">
						</div>
						<div class="form-group">
							<label>팩스 번호</label> 
							<input class="form-control" type="text" name="fax" value="${cvo.fax}">
						</div>
						<div class="form-group">
							<label>이메일</label> 
							<input class="form-control" type="text" name="email" value="${cvo.email}">
						</div>
						<div class="form-group">
						    <label>비고</label>
						    <textarea class="form-control" name="note" rows="2">${cvo.note}</textarea>
						</div>
						<div class="row">
						  <div class="col-sm-12 mb-3">
						    <div class="form-group">
						      <label>사용 여부</label>
						      <select class="form-control" name="active" required>
						        <option value="" disabled selected>사용여부 선택</option>
						        <option value="true" ${cvo.active == 'true' ? 'selected' : ''}>Y</option>
						        <option value="false" ${cvo.active == 'false' ? 'selected' : ''}>N</option>
						      </select>
						    </div>
						  </div>
						</div>
						<!-- examples end -->
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
	<%@ include file="../include/footer.jsp"%>
	
    <script>
       function onSubmitForm() {
           // 폼을 서버로 제출한 후 팝업 창 닫기

           // 팝업 창 닫기
           window.close();
           return false; // 폼 제출 막기
       }
    </script>
	
</body>
</html>