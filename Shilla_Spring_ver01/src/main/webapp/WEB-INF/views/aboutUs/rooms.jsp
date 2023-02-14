<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Rooms Page">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="미나">
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
                    <div class="breadcrumb-text">
                        <h2 data-lang="rooms"></h2>
                        <div class="bt-option">
                            <a href="index.jsp" data-lang="home"></a>
                            <span data-lang="rooms"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Rooms Section Begin -->
    <section class="rooms-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="room-item">
                        <img src="../resources/img/about/standard.jpg" alt="Standard room">
                        <div class="ri-text">
                            <h4 data-lang="room_standard"></h4><!-- 스탠다드 룸 -->
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o" data-lang="room_location"></td>
                                        <td>3~16F</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_size"></td>
                                        <td>24m²</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_detail_sub"></td>
                                        <td data-lang="room_detail_con"></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_service_sub"></td>
                                        <td data-lang="room_service_con"></td>
                                    </tr>
                                </tbody>
                            </table>
<!-- 해당 부분 모두 controller 수정 --><a href="standard.do" class="primary-btn" data-lang="read_more"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6"><!-- 스위트 룸 -->
                    <div class="room-item">
                        <img src="../resources/img/about/suite.jpg" alt="Suite room">
                        <div class="ri-text">
                            <h4 data-lang="room_suite"></h4>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o" data-lang="room_location"></td>
                                        <td>17~26F</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_size"></td>
                                        <td>26m²</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_detail_sub"></td>
                                        <td data-lang="room_detail_con"></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_service_sub"></td>
                                        <td data-lang="room_service_con"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="suite.do" class="primary-btn" data-lang="read_more"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6"><!-- 이그제큐티브 룸 -->
                    <div class="room-item">
                        <img src="../resources/img/about/executive.jpg" alt="Executive Room">
                        <div class="ri-text">
                            <h4 data-lang="room_executive"></h4>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o" data-lang="room_location"></td>
                                        <td>19F</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_size"></td>
                                        <td>35m²</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_detail_sub"></td>
                                        <td data-lang="room_detail_con"></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_service_sub"></td>
                                        <td data-lang="room_service_con"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="executive.do" class="primary-btn" data-lang="read_more"></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6"><!-- 온돌 룸 -->
                    <div class="room-item">
                        <img src="../resources/img/about/korean.jpg" alt="Korean Room">
                        <div class="ri-text">
                            <h4 data-lang="room_korean"></h4>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="r-o" data-lang="room_location"></td>
                                        <td>23~26F</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_size"></td>
                                        <td>50m²</td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_detail_sub"></td>
                                        <td data-lang="room_detail_con2"></td>
                                    </tr>
                                    <tr>
                                        <td class="r-o" data-lang="room_service_sub"></td>
                                        <td data-lang="room_service_con"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="korean.do" class="primary-btn" data-lang="read_more"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Rooms Section End -->
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