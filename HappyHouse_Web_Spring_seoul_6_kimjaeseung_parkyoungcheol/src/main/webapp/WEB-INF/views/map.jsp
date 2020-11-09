<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SSAPBANG | 지도</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="css/scrolling-nav.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		initSetting();
		initMapSetting();
	});

	function initSetting() {
		$("#apt-deal").on("click", function() {
			toggle(this);
		});
		$("#apt-rent").on("click", function() {
			toggle(this);
		});
		$("#house-deal").on("click", function() {
			toggle(this);
		});
		$("#house-rent").on("click", function() {
			toggle(this);
		});
		$("#btn-like").on("click", function() {

		});
		$("#detail-close").on("click", function() {
			$(".detail-nav-title").text("거래정보");
			$("#detail-list").css("display", "block");
			$("#detail-selected").css("display", "none");
			$(this).css("display", "none");
		});
		
		$("#search-apt").on("click", function() {
			let str = $("#search-input").val();
			if(str.length == 0){
				alert("내용을 입력하세요.");
				return;
			}
			$.get("/map/search/"+str
					/* ,{act:"search", apt:str} */
					,function(data, status){
						$.each(data, function(index, vo) {
							if(index==0){
								$("#detail-list").empty();
							}
							let dealTime = " " + vo.dealYear + "." + vo.dealMonth + "." + vo.dealDay;
							let str = "<div class='divider'></div>"
							+ "<div id='" + vo.no + "' class='row detail-item none-margin' style='cursor: pointer;'>"
							+ "<div class='col-10 none-margin none-padding'>"
							+ "<div class='detail-title'>" + vo.aptName + "</div>"
							+ "<div class='detail-plain'>"
							+ "<span class='badge badge-secondary'>"+"아파트 매매"+"</span> " + dealTime + "</div>"
							+ "</div>"
							+ "<div class='col-2 none-margin none-padding'>"
							+ "<div id='btn-like' class='ml-auto' style='height: 30px; width: 30px;' like='off'></div>"
							+ "</div>"
							+ "</div>";
							$("#detail-list").append(str);
							$("#"+vo.no).on("click", function() {
								$("#detail-list").css("display", "none");
								$("#detail-selected").css("display", "block");
								$(".detail-nav-title").text("상세정보");
								$("#detail-close").css("display", "block");
								
								$("#detail-dealAmount").text(vo.dealAmount);
								$("#detail-floor").text(vo.floor);
								
								$(".detail-title").text(vo.aptName);
								$(".detail-plain").html('<span id="detail-type" class="badge badge-secondary">'+'아파트 매매'+'</span>'+dealTime);
								$("#detail-dong").text(vo.dong);
								$("#detail-jibun").text(vo.jibun);
								$("#detail-build").text(vo.buildYear);
							});
						});//each
						geocode(data);
					}//function
					, "json"
			);//get
		});
		
		$("#sido").change(function() {
			$.get("/map/gugun/" + $("#sido").val()
					/* ,{act:"gugun", sido:$("#sido").val()} */
					,function(data, status){
						console.log(data);
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
			console.log("gugun click");
			$.get("/map/dong/" + $("#gugun").val()
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
			$.get("/map/housedeal/" + $("#dong").val()
					/* ,{act:"deal", dong:$("#dong").val()} */
					,function(data, status){
						$.each(data, function(index, vo) {
							if(index==0){
								$("#detail-list").empty();
							}
							let dealTime = " " + vo.dealYear + "." + vo.dealMonth + "." + vo.dealDay;
							let str = "<div class='divider'></div>"
							+ "<div id='" + vo.no + "' class='row detail-item none-margin' style='cursor: pointer;'>"
							+ "<div class='col-10 none-margin none-padding'>"
							+ "<div class='detail-title'>" + vo.aptName + "</div>"
							+ "<div class='detail-plain'>"
							+ "<span class='badge badge-secondary'>"+"아파트 매매"+"</span> " + dealTime + "</div>"
							+ "</div>"
							+ "<div class='col-2 none-margin none-padding'>"
							+ "<div id='btn-like' class='ml-auto' style='height: 30px; width: 30px;' like='off'></div>"
							+ "</div>"
							+ "</div>";
							$("#detail-list").append(str);
							$("#"+vo.no).on("click", function() {
								$("#detail-list").css("display", "none");
								$("#detail-selected").css("display", "block");
								$(".detail-nav-title").text("상세정보");
								$("#detail-close").css("display", "block");
								
								$("#detail-dealAmount").text(vo.dealAmount);
								$("#detail-floor").text(vo.floor);
								
								$(".detail-title").text(vo.aptName);
								$(".detail-plain").html('<span id="detail-type" class="badge badge-secondary">'+'아파트 매매'+'</span>'+dealTime);
								$("#detail-dong").text(vo.dong);
								$("#detail-jibun").text(vo.jibun);
								$("#detail-build").text(vo.buildYear);
							});
						});//each
						geocode(data);
					}//function
					, "json"
			);
		});//change
	};
	
	function initMapSetting() {
		$.get("/map/sido"
				/* , {act : "sido"} */
				, function(data, status) {
					$.each(data, function(index, vo) {
						$("#sido").append("<option value='"+vo.sidoCode+"'>"+ vo.sidoName + "</option>");
					});//each
				}//function
				, "json"
		).done(function(){
			$("#sido").val("${sido}");
		});//get
		
		$.get("/map/gugun/${sido}"
				/* ,{act:"gugun", sido:$("#sido option:checked").text()} */
				,function(data, status){
					$.each(data, function(index, vo) {
						$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
					});//each
				}//function
				, "json"
		).done(function(){
			$("#gugun").val("${gugun}");
		});//get
		
		$.get("/map/dong/${gugun}"
				/* ,{act:"dong", gugun:$("#gugun option:checked").text()} */
				,function(data, status){
					$.each(data, function(index, vo) {
						$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
					});//each
				}//function
				, "json"
		).done(function(){
			$("#dong").val("${dong}");
		});//get
		
		$.get("/map/housedeal/${dong}"
				/* ,{act:"deal", dong:$("#dong option:checked").text()} */
				,function(data, status){
					$.each(data, function(index, vo) {
						let dealTime = " " + vo.dealYear + "." + vo.dealMonth + "." + vo.dealDay;
						let str = "<div class='divider'></div>"
						+ "<div id='" + vo.no + "' class='row detail-item none-margin' style='cursor: pointer;'>"
						+ "<div class='col-10 none-margin none-padding'>"
						+ "<div class='detail-title'>" + vo.aptName + "</div>"
						+ "<div class='detail-plain'>"
						+ "<span class='badge badge-secondary'>"+"아파트 매매"+"</span> " + dealTime + "</div>"
						+ "</div>"
						+ "<div class='col-2 none-margin none-padding'>"
						+ "<div id='btn-like' class='ml-auto' style='height: 30px; width: 30px;' like='off'></div>"
						+ "</div>"
						+ "</div>";
						$("#detail-list").append(str);
						$("#"+vo.no).on("click", function() {
							$("#detail-list").css("display", "none");
							$("#detail-selected").css("display", "block");
							$(".detail-nav-title").text("상세정보");
							$("#detail-close").css("display", "block");
							
							$("#detail-dealAmount").text(vo.dealAmount);
							$("#detail-floor").text(vo.floor);
							
							$(".detail-title").text(vo.aptName);
							$(".detail-plain").html('<span id="detail-type" class="badge badge-secondary">'+'아파트 매매'+'</span>'+dealTime);
							$("#detail-dong").text(vo.dong);
							$("#detail-jibun").text(vo.jibun);
							$("#detail-build").text(vo.buildYear);
						});
					});//each
					geocode(data);
				}//function
				, "json"
		);
	}
	
	function toggle(target) {
		var onCnt = 0;

		$(target).parent().children().each(function(index, item) {
			if ($(item).attr("state") == "on")
				onCnt++;
		});

		if ($(target).attr("state") == "on" && onCnt > 1) {
			$(target).attr("state", "off");
			$(target).removeClass("btn-primary");
			$(target).addClass("btn-secondary");
		} else {
			$(target).attr("state", "on");
			$(target).removeClass("btn-secondary");
			$(target).addClass("btn-primary");
		}
	}

	function geocode(jsonData) {
		let idx = 0;
		deleteMarkers();
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			$.get("https://maps.googleapis.com/maps/api/geocode/json", {
				key : 'AIzaSyCaYk8aUnscgOO-N5zBeDisG3lRAsOU7i4',
				address : vo.dong + "+" + vo.aptName + "+" + vo.jibun
			}, function(data, status) {
				//alert(data.results[0].geometry.location.lat);
				tmpLat = data.results[0].geometry.location.lat;
				tmpLng = data.results[0].geometry.location.lng;
				$("#lat_" + index).text(tmpLat);
				$("#lng_" + index).text(tmpLng);
				addMarker(tmpLat, tmpLng, vo.aptName, vo.no);
				if(index == jsonData.length - 1){
					setMapOnAll(map);
				}
			}, "json");//get
		});//each
	}
</script>
</head>
<style>
html, body {
	height: 100%;
	overflow: hidden;
}

body {
	margin: 0;
	padding: 0;
	position: relative;
}

#search-box {
	z-index: 1000;
	width: 360px;
	/* height: 97px; */
	position: absolute;
	margin: 10px;
}

