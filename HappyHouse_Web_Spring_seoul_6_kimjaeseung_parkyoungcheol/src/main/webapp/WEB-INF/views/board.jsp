<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>쌉방 SSAPBANG</title>

  <!-- 템플릿 사용시 필요한 것 -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/scrolling-nav.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function() {
		$('#logoutArea').css('display', 'none');
	
		$('#logout').on('click', function() {
			$('#loginArea').css('display', 'inline');
			$('#logoutArea').css('display', 'none');
			$('#favorite').css('display', 'none');
		});
	
		$('#btn-Join').on('click', function() {
			$('#loginModal').modal('hide');
			$('#joinModal').modal('show');
		});
	
		$('#mypage').on('click', function() {
			$(location).attr('href', 'mypage.html');
		});
		
		$('#searchBtn').on('click', function() {
			$(location).attr('href', 'search.html');
		});
	});
	
	//로그인했을 때
	function logincall() {
		$('#loginModal').modal('hide');
		$('#loginArea').css('display', 'none');
		$('#logoutArea').css('display', 'inline');
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
	min-width: 70px;
	margin: 0 auto 0 0;
}

#searchDropdown {
	margin: 0 10px 0 auto;
}

.search {
	display: inline;
	width: 70%;
}

#logoutArea p {
	display: inline;
	color: white;
}
  
.modal-dialog {
	overflow-y: initial !important
}

.modal-body {
	max-height: 250px; /* 화면 사이즈 구해서 높이 변경할필요있음 */
	overflow-y: auto;
}

</style>
</head>

<body id="page-top">

  <!-- Navigation -->
  <body id="page-top">
	<!-- The Modal -->
	<div class="modal fade" id="loginModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">로그인 정보를 입력하세요</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form class="form-signin" method="POST"
						onSubmit="logincall();return false">
						<label for="inputEmail" class="sr-only">Your ID</label> <input
							type="text" id="uid" class="form-control" placeholder="Your ID"
							required autofocus><BR> <label for="inputPassword"
							class="sr-only">Password</label> <input type="password" id="upw"
							class="form-control" placeholder="Password" required><br>
						<div class="checkbox">
							<label> <input type="checkbox" value="remember-me">
								기억하기
							</label>
						</div>
						<div style="float: right">
							<button id="btn-Join" class="btn btn-lg btn-secondary">회
								원 가 입</button>
							<button id="btn-Yes" class="btn btn-lg btn-primary" type="submit">로
								그 인</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

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
					<form class="form-horizontal" method="post" action="#">

						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your
								Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="name" id="name"
										placeholder="Enter your Name" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your
								Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="email" id="email"
										placeholder="Enter your Email" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="username" id="username"
										placeholder="Enter your Username" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="cols-sm-2 control-label">Address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="address" id="address"
										placeholder="Enter your Address" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="tel" class="cols-sm-2 control-label">Tel</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-users fa" aria-hidden="true"></i></span> <input
										type="tel" class="form-control" name="tel" id="tel"
										placeholder="Enter your Tel" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="password" class="form-control" name="password"
										id="password" placeholder="Enter your Password" />
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm
								Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="password" class="form-control" name="confirm"
										id="confirm" placeholder="Confirm your Password" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<div class="form-group ">
						<button type="button"
							class="btn btn-primary btn-lg btn-block login-button">가입하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>



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
				<div id="loginArea">
					<button id="login" type="button" class="btn btn-primary"
						data-toggle="modal" data-target="#loginModal">로그인</button>
				</div>
				<div id="logoutArea" style="display: none">
					<p>
						<kbd>id</kbd>
						님 안녕하세요!
					</p>
					<button id="mypage" type="button" class="btn btn-info">마이페이지</button>
					<button id="logout" type="button" class="btn btn-secondary" onclick="location.href='logout.bod'">로그아웃</button>
				</div>
			</div>
		</div>
	</nav>

  <header class="bg-primary text-white">
    <div class="container text-center">
      <h1>SSAP-BANG</h1>
      <p class="lead">당신이 원하는 부동산 거래 정보, 여기서 모두 확인하실 수 있습니다.</p>
    </div>
  </header>

  <div class="container">
  	<br><br>
  	<h1>공지사항</h1>
  	<br>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>1</td>
			<td><a href="boardDetail.jsp" class="title">쌉방 개인정보처리방침 개정 안내</a></td>
			<td>admin</td>
			<td>2020.08.20</td>
		</tr>
		<tr>
			<td>2</td>
			<td><a href="boardDetail.jsp" class="title">쌉방 서비스 이용약관 개정 안내</a></td>
			<td>admin</td>
			<td>2020.09.19</td>
		</tr>
		</tbody>
	</table>
	<hr/>
	<ul class="pagination justify-content-center" style="margin:20px 0">
	  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
	  <li class="page-item active"><a class="page-link" href="#">1</a></li>
	  <li class="page-item"><a class="page-link" href="#">2</a></li>
	  <li class="page-item"><a class="page-link" href="#">3</a></li>
	  <li class="page-item"><a class="page-link" href="#">Next</a></li>
	</ul>
	<br><br>
</div>
  

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
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
