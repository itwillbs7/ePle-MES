<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>품목 등록</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">품목 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/product/add" method="post">

                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <div class="form-group">
                            <label>품번</label> <input class="form-control" type="text" name="code" placeholder="품번 입력" required>
                        </div>
                        <div class="form-group">
                            <label>카테고리</label> <input class="form-control" type="text" name="category" placeholder="카테고리 입력" required>
                        </div>
                        <div class="form-group">
                            <label>품목명</label> <input class="form-control" type="text" name="name" placeholder="품목명 입력" required>
                        </div>
                        <div class="form-group">
                            <label>규격</label> <input class="form-control" type="text" name="size" placeholder="규격 입력" required>
                        </div>
                        <div class="form-group">
						    <label>단위</label>
						    <select class="form-control" name="unit" required>
						        <option value="" disabled selected>단위 선택</option>
						        <option value="EA">EA</option>
						    </select>
						</div>
                        <div class="form-group">
						    <label>입고 단가</label>
						    <div class="input-group">
						        <input class="form-control" type="text" name="inprice" placeholder="입고 단가 입력" required>
						        <div class="input-group-append">
						            <span class="input-group-text">원</span>
						        </div>
							</div>
						</div>
						<div class="form-group">
						    <label>출고 단가</label>
						    <div class="output-group">
						        <input class="form-control" type="text" name="outprice" placeholder="출고 단가 입력" required>
						        <div class="output-group-append">
						            <span class="output-group-text">원</span>
						        </div>
							</div>
						</div>
						<div class="form-group">
                            <label>등록자 사원코드</label> <input class="form-control" type="text" name="reg_emp" placeholder="등록자 사원코드 입력" required>
                        </div>
                        <div class="form-group">
                            <label>등록일</label>
                            <input class="form-control" type="text" name="reg_date" placeholder="등록일 입력" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>수정자 사원코드</label> <input class="form-control" type="text" name="update_emp" placeholder="수정자 사원코드 입력" required>
                        </div>
                        <div class="form-group">
                            <label>수정일</label>
                            <input class="form-control" type="text" name="update_date" placeholder="수정일 입력" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %>" readonly>
                        </div>
<!--                         <div class="form-group"> -->
<!-- 						    <label for="imageUpload">이미지 추가</label> -->
<!-- 						    <div class="custom-file"> -->
<!-- 						        <input type="file" class="custom-file-input" id="imageUpload" name="image" accept="image/*" required> -->
<!-- 						        <label class="custom-file-label" for="imageUpload" data-browse="찾아보기">이미지 파일을 선택하세요</label> -->
<!-- 						    </div> -->
<!-- 						</div> -->
						<div class="form-group">
						    <label>사용 여부</label>
						    <select class="form-control" name="active" required>
						        <option value="" disabled selected>사용여부 선택</option>
						        <option value="true">Y</option>
						        <option value="false">N</option>
						    </select>
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
				            <b>등록</b>
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
</body>
</html>