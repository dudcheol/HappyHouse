<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>쌉방 SSAPBANG</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/scrolling-nav.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function mypage() {
	document.getElementById("logout-form").action = "views/mypage.jsp";
	document.getElementById("logout-form").submit();
}
 
function logout() {
	alert("로그아웃 되었습니다.");
	document.getElementById("logout-form").action = "${root}/user";
	document.getElementById("logout-form").submit();
}

	$(document).ready(function() {
		$('#btn-Join').on('click', function() {
			$('#loginModal').modal('hide');
			$('#joinModal').modal('show');
		});

		$('#more').on('click', function() {
			$(location).attr('href', 'views/board.jsp');
		});	
	});
	
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

.detail-title {
	font-size: 25px;
	font-weight: bold;
}

.detail-plain {
	font-size: 15px;
	color: #4d4d4d;
}
</style>

</head>
<body id="page-top">
<c:if test="${userinfo == null}">
	<%@ include file="login.jsp" %>
</c:if>
	<%@ include file="join.jsp" %>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">SSAPBANG</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
				<c:if test="${userinfo == null}">
					<li id="about" class="nav-item">
					<a class="nav-link js-scroll-trigger" href="#about">About</a></li>
				</c:if>
				<c:if test="${userinfo != null}">
					<li id="favorite" class="nav-item">
					<a class="nav-link js-scroll-trigger" href="#favorite">관심지역</a></li>
				</c:if>
					<li class="nav-item">
					<a class="nav-link js-scroll-trigger" href="#services">공지사항</a></li>
				</ul>
				<c:if test="${userinfo == null}">
					<div id="loginArea">
						<button id="login" type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#loginModal">로그인</button>
					</div>
				</c:if>
				<c:if test="${userinfo != null}">
					<form id="logout-form" class="form-signin" method="POST" action="">
					<input type="hidden" name="act" id="act" value="logout">	
					<div id="logoutArea">
						<p>
							<kbd>${userinfo.username}</kbd>
							님 안녕하세요!
						</p>
						<button id="mypage" type="button" class="btn btn-info" onclick="javascript:mypage()">마이페이지</button>
						<button id="logout" type="button" class="btn btn-secondary" onclick="javascript:logout()">로그아웃</button>
					</div>
					</form>
				</c:if>
			</div>
		</div>
	</nav>

	<header class="bg-primary text-white">

		<div class="container text-center">
			<h1>SSAP-BANG</h1>
			<p class="lead">당신이 원하는 부동산 거래 정보, 여기서 모두 확인하실 수 있습니다.</p>
			<div class="sorting-filters text-center mb-20 d-flex justify-content-center">
				<form class="form-inline" id="frm" action="map" method="post">
					<script>
					let colorArr = ['table-primary','table-success','table-danger'];
					$(document).ready(function(){
						$.get("/map/sido"
							/* ,{act:"sido"} */
							,function(data, status){
								$.each(data, function(index, vo) {
									$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
								});//each
							}//function
							, "json"
						);//get
					});//ready
					
					$(document).ready(function(){
						$("#sido").change(function() {
							$.get("/map/gugun/" + $("#sido").val()
									/* ,{act:"gugun", sido:$("#sido").val()} */
									,function(data, status){
										$("#gugun").empty();
										$("#gugun").append('<option value="0">선택</option>');
										$.each(data, function(index, vo) {
											$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
										});//each
									}//function
									, "json"
							);//get
						});//change
						$("#gugun").change(function() {
							$.get("/map/dong/"+$("#gugun").val()
									/* ,{act:"dong", gugun:$("#gugun").val()} */
									,function(data, status){
										$("#dong").empty();
										$("#dong").append('<option value="0">선택</option>');
										$.each(data, function(index, vo) {
											$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
										});//each
									}//function
									, "json"
							);//get
						});//change
						$("#dong").change(function() {
							$('#frm').submit();
							/* $.post("/map" , {
							    sido:$("#sido option:checked").text(),
							    gugun:$("#gugun option:checked").text(),
							    dong:$("#dong").val()
							}); */
						});//change
					});//ready
					function geocode(jsonData) {
						let idx = 0;
						$.each(jsonData, function(index, vo) {
							let tmpLat;
							let tmpLng;
							$.get("https://maps.googleapis.com/maps/api/geocode/json"
									,{	key:'AIzaSyDZqomtJY810_-FxTp7crICufPJyrAH5vg'
										, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
									}
									, function(data, status) {
										//alert(data.results[0].geometry.location.lat);
										tmpLat = data.results[0].geometry.location.lat;
										tmpLng = data.results[0].geometry.location.lng;
										$("#lat_"+index).text(tmpLat);
										$("#lng_"+index).text(tmpLng);
										addMarker(tmpLat, tmpLng, vo.aptName);
									}
									, "json"
							);//get
						});//each
					}
					</script>
					<div class="form-group md">
						<select class="form-control" name="sido" id="sido">
							<option value="0">시도</option>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="gugun" id="gugun">
							<option value="0">구군</option>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="dong" id="dong">
							<option value="0">읍면동</option>
						</select>
					</div>
				</form>
			</div>
		</div>
	</header>

	<c:if test="${userinfo == null}">
		<section id="about-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2>About SSAP-BANG</h2>
						<p class="lead">당신이 원하는 부동산 거래 정보, 여기서 모두 확인하실 수 있습니다.</p>
						<ul>
							<li>찾고자 하는 지역을 검색하세요. 해당 지역에 모든 매물 정보를 확인하실 수 있습니다.</li>
							<li>관심지역을 등록하세요. 매번 검색하지 않아도 바로 바로 확인하실 수 있습니다.</li>
							<li>공지사항을 확인해주세요. 다양한 개정안을 확인하실 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
	</c:if>
	
	<c:if test="${userinfo != null}">
		<section id="favorite-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2>관심지역</h2><hr>
						<!-- 관심지역 슬라이드 배너 -->
						<div id="demo" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>
	
							<!-- The slideshow -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row">
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
	
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
	
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
										<div class="col">
											<img class="img-fluid" src="img.jpg" alt="Los Angeles">
											<div class="row detail-item none-margin">
												<div class="col-10 none-margin none-padding">
													<div class="detail-title">아파트이름</div>
													<div class="detail-plain">
														<span class="badge badge-secondary">아파트 매매</span>
														2020.10.01
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
	
								<!-- Left and right controls -->
								<a class="carousel-control-prev" href="#demo" data-slide="prev">
									<span class="carousel-control-prev-icon" style="color: black"></span>
								</a> <a class="carousel-control-next" href="#demo" data-slide="next">
									<span class="carousel-control-next-icon" style="color: black"></span>
								</a>
	
								<!-- 관심지역 슬라이드 배너 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:if>

	<section id="services" class="bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>공지사항</h2>
					<table class="table table-hover">
						<tbody>
							<tr>
								<td><a href="views/boardDetail.jsp" class="title">쌉방
										개인정보처리방침 개정 안내</a></td>
								<td>2020.08.20</td>
							</tr>
							<tr>
								<td><a href="views/boardDetail.jsp" class="title">쌉방 서비스
										이용약관 개정 안내</a></td>
								<td>2020.09.19</td>
							</tr>
						</tbody>

					</table>
					<button id="more" class="btn btn-primary" style="float: right;">더보기</button>

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
		<!— /.container —>
	</footer>

	<!— Bootstrap core JavaScript —>
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!— Plugin JavaScript —>
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!— Custom JavaScript for this theme —>
	<script src="js/scrolling-nav.js"></script>

</body>

</html>