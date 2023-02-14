<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="병준">
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
    <%
    String dateIn=session.getAttribute("dateIn").toString();
	String dateOut=session.getAttribute("dateOut").toString();
	String roomType=session.getAttribute("roomType").toString();
	%>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<jsp:include page="../section/header.jsp"/>

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 data-lang="noMem_booking_pay"></h2>
                        <div class="bt-option"><br>
							<form action="../booking/reserveRoom.do" method="post">
							<span data-lang="name"></span> : <input type="text" name="userName" required="required"><br>
							<br>
							<span data-lang="tel"></span> : <input type="text" name="userTel" required="required"><br>
							<br>
							<input type="hidden" name="date-in" value="<%=dateIn %>">
							<input type="hidden" name="date-out" value="<%=dateOut %>">
							<input type="hidden" name="room-type" value="<%=roomType %>">
							<input type="submit" id="payBtn" value="결제하기">
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../section/footer.jsp"/>

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
</html>