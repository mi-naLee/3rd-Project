<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="com.shilla.user.vo.*"%>
<!DOCTYPE html>
<html lang="ko">
<% String userID = (String) pageContext.getSession().getAttribute("userID"); %>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<meta charset="UTF-8">
	<meta name="description" content="userInfo(회원정보)">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="author" content="준영">
	<title>SHILLA STAY GANGSEO</title>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../resources/css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<jsp:include page="../section/header.jsp"></jsp:include>

	<section class="hero-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="hero-text">
						<!-- ====== 메인 문구 ===== -->
						<h1>SHILLA STAY GANGSEO</h1>
						<h4 id="homeTxt" data-lang="home_text_before"></h4>
						<h4 id="homeTxt" data-lang="home_text_after"></h4>
					</div>
				</div>
				<div class="col-xl-4 col-lg-5 offset-xl-2 offset-lg-1">
					<div class="booking-form">
						<form action="#">
							<div class="check-date"></div>
							<div class="check-date"></div>
							<h3><span style="color: #CAA175;" data-lang="account_info"></span></h3>
							<table border="1" bordercolor="#CAA175" text-align="center;">
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="id"></span> : ${userVO.userID}
									</h4></td>
								</tr>
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="name"></span> : ${userVO.userName}
									</h4></td>
								</tr>
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="age"></span> : ${userVO.userAge}
									</h4></td>
								</tr>
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="tel"></span> : ${userVO.userTel}
									</h4></td>
								</tr>
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="gender"></span> : ${userVO.userGender}
									</h4></td>
								</tr>
								<tr>
									<td><h4>
										<span style="color: #CAA175;" data-lang="email"></span> : ${userVO.userEmail}
									</h4></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="hero-slider owl-carousel">
			<!-- ********* 상단 슬라이드 이미지(640x426) ************** -->
			<div class="hs-item set-bg" data-setbg="../resources/img/index/pool.jpg"></div>
			<div class="hs-item set-bg" data-setbg="../resources/img/index/inside.jpg"></div>
			<div class="hs-item set-bg" data-setbg="../resources/img/index/hotel-night.jpg"></div>
		</div>
	</section>
	<jsp:include page="../section/footer.jsp"></jsp:include>

	<!-- Js Plugins -->
	<script src="../resources/js/language.js"></script> <!-- ********* 다국어 처리 추가 ********* -->
	<script src="../resources/js/language-en.js"></script>
	<script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.magnific-popup.min.js"></script>
    <script src="../resources/js/jquery.nice-select.min.js"></script>
    <script src="../resources/js/jquery-ui.min.js"></script>
    <script src="../resources/js/jquery.slicknav.js"></script>
    <script src="../resources/js/owl.carousel.min.js"></script>
    <script src="../resources/js/main.js"></script>
</body>

</html>