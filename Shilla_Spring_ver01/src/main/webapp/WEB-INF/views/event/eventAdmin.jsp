<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<span hidden="hidden" id="<%= session.getAttribute("language") %>"></span><!-- 해당 정보를 language.js에 넘긴다 -->
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Sona Template">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="author" content="두성">
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
	<jsp:include page="../section/header.jsp"/>
    <!-- Header End -->

    <!-- Breadcrumb Section Begin -->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2 data-lang="event"></h2>
                        <div class="bt-option">
                            <a href="../index.jsp" data-lang="home"></a>
                            <span data-lang="event"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog-section blog-page spad">
        <div class="container">
            <div class="row">
				<div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="" >
                    	<br><br><br><br>
                    	<div align="center"><a href="eventAdminInsertForm.do"><img alt="" src="../resources/img/icon_add.png" ></a></div>
                    </div>
                </div>
            <c:forEach var="vo1" items="${eventlist}">
                <div class="col-lg-4 col-md-6">
                    <div class="blog-item set-bg" data-setbg="${vo1.img_out}">
                        <div align="right" style="padding-top: 5px; padding-right: 5px;">
                        	<a href="eventUpdateFrom.do?title_name=${vo1.title_name }&event_id=${vo1.event_id}"><img alt="" src="../resources/img/icon_edit.png" width="40px;"></a>
                        	<a href="eventDelete.do?title_name=${vo1.title_name }&event_id=${vo1.event_id}"><img alt="" src="../resources/img/icon_trashCan.png" width="40px;"></a>
                        </div>
                        <div class="bi-text">
                            <span class="b-tag">${ vo1.kategorieOnEvnet}</span>
                            <h4 style="background-color: rgba(223, 169, 116, 0.6); border-radius: 3px; padding-left: 5px; padding-right: 5px; text-align: center;"><a href="../event/getEvent.do?title_name=${vo1.title_name }&event_id=${vo1.event_id}">${vo1.title_name }</a></h4>
                            <span class="b-tag"><i class="icon_clock_alt"> </i>${vo1.write_date.substring(0,10)}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
                        <div class="room-pagination" >
                            	<ul class="pagination" style=" justify-content: center;">
                            		<c:if test="${pageMaker.prev}">
                            			<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">Previous</a></li>
                            		</c:if>

	                            	<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
	                            		<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
	                            			<a href="${num }">${num }</a>
	                            		</li>                            	
	                            	</c:forEach>

									<c:if test="${pageMaker.next}">
                            			<li class="paginate_button previous"><a href="${pageMaker.endPage +1 }">Next</a></li>
                            		</c:if>
                            	</ul>
                            	
                        		<form id='actionForm' action="getAllEvent.do" method='get'>
									<input type="hidden" name='pageNum' value="${pageMaker.cri.pageNum }">
									<input type="hidden" name='amount' value="${pageMaker.cri.amount }">
								</form>
        </div>
    </section>
    <!-- Blog Section End -->
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

<script>
	var en = document.getElementById("en");
	$(function() {
		if(en != null){
			document.getElementById("event").outerHTML='<li id="event" class="active"><a href="../event/getAllEvent.do">Event</a></li>';
		}else{
			document.getElementById("event").outerHTML='<li id="event" class="active"><a href="../event/getAllEvent.do">이벤트</a></li>';
		}
		//<li id="aboutUs" class=active><a href="./about-us.html">About Us</a></li>
	});
	
	$(document).ready(function(){
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			
			e.preventDefault();
			
			console.log("click");
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			
			actionForm.submit();
			
		});
		
		$(".move").on("click",function(e){
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='event_id' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","getAllEvent.do");
			actionForm.submit();
			
		});
	});
</script>
</html>