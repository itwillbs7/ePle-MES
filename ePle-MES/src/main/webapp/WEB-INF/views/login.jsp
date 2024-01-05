<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>로그인</title>
<%@ include file="include/head.jsp"%>
</head>

<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="/"> <img src="/resources/vendors/images/deskapp-logo.svg" alt="" />
				</a>
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">로그인</h2>
						</div>
						<form method="post">
							<div class="select-role">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn active"> <input type="radio" name="options" id="admin" />
										<div class="icon">
											<img src="/resources/vendors/images/briefcase.svg" class="svg" alt="" />
										</div> <span>일반</span>로그인
									</label> <label class="btn"> <input type="radio" name="options" id="user" />
										<div class="icon">
											<img src="/resources/vendors/images/person.svg" class="svg" alt="" />
										</div> <span>바코드</span>로그인
									</label>
								</div>
							</div>
							<div class="input-group custom">
								<input type="text" class="form-control form-control-lg" placeholder="사번" />
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" class="form-control form-control-lg" placeholder="비밀번호" />
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1" /> <label class="custom-control-label" for="customCheck1">Remember</label>
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password">
										<a href="forgot-password.html">비밀번호 찾기</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<input class="btn btn-primary btn-lg btn-block" type="submit" value="로그인">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>