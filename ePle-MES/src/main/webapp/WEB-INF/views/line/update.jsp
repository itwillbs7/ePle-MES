<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../include/head.jsp" %>
    <title>라인 수정</title>
    
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">라인 수정</h1>
            </div>
            <!-- 폼 -->
            <form action="/line/update" method="post">
            
                <!-- 품번 -->
                <input type="hidden" name="code" value="${lvo.code}">
                
                <!-- 카테고리 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>라인 코드</label>
                            <input class="form-control" type="text" name="code" value="${lvo.code}">
                        </div>
                    </div>
                </div>
                
                <!-- 라인명 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>라인명</label>
                            <input class="form-control" type="text" name="name" value="${lvo.name}">
                        </div>
                    </div>
                </div>
                
                <!-- 공정 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>공정</label>
                            <input class="form-control" type="text" name="process" value="${lvo.process}">
                        </div>
                    </div>
                </div>
                
                <!-- 작업장 -->
				<div class="row">
				  <div class="col-sm-12 mb-3">
				    <div class="form-group">
				      <label>작업장</label>
				      <select class="form-control" name="place" required>
				        <option value="" disabled>작업장 선택</option>
				        <option value="firstPlace" ${lvo.place == '1작업장' ? 'selected' : ''}>1작업장</option>
				        <option value="SecondPlace" ${lvo.place == '2작업장' ? 'selected' : ''}>2작업장</option>
				        <option value="thirdPlace" ${lvo.place == '3작업장' ? 'selected' : ''}>3작업장</option>
				        <option value="fourthPlace" ${lvo.place == '4작업장' ? 'selected' : ''}>4작업장</option>
				        </select>
				    </div>
				  </div>
				</div>
				
				<!-- 설비상태 -->
				<div class="row">
				  <div class="col-sm-12 mb-3">
				    <div class="form-group">
				      <label>설비상태</label>
				      <select class="form-control" name="status" required>
				        <option value="" disabled>설비상태 선택</option>
				        <option value="true" ${lvo.active == 'true' ? 'selected' : ''}>Y</option>
				        <option value="false" ${lvo.active == 'false' ? 'selected' : ''}>N</option>
				        </select>
				    </div>
				  </div>
				</div>
				
				<!-- 비고 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>비고</label>
                            <input class="form-control" type="text" name="note" value="${lvo.note}">
                        </div>
                    </div>
                </div>

				<!-- 사용 여부 -->
				<div class="row">
				  <div class="col-sm-12 mb-3">
				    <div class="form-group">
				      <label>사용 여부</label>
				      <select class="form-control" name="active" required>
				        <option value="" disabled selected>사용여부 선택</option>
				        <option value="true" ${lvo.active == 'true' ? 'selected' : ''}>Y</option>
				        <option value="false" ${lvo.active == 'false' ? 'selected' : ''}>N</option>
				      </select>
				    </div>
				  </div>
				</div>
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
    
    <!-- 콘텐츠 끝 -->
    <%@ include file="../include/footer.jsp" %>

</body>
</html>
