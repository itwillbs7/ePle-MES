<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../include/head.jsp"%>
    <title>품목 삭제</title>
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
                <h1 class="text-center text-primary">품목 삭제</h1>
                <h4 class="text-center">삭제 개수 : <%= request.getAttribute("delCheckedCount") %></h4>
            </div>
            <!-- 폼 -->
            <form method="post">
                <!-- 삭제 리스트 목록 -->
				<div class="row">
				    <div class="col-sm-12 mb-3">
				        <div class="form-group">
				            <table class="table">
				                <thead>
				                    <tr>
				                        <th>품목 코드</th>
				                        <th>품목 이름</th>
				                    </tr>
				                </thead>
				                <tbody>
				                    <!-- 삭제 리스트 들어갈 공간 -->
				                    <c:forEach var="client" items="${cvo}">
									    <tr>
									        <td>${client.code}</td>
									        <td>${client.name}</td>
									    </tr>
									</c:forEach>
				                </tbody>
				            </table>
				        </div>
				    </div>
				</div>
                <!-- 삭제 리스트 목록 -->

                <!-- 버튼 -->
                <div class="row">
                    <div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
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
