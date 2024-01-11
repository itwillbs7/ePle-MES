<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../include/head.jsp"%>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.login-box {
width: 120% !important;
}
</style>
    <title>발주 요청 취소</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="container-fluid login-box bg-white box-shadow border-radius-10">
            <button type="button" class="close" onclick="window.close();">×</button>
            <!-- 타이틀 -->
            <div class="login-title">
                <h2 class="text-center" style="color: #FF8C00;">발주 요청 취소</h2>
            </div>
            <!-- 폼 -->
            <form id="deleteForm" method="post">
                <!-- 삭제 리스트 목록 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <table class="table table-striped">
                                <tr>
                                    <th>발주코드</th>
                                    <th>품명</th>
                                    <th>요청량</th>
                                    <th>신청일자</th>
                                </tr>
                                <c:forEach items="${List}" var="vo">
                                    <tr>
                                        <th>${vo.code}</th>
                                        <th>${vo.name }</th>
                                        <th>${vo.amount }</th>
                                        <th>${vo.date }</th>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <hr>
                <br>
                <h6 class="text-center">해당 요청을 취소하시겠습니까?</h6>
                <br>
                
                <!-- 삭제 리스트 목록 -->

                <!-- 버튼 -->
                <div class="row">
                    <div class="col-sm-12 mb-3 justify-content-center btn-toolbar btn-group">
                        <button type="button" class="btn btn-secondary" onclick="window.close();">
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
    <%@ include file="../include/footer.jsp"%>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#deleteForm').submit(function(event) {
                event.preventDefault();

                 var warehouseCodes = []; 
                $('th:first-child').each(function() {
                    warehouseCodes.push($(this).text());
                });
                var data = {
                    codes: warehouseCodes.join(',')
                }; 

                $.ajax({
                    type : 'POST',
                    url : "${pageContext.request.contextPath}/material/askOrderDel",
                    data : data,
                    success : function(response) {
                    	alert("처리가 완료되었습니다.");
                        window.opener.location.reload(); 
                        window.close(); 
                    },
                    error : function(xhr, status, error) {
                    	alert("비정상적인 접근입니다.");
                		window.close();
                    }
                });
            });
        });
    </script>

</body>
</html>
