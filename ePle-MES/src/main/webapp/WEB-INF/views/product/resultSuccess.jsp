<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성공</title>
</head>
<body>
<script type="text/javascript">
    // 성공 처리 후 팝업 창 크기 조절
    var newWidth = 483;  // 적절한 폭 값으로 변경
    var newHeight = 225;  // 적절한 높이 값으로 변경
    window.resizeTo(newWidth, newHeight);

    alert("처리가 완료되었습니다.");
    window.opener.location.reload();
    window.close();
</script>
</body>
</html>