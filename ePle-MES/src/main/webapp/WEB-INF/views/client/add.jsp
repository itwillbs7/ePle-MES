<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../include/head.jsp"%>
<title>거래처 등록</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">거래처 등록</h1>
            </div>
            <!-- 폼 -->
            <form action="/client/add" method="post">

                <!-- 입력 구간 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <!-- examples -->
                        <div class="form-group">
                            <label>거래처 코드</label> <input class="form-control" type="text" name="code" placeholder="거래처 코드 입력">
                        </div>
                        <div class="form-group">
                            <label>거래처명</label> <input class="form-control" type="text" name="name" placeholder="거래처명 입력">
                        </div>
                        <div class="form-group">
                            <label>거래처 구분</label> <input class="form-control" type="text" name="type" placeholder="거래처 구분 입력">
                        </div>
                        <div class="form-group">
                            <label>업태</label> <input class="form-control" type="text" name="condition" placeholder="업태 입력">
                        </div>
                        <div class="form-group">
                            <label>종목</label> <input class="form-control" type="text" name="items" placeholder="업태 입력">
                        </div>
                        <div class="form-group">
                            <label>대표자</label> <input class="form-control" type="text" name="ceo" placeholder="업태 입력">
                        </div>
                        <div class="form-group">
                            <label>담당자</label> <input class="form-control" type="text" name="manager" placeholder="업태 입력">
                        </div>
                        <div class="form-group">
                            <label>주소</label> <input class="form-control" type="text" name="address">
                        </div>
                        <div class="form-group">
                            <label>상세 주소</label> <input class="form-control" type="text" name="address2">
                        </div>
                        <div class="form-group">
						    <label>전화번호</label> 
						    <input class="form-control" type="tel" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="예: 02-1234-5678">
						</div>
						<div class="form-group">
						    <label>휴대폰 번호</label> 
						    <input class="form-control" type="tel" name="phone" pattern="01[0-9]-[0-9]{3,4}-[0-9]{4}" placeholder="예: 010-1234-5678">
						</div>
                        <div class="form-group">
						    <label>팩스 번호</label> 
						    <input class="form-control" type="tel" name="fax" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="예: 02-1234-5678">
						</div>
                        <div class="form-group">
						    <label>이메일</label> 
						    <input class="form-control" type="email" name="email" placeholder="예: example@example.com">
						</div>
                        <div class="form-group">
						    <label>비고</label>
						    <textarea class="form-control" name="note" rows="4"></textarea>
						</div>
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
    <!-- 콘텐츠 끝 -->

    <%@ include file="../include/footer.jsp"%>
</body>
</html>
