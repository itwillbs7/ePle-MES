<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ include file="../include/head.jsp"%>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <title>창고 삭제</title>
</head>
<body>
    <!-- 콘텐츠 시작 -->
    <div class="modal-content">
        <div class="login-box bg-white box-shadow border-radius-10">
            <button type="button" class="close" onclick="window.close();">×</button>
            <!-- 타이틀 -->
            <div class="login-title">
                <h1 class="text-center text-primary">창고 삭제</h1>
            </div>
            <!-- 폼 -->
            <form id="deleteForm" method="post">
                <!-- 삭제 리스트 목록 -->
                <div class="row">
                    <div class="col-sm-12 mb-3">
                        <div class="form-group">
                            <table class="table table-striped">
                                <tr>
                                    <th>창고코드</th>
                                    <th>구분</th>
                                    <th>창고명</th>
                                    <th>담당자</th>
                                </tr>
                                <c:forEach items="${delInfo}" var="vo">
                                    <tr>
                                        <th>${vo.wh_code}</th>
                                        <th>${vo.group_id }</th>
                                        <th>${vo.group_name }</th>
                                        <th>${vo.name }</th>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
                <h4 class="text-center text-primary">정말로 삭제..?</h4>
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
                    url : "${pageContext.request.contextPath}/warehouse/delete",
                    data : data,
                    success : function(response) {
                        window.opener.location.reload(); 
                        window.close(); 
                    },
                    error : function(xhr, status, error) {
						
                    }
                });
            });
        });
    </script>

</body>
</html>
