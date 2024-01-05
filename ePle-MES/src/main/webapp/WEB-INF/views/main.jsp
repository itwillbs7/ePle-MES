<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<%@ include file="include/head.jsp"%>
<title>메인</title>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/right-side-bar.jsp"%>
	<%@ include file="include/left-side-bar.jsp"%>
	<div class="main-container">
		<div class="pd-ltr-20">
			<h1>Hello world!</h1>
			
			
			
			<P>The time on the server is ${serverTime}.</P>
			<%@ include file="include/github.jsp"%>
			<%@ include file="include/footer.jsp"%>
		</div>
	</div>
</body>
</html>