.btn.active {
	display: none;
}

.btn span:nth-of-type(1) {
	display: none;
}

.btn span:last-child {
	display: block;
}

.btn.active  span:nth-of-type(1) {
	display: block;
}

.btn.active span:last-child {
	display: none;
}

#search-box .toggle {
	width: 25%;
	padding: 0;
}

#search-box label {
	font-size: 15px;
}

.detail-area {
	height: 100%;
}

.detail-image {
	width: 100%;
	text-align: center;
	vertical-align: middle;
	background: #f2f2f2;
	height: 200px;
}

.detail-item {
	width: 100%;
	padding: 10px;
}

.detail-item h5 {
	margin: 0px;
}

.none-padding {
	padding: 0;
}

.none-margin {
	margin: 0;
}

.divider {
	width: 100%;
	height: 10px;
	background: #f2f2f2;
}

.detail-title {
	font-size: 25px;
	font-weight: bold;
}

.detail-plain {
	font-size: 15px;
	color: #4d4d4d;
}

.detail-table tr td:nth-child(1) {
	color: #8c8c8c;
}

.detail-table tr td:nth-child(2) {
	color: #4d4d4d;
}

.btn-group button {
	font-size: 13px;
}

.detail-nav {
	font-size: 20px;
	padding: 10px;
}

