<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>쌉방 SSAPBANG</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../css/scrolling-nav.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function modify() {
	if(document.getElementById("username").value == "") {
		alert("이름 입력!!!");
		return;
	} else if(document.getElementById("address").value == "") {
		alert("주소 입력!!!");
		return;
	} else if(document.getElementById("tel").value == "") {
		alert("전화번호 입력!!!");
		return;
	} else if(document.getElementById("password").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("modify-form").action = "${root}/user";
		document.getElementById("modify-form").submit();
	}
}

</script>
<style type="text/css">
.search-area {
	margin: 20px;
}

.search-area button {
	height: calc(1.5em + 1rem + 2px);
	padding: .5rem 1rem;
	font-size: 1.25rem;
	line-height: 1.5;
	border-radius: .3rem;
	vertical-align: top;
	width: 20%;
	max-width: 70px;
	margin: 0 auto 0 0;
}

#logoutArea p {
	display: inline;
	color: white;
}

#navbarResponsive div {
	margin: 0 0 0 auto;
}
</style>
</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="../index.jsp">SSAPBANG</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				</ul>
				<c:if test="${userinfo == null}">
					<div id="loginArea">
						<button id="login" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#loginModal">로그인</button>
					</div>
				</c:if>
				<c:if test="${userinfo != null}">
					<div id="logoutArea">
						<button id="mypage" type="button" class="btn btn-info">마이페이지</button>
						<button id="logout" type="button" class="btn btn-secondary">로그아웃</button>
					</div>
				</c:if>
			</div>
		</div>
	</nav>

	<section id="about">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<p>${msg1}</p>
						<div class="card-header">회원 정보 수정</div>
						<div class="card-body">

							<form id="modify-form" class="form-horizontal" method="post" action="">
							<input type="hidden" name="act" id="act" value="modify">
							<input type="hidden" name="userid" id="userid" value="${userinfo.userid}">
							<input type="hidden" name="userpwd" id="userpwd" value="${userinfo.userpwd}">
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">Your Name</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-user fa" aria-hidden="true"></i></span>
											<h3>${userinfo.username}</h3>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">Your Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-envelope fa" aria-hidden="true"></i></span>
											<h3>${userinfo.email}</h3>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="username" class="cols-sm-2 control-label">Username</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-users fa" aria-hidden="true"></i></span> 
											<input type="text" class="form-control" name="username" id="username" placeholder="Enter your Username" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="address" class="cols-sm-2 control-label">Address</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-users fa" aria-hidden="true"></i></span> 
											<input type="text" class="form-control" name="address" id="address" placeholder="Enter your Address" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="tel" class="cols-sm-2 control-label">Email</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-users fa" aria-hidden="true"></i></span> 
											<input type="text" class="form-control" name="email" id="email" placeholder="Enter your Email" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="password" class="cols-sm-2 control-label">Password</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon">
											<i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
											<input type="password" class="form-control" name="password" id="password" placeholder="Enter your Password" />
										</div>
									</div>
								</div>
								<div class="form-group ">
									<button type="button" id="btn-modify" class="btn btn-primary btn-lg btn-block login-button" onclick="javascript:modify()">수정완료</button>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom JavaScript for this theme -->
	<script src="js/scrolling-nav.js"></script>

</body>

</html>
