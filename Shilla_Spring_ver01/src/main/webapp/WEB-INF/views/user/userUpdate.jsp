<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.shilla.user.dao.*"%>
<%@ page import="com.shilla.user.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Sona Template">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="author" content="준영">
	<title>SHILLA STAY GANGSEO</title>
	<script type="text/javascript">
		function check() { 
			if (document.fr.userPassword.value == "") {
				var en = document.getElementById("en");
				if(en != null){
					alert("Please Enter yout Password");
				}else{
					alert("비밀번호를 입력해주세요.");
				}
				document.fr.userPassword.focus();
				return false;
			}
		}
	</script>
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
						<fieldset>
							<legend data-lang="account_edit"></legend>
							<form action="../user/userUpdateAction.do" method="post" name="fr"
							onsubmit="return check()">
								<span data-lang="id"></span> : <input type="text" name="userID"
									value="${userVO.userID}" readonly="readonly"><br>
									
								<span data-lang="pw"></span> : <input type="password" name="userPassword" value="${userVO.userPassword}"><br> 
								<span data-lang="name"></span> : <input
									type="text" name="userName" value="${userVO.userName}"><br>
								<span data-lang="age"></span> : <input type="text" name="userAge"
									value="${userVO.userAge}"><br> 
								<span data-lang="tel"></span> : <input
									type="text" name="userTel" value="${userVO.userTel}"><br>
								<span data-lang="gender"></span> : 
								
								<c:if test="${userVO.userGender.equals('여자')}">
								<input type="radio" name="gender" checked="checked" value="여자">
								<span data-lang="woman"></span>
								<input type="radio" name="gender" value="남자">
								<span data-lang="man"></span>
								</c:if>
								
								<c:if test="${userVO.userGender.equals('남자')}">
								<input type="radio" name="gender" value="여자">
								<span data-lang="woman"></span>
								<input type="radio" name="gender" checked="checked" value="남자">
								<span data-lang="man"></span>
								</c:if>
							
								<br> 
								<span data-lang="email"></span> : <input type="text" name="userEmail"
									value="${userVO.userEmail}"><br> 
								<input type="submit" id="editBtn" value="회원수정">
								<input type="reset" id="cxlBtn" value="취소">
							</form>
						</fieldset>
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