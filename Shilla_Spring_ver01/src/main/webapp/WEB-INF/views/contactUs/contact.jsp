<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- *************** 연락처 페이지 ************** -->
<% String userID = (String) pageContext.getSession().getAttribute("userID"); %>
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="tel & location">
    <meta name="author" content="미나">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SHILLA STAY GANGSEO</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/elegant-icons.css" type="text/css">
	<link rel="stylesheet" href="resources/css/flaticon.css" type="text/css">
	<link rel="stylesheet" href="resources/css/owl.carousel.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/nice-select.css" type="text/css">
	<link rel="stylesheet" href="resources/css/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/magnific-popup.css" type="text/css">
	<link rel="stylesheet" href="resources/css/slicknav.min.css" type="text/css">
	<link rel="stylesheet" href="resources/css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<jsp:include page="../section/header.jsp"></jsp:include>

    <!-- Contact Section Begin -->
    <!-- ============================= (내용) 수정 ============================ -->
    <!-- ***** style.css ***** -->
    <section class="contact-section spad">
        <div class="container"> <!-- container : 화면 padding 설정 -->
	         <h2 id="contact-title" data-lang="contact"></h2><hr>
	         <p data-lang="contact_contents"></p>
	         <br><br>
	         <h4 id="contact-title">SHILLA STAY GANGSEO</h4>
	         <table id="contact-table">
	         	<tbody>
	         		<tr>
	         			<td rowspan="3" class="contact-td">Hotel Front Desk</td>
		         		<td data-lang="contact_phone"></td>
					</tr>      
					<tr>
		         		<td data-lang="contact_reservation"></td>
					</tr>		
					<tr>
		         		<td data-lang="contact_time"></td>
					</tr>								
	         	</tbody>
	         </table><br>
	        <!-- ======================= 지도 api 부분 ===================== -->
	        <div id="map" style="width: 100%; height: 500px;"></div>
        </div>
    </section>
    <!-- ==================================================================== -->
    <!-- Contact Section End -->
	<jsp:include page="../section/footer.jsp"></jsp:include>

    <!-- Js Plugins --> <!-- 지도 설정 추가 -->
    <script src="resources/js/language.js"></script> 
	<script src="resources/js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->
    <!-- ========================================================================= -->
    <!-- 구글 영문 지도(한글 겸용) -->
    <%@ taglib uri = "http://www.springframework.org/tags" prefix="spring"%>
    <script type="text/javascript"
    src="https://maps.googleapis.com/maps/api/js?
    key=<spring:eval expression="@apikey.getProperty('GOOGLE_API_KEY')">
    </spring:eval>&callback=init&language=en"></script>
    <script defer src="resources/js/map.js"></script>
    <!-- ========================================================================= -->
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.magnific-popup.min.js"></script>
	<script src="resources/js/jquery.nice-select.min.js"></script>
	<script src="resources/js/jquery-ui.min.js"></script>
	<script src="resources/js/jquery.slicknav.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script src="resources/js/main.js"></script>
</body>
<script>
	var en = document.getElementById("en");
	$(function() {
		if(en != null){
			document.getElementById("contactUs").outerHTML='<li id="contactUs" class="active"><a href="contactUs.do">Contact Us</a></li>';
		}else{
			document.getElementById("contactUs").outerHTML='<li id="contactUs" class="active"><a href="contactUs.do">고객문의</a></li>';
		}
		//<li id="aboutUs" class=active><a href="./about-us.html">About Us</a></li>
	});
</script>
</html>