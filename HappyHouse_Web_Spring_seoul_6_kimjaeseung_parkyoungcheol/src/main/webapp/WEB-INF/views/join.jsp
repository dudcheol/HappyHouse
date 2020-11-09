<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
function join() {
	if(document.getElementById("userid").value == "") {
		alert("아이디 입력!!!");
		return;
	} else if(document.getElementById("username").value == "") {
		alert("이름 입력!!!");
		return;
	} else if(document.getElementById("password").value == "") {
		alert("비밀번호 입력!!!");
		return;
	} else if(document.getElementById("confirm").value != document.getElementById("password").value) {
		alert("비밀번호가 다릅니다.");
		return;
	} else if(document.getElementById("email").value == "") {
		alert("이메일 입력!!!");
		return;
	} else {
		document.getElementById("join-form").action = "${root}/user";
		document.getElementById("join-form").submit();
	}
}
</script>
<body>
	<div class="modal fade" id="joinModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">회원가입 정보를 입력하세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form id="join-form" class="form-horizontal" method="post" action="">
					<input type="hidden" name="act" id="act" value="join">	
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">ID</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-user fa" aria-hidden="true"></i></span> 
									<input type="text" class="form-control" name="userid" id="userid" placeholder="Enter your ID" />
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
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
									<input type="password" class="form-control" name="password" id="password" placeholder="Enter your Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
									<input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirm your Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-envelope fa" aria-hidden="true"></i></span> 
									<input type="text" class="form-control" name="email" id="email" placeholder="Enter your Email" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="form-group ">
						<button type="button" class="btn btn-primary btn-lg btn-block login-button" id="registerBtn" onclick="javascript:join()">가입하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>