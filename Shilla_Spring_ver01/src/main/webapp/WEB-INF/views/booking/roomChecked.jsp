<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<% 
	String dateIn = request.getParameter("date-in");
	String dateOut = request.getParameter("date-out");
	String roomType = request.getParameter("room-type"); 
	String price = request.getAttribute("price").toString();
	Date format1 = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(dateIn);
	Date format2 = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(dateOut);
	long days = (format2.getTime() - format1.getTime())/(1000*24*60*60);
	
	String schedule = days+"박"+(days+1)+"일";
	String userName,userID,userTel;
	if(session.getAttribute("userID")!=null){
		userName=session.getAttribute("userName").toString();
		userID=session.getAttribute("userID").toString();
		userTel=session.getAttribute("userTel").toString();	
	}

	session.setAttribute("dateIn", dateIn);
	session.setAttribute("dateOut", dateOut);
	session.setAttribute("schedule", schedule);
	session.setAttribute("payAmount", price);
	session.setAttribute("roomType", roomType);
%>
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
    
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
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
                        <h2 data-lang="check_availability"></h2>
                        <div class="bt-option">
                            <br>
                            <span data-lang="room_checkIn"></span> : <%=dateIn %><br>
                            <span data-lang="room_checkOut"></span> : <%=dateOut %><br>
							<span data-lang="room_type"></span> : <%=roomType %><br>
							<span data-lang="room_price"></span> : <%=price %><br>
							<br>
							<form action="../booking/reserveRoom.do">
								<input type="hidden" name="date-in" value="<%=dateIn %>">
								<input type="hidden" name="date-out" value="<%=dateOut %>">
								<input type="hidden" name="room-type" value="<%=roomType %>">
								<input type="submit" id="payBtn_mem" value="회원 결제하기">
							</form>
							<form action="../booking/payNonmember.do">
								<input type="hidden" name="date-in" value="<%=dateIn %>">
								<input type="hidden" name="date-out" value="<%=dateOut %>">
								<input type="hidden" name="room-type" value="<%=roomType %>">
								<input type="submit" id="payBtn_noMem" value="비회원 결제하기">
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