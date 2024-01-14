<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../include/head.jsp" %>
    <title>품목 수정</title>
    
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">품목 수정</h1>
            </div>
            <!-- 폼 -->
            <form action="/product/update" method="post">
            
                <!-- 품목 코드 -->
                <input type="hidden" name="code" value="${mvo.code}">
                
                <!-- 원자재 or 완제품 품번 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>원자재 or 완제품 품번</label>
                            <input class="form-control" type="text" name="group_id" value="${mvo.group_id}">
                        </div>
                    </div>
                </div>
                
                <div class="form-group">
				    <label>소분류</label>
				    <select class="form-control" id="categoryDropdown" name="code_id" required>
				        <option value="" disabled selected>소분류 선택</option>
				        <option value="001" ${mvo.code_id == '001' ? 'selected' : ''}>원자재 / 001</option>
				        <option value="002" ${mvo.code_id == '002' ? 'selected' : ''}>반제품 / 002</option>
				        <option value="003" ${mvo.code_id == '003' ? 'selected' : ''}>완제품 / 003</option>
				    </select>
				</div>
				
                <!-- 원자재 or 완제품 품명 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>원자재 or 완제품 품명</label>
                            <input class="form-control" type="text" name="name" value="${mvo.name}">
                        </div>
                    </div>
                </div>
                
                <!-- 규격 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>규격</label>
                            <input class="form-control" type="text" name="size" value="${mvo.size}">
                        </div>
                    </div>
                </div>
                
                <!-- 단위 -->
				<div class="row">
				  <div class="col-sm-12 mb-3">
				    <div class="form-group">
				      <label>단위</label>
				      <select class="form-control" name="unit" required>
				        <option value="" disabled>단위 선택</option>
				        <option value="EA" ${mvo.unit == 'EA' ? 'selected' : ''}>EA</option>
				        </select>
				    </div>
				  </div>
				</div>
				
                <!-- 입고단가 (원) -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>입고단가 (원)</label>
                            <input class="form-control" type="text" name="inprice" value="${mvo.inprice}">
                        </div>
                    </div>
                </div>
                
                <!-- 출고단가 (원) -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>출고단가 (원)</label>
                            <input class="form-control" type="text" name="outprice" value="${mvo.outprice}">
                        </div>
                    </div>
                </div>
                
                <!-- 등록자 사원코드 -->
                <input class="form-control" type="hidden" name="reg_emp" value="${mvo.reg_emp}" readonly>
                
                <!-- 등록일 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>등록일</label>
                            <input class="form-control" type="text" name="reg_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly>
                        </div>
                    </div>
                </div>
                
                <!-- 수정자 사원코드 -->
                <input class="form-control" type="hidden" name="update_emp" value="${mvo.update_emp}">
                
                <!-- 수정일 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <label>수정일</label>
                            <input class="form-control" type="text" name="update_date" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" readonly>
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
				        <option value="true" ${mvo.active == 'true' ? 'selected' : ''}>Y</option>
				        <option value="false" ${mvo.active == 'false' ? 'selected' : ''}>N</option>
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
