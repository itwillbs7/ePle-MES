<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거래처 등록</title>
    <!-- Kakao 지도 API 스크립트 추가 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_MAPS_API_KEY"></script>
    <!-- 다음 우편번호 서비스 스크립트 추가 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <%@ include file="../include/head.jsp"%>
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
                            <label>거래처 코드</label> <input class="form-control" type="text" name="code" placeholder="거래처 코드 입력" required>
                        </div>
                        <div class="form-group">
                            <label>거래처명</label> <input class="form-control" type="text" name="name" placeholder="거래처명 입력" required>
                        </div>
                        <div class="form-group">
                            <label>거래처 구분</label> <input class="form-control" type="text" name="type" placeholder="거래처 구분 입력" required>
                        </div>
                        <div class="form-group">
                            <label>업태</label> <input class="form-control" type="text" name="conditions" placeholder="업태 입력" required>
                        </div>
                        <div class="form-group">
                            <label>종목</label> <input class="form-control" type="text" name="items" placeholder="종목 입력" required>
                        </div>
                        <div class="form-group">
                            <label>대표자</label> <input class="form-control" type="text" name="ceo" placeholder="대표자 입력" required>
                        </div>
                        <div class="form-group">
                            <label>담당자</label> <input class="form-control" type="text" name="manager" placeholder="담당자 입력" required>
                        </div>
                        
                        <!-- 우편번호 검색 버튼 및 결과 표시 -->
                        <div class="form-group">
                            <label>우편번호</label>
                            <input type="text" id="sample6_postcode" name="postcode" class="form-control" placeholder="우편번호" readonly>
                            <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn btn-primary">
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" id="sample6_address" name="address" class="form-control" placeholder="주소" readonly>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" id="sample6_detailAddress" name="address2" class="form-control" placeholder="상세주소">
                        </div>
                        
                        <div class="form-group">
						    <label>전화번호</label> 
						    <input class="form-control" type="tel" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="예: 02-1234-5678">
						</div>
						<div class="form-group">
						    <label>휴대폰 번호</label> 
						    <input class="form-control" type="tel" name="phone" pattern="01[0-9]-[0-9]{3,4}-[0-9]{4}" placeholder="예: 010-1234-5678" required>
						</div>
                        <div class="form-group">
						    <label>팩스 번호</label> 
						    <input class="form-control" type="tel" name="fax" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="예: 02-1234-5678">
						</div>
                        <div class="form-group">
						    <label>이메일</label> 
						    <input class="form-control" type="email" name="email" placeholder="예: example@example.com" required>
						</div>
                        <div class="form-group">
						    <label>비고</label>
						    <textarea class="form-control" name="note" rows="2"></textarea>
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
    
    <!-- 다음 우편번호 서비스 스크립트 추가 -->
    <script>
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
    
</body>
</html>
