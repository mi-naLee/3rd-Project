<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Room-Standard">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text"> <!-- style.css 수정 -->
                        <h2 data-lang="rooms"></h2>
                        <div class="bt-option">
                            <a href="index.jsp" data-lang="home"></a>
                            <span data-lang="rooms"></span>
                        </div>
                        <img src="../resources/img/about/executive.jpg" alt="Executive Room">
                        <div class="room-details-item">
                        <div class="rd-text">
                            <div class="rd-title"><br>
                                <h2 data-lang="room_executive"></h2><br>
                                <div class="rdt-right">
                                    <a href="../booking/booking.do" data-lang="booking_btn"></a>
                                </div>
                            </div><br>
                            <span data-lang="room_location"></span> : <span>19F</span><br>
                            <span data-lang="room_size"></span> : <span>35m²</span><br>
                            <span data-lang="room_detail_sub"></span> : <span data-lang="room_detail_con"></span><br>
							<span data-lang="room_service_sub"></span> : <span data-lang="room_service_con"></span><br>
                            <br>
                            <p data-lang="room_info"></p>
                            <span data-lang="contact"></span> : <span data-lang="hotel_tel"></span>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->
    <!-- Room Details Section End -->
	<jsp:include page="../section/footer.jsp"></jsp:include>

    <!-- Js Plugins -->
    <script src="../resources/js/language.js"></script> 
	<script src="../resources/js/language-en.js"></script><!-- ********* 다국어 처리 추가 ********* -->		
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/jquery.magnific-popup.min.js"></script>
    <script src="../resources/js/jquery.nice-select.min.js"></script>
    <script src="../resources/js/jquery-ui.min.js"></script>
    <script src="../resources/js/jquery.slicknav.js"></script>
    <script src="../resources/js/owl.carousel.min.js"></script>
    <script src="../resources/js/main.js"></script>
</body>
<script>
	var en = document.getElementById("en");
	$(function() {
		if(en != null){
			document.getElementById("aboutUs").outerHTML='<li id="aboutUs" class="active"><a href="../aboutUs/getAboutUs.do">About Us</a></li>';
		}else{
			document.getElementById("aboutUs").outerHTML='<li id="aboutUs" class="active"><a href="../aboutUs/getAboutUs.do">호텔 소개</a></li>';
		}
		//<li id="aboutUs" class=active><a href="./about-us.html">About Us</a></li>
	});
</script>
</html>