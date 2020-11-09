<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<c:if test="${cookie.ssafy_id.value ne null }">
	<c:set var="saveid" value="${cookie.ssafy_id.value }"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>
<script type="text/javascript">
function login() {
	if(document.getElementById("uid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("upw").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else {
		document.getElementById("login-form").action = "${root}/user";
		document.getElementById("login-form").submit();
	}
}
	 
	 
</script>
</head>
<body>
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<p>${msg}</p>
					<h4 class="modal-title">로그인 정보를 입력하세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="login-form" class="form-signin" method="POST" action="">
					<input type="hidden" name="act" id="act" value="login">	
						<label for="inputEmail" class="sr-only">Your ID</label> 
						<input type="text" id="uid" name="uid" class="form-control" placeholder="Your ID" value="${saveid}"required autofocus><br> 
						<label for="inputPassword" class="sr-only">Password</label> 
						<input type="password" id="upw" name="upw" class="form-control" placeholder="Password" required><br>
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me" id="idsave" name="idsave" value="saveok"${idck}>
								아이디저장
							</label>
						</div>
						<div style="float: right">
							<button type="button" id="btn-Join" class="btn btn-lg btn-secondary" data-target="#joinModal" onclick="javascript:mvjoin()">회 원 가 입</button> 
							<button type="button" id="btn-Yes" class="btn btn-lg btn-primary" onclick="javascript:login()">로 그 인</button>
						</div>
						<alert >
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>