#detail-close {
	cursor: pointer;
}

#detail-list {
	height: 100%;
}

#detail-selected {
	height: 100%;
}
</style>
<body>

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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="/">SSAPBANG</a>
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
					<button id="logout" type="button" class="btn btn-secondary">로그아웃</button>
				</div>
			</div>
		</div>
	</nav>

	<div class="row container-fluid"
		style="position: relative; width: 100%; height: 100%; margin: 0px; padding: 0px">
		<div id="search-box" class="card">
			<div>
				<form class="form-inline" id="frm" action="search.html">
					<div class="form-group md">
						<select class="form-control" name="sido" id="sido">
							<option value="all">시도</option>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="gugun" id="gugun">
							<option value="all">구군</option>
						</select>
					</div>
					<div class="form-group md-1">
						<select class="form-control" name="dong" id="dong">
							<option value="all">읍면동</option>
						</select>
					</div>
				</form>
			</div>
			<div class="btn-group">
				<button id="apt-deal" type="button" class="btn btn-primary"
					state="on">아파트 매매</button>
				<button id="apt-rent" type="button" class="btn btn-primary"
					state="on">아파트 전월세</button>
				<button id="house-deal" type="button" class="btn btn-primary"
					state="on">주택 매매</button>
				<button id="house-rent" type="button" class="btn btn-primary"
					state="on">주택 전월세</button>
			</div>

			<div class="row none-margin d-flex" style="padding: 5px">
				<div class="none-margin none-padding flex-grow-1">
					<input id="search-input" type="text" class="form-control form-control"
						placeholder="아파트 혹은 주택명을 입력하세요">
				</div>
				<div>
					<button id="search-apt" type="button" class="btn btn-light">검색</button>
				</div>
			</div>
		</div>

		<div id="map" class="col-sm-10"
			style="width: 100%; height: calc(100% - 56px);"></div>
		<script
			src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
		<script defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCaYk8aUnscgOO-N5zBeDisG3lRAsOU7i4&callback=initMap"></script>
		<script>
			var multi = {
				lat : 37.5665734,
				lng : 126.978179
			};
			var map;
			var markers = [];
			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center : multi,
					zoom : 12
				});
				var marker = new google.maps.Marker({
					position : multi,
					map : map
				});
			}
			function addMarker(tmpLat, tmpLng, aptName, no) {
				var marker = new google.maps.Marker({
					position : new google.maps.LatLng(parseFloat(tmpLat),
							parseFloat(tmpLng)),
					label : aptName,
					title : aptName,
					no : no
				});
				marker.addListener('click', function() {
					map.setZoom(17);
					map.setCenter(marker.getPosition());
					callHouseDealInfo();
				});
				markers.push(marker);
				/* marker.setMap(map); */
			}
			function setMapOnAll(map) {
				  for (let i = 0; i < markers.length; i++) {
				    markers[i].setMap(map);
				  }
			}
			function clearMarkers() {
				  setMapOnAll(null);
			}
			function deleteMarkers() {
				  clearMarkers();
				  markers = [];
			}
			function callHouseDealInfo() {
				$("#detail-list").css("display", "none");
				$("#detail-selected").css("display", "block");
				$(".detail-nav-title").text("상세정보");
				$("#detail-close").css("display", "block");
				
				$("#detail-dealAmount").text(vo.dealAmount);
				$("#detail-floor").text(vo.floor);
				
				$(".detail-title").text(vo.aptName);
				$(".detail-plain").html('<span id="detail-type" class="badge badge-secondary">'+'아파트 매매'+'</span>'+dealTime);
				$("#detail-dong").text(vo.dong);
				$("#detail-jibun").text(vo.jibun);
				$("#detail-build").text(vo.buildYear);
			}
		</script>

		<div class="detail-area col-sm-2 flex-column none-padding none-margin">
			<div class="detail-nav d-flex align-content-center">
				<div class="detail-nav-title">거래정보</div>
				<div id="detail-close" class="ml-auto"
					style="width: 20px; height: 20px; display: none;">
					<?xml version="1.0" encoding="iso-8859-1"?>
					<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						viewBox="0 0 298.667 298.667"
						style="enable-background: new 0 0 298.667 298.667;"
						xml:space="preserve">
					<g>
						<g>
							<polygon
							points="298.667,30.187 268.48,0 149.333,119.147 30.187,0 0,30.187 119.147,149.333 0,268.48 30.187,298.667 
								149.333,179.52 268.48,298.667 298.667,268.48 179.52,149.333 		" />
						</g>
					</g>
					</svg>
				</div>
			</div>
			<div id="detail-list" class="overflow-auto">
				<!-- <div class="divider"></div>
				<div class="row detail-item none-margin">
					<div class="col-10 none-margin none-padding">
						<div class="detail-title">아파트이름</div>
						<div class="detail-plain">
							<span class="badge badge-secondary">아파트 매매</span> 2020.10.01
						</div>
					</div>
					<div class="col-2 none-margin none-padding">
						<div id="btn-like" class="ml-auto"
							style="height: 30px; width: 30px;" like="off"></div>
					</div>
				</div>
				<div class="divider"></div>
				<div class="row detail-item none-margin">
					<div class="col-10 none-margin none-padding">
						<div class="detail-title">아파트이름</div>
						<div class="detail-plain">
							<span class="badge badge-secondary">아파트 매매</span> 2020.10.01
						</div>
					</div>
					<div class="col-2 none-margin none-padding">
						<div id="btn-like" class="ml-auto"
							style="height: 30px; width: 30px;" like="off"></div>
					</div>
				</div>
				<div class="divider"></div> -->
			</div>

			<div id="detail-selected" class="overflow-auto" style="display: none">
				<div class="detail-image">image area</div>
				<div class="row detail-item none-margin">
					<div class="col-10 none-margin none-padding">
						<div class="detail-title">아파트이름</div>
						<div class="detail-plain">
							<span id="detail-type" class="badge badge-secondary">아파트 매매</span> 2020.10.01
						</div>
					</div>
					<div class="col-2 none-margin none-padding">
						<div id="btn-like" class="ml-auto"
							style="height: 30px; width: 30px;" like="off">
							<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								viewBox="0 0 412.735 412.735"
								style="enable-background: new 0 0 412.735 412.735;"
								xml:space="preserve">
					<g>
						<g>
							<path
									d="M295.706,35.522C295.706,35.522,295.706,35.522,295.706,35.522c-34.43-0.184-67.161,14.937-89.339,41.273
								c-22.039-26.516-54.861-41.68-89.339-41.273C52.395,35.522,0,87.917,0,152.55C0,263.31,193.306,371.456,201.143,375.636
								c3.162,2.113,7.286,2.113,10.449,0c7.837-4.18,201.143-110.759,201.143-223.086C412.735,87.917,360.339,35.522,295.706,35.522z
								 M206.367,354.738C176.065,336.975,20.898,242.412,20.898,152.55c0-53.091,43.039-96.131,96.131-96.131
								c32.512-0.427,62.938,15.972,80.457,43.363c3.557,4.905,10.418,5.998,15.323,2.44c0.937-0.68,1.761-1.503,2.44-2.44
								c29.055-44.435,88.631-56.903,133.066-27.848c27.202,17.787,43.575,48.114,43.521,80.615
								C391.837,243.456,236.669,337.497,206.367,354.738z" />
						</g>
					</g>
					</svg>
						</div>
					</div>
				</div>
				<div class="divider"></div>
				<div class="detail-item">
					<h5>
						거래가 <span id="detail-dealAmount" class="badge badge-light">39,000</span>만원/매매
					</h5>
					<h5>
						위치 <span id="detail-floor" class="badge badge-light">3</span>층
					</h5>
					<!-- <h5>
						전용면적 <span class="badge badge-light">알 수 없음</span>㎡
					</h5> -->
				</div>
				<div class="divider"></div>
				<div class="detail-item" style="padding: 0">
					<table class="table detail-table">
						<tbody>
							<tr>
								<td>법정동</td>
								<td id="detail-dong">서울시 역삼동</td>
							</tr>
							<tr>
								<td>지번</td>
								<td id="detail-jibun">159-12</td>
							</tr>
							<tr>
								<td>건축연도</td>
								<td id="detail-build">2014.03</td>
							</tr>
							<tr>
								<td>환경정보</td>
								<td>비어 있음</td>
							</tr>
							<tr>
								<td>상권정보</td>
								<td>비어 있음</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
