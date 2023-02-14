<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"); %>
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
<script>
function loadFile(input){
	if(input.id == "imgOne_load"){
		var fr = new FileReader();
		fr.onload=function(event){
			document.getElementById('imgOne').src=event.target.result;
		};
		fr.readAsDataURL(input.files[0]);
	}else if(input.id == "imgTwo_load"){
		var fr = new FileReader();
		fr.onload=function(event){
			document.getElementById('imgTwo').src=event.target.result;
		};
		fr.readAsDataURL(input.files[0]);
	}else if(input.id == "imgThree_load"){
		var fr = new FileReader();
		fr.onload=function(event){
			document.getElementById('imgThree').src=event.target.result;
		};
		fr.readAsDataURL(input.files[0]);
	}else if(input.id == "img_title_load"){
		var fr = new FileReader();
		fr.onload=function(event){
			//alert(event.target.result);
			document.getElementById('img_title').style.backgroundImage="url("+event.target.result+")";
		};
		fr.readAsDataURL(input.files[0]);
	}else if(input.id == "img_out_load"){
		var fr = new FileReader();
		fr.onload=function(event){
			//alert(event.target.result);
			document.getElementById('img_out').style.backgroundImage="url("+event.target.result+")";
		};
		fr.readAsDataURL(input.files[0]);
	}else{
		document.getElementById('imgOne').src="";
	}
}
function Textarea_add() {
	$('#text_img_append').append("<div class=bm-item><h4><textarea rows=1 cols=71 style=width:100% data-lang='subtitle'></textarea></h4><textarea rows=20 cols=115 style=width:100% data-lang='add_contents'></textarea></div>")
}
function Imgarea_add(){
	$('#text_img_append').append('<div class="bd-pic"><div class="bp-item"><label for="imgOne_load"><img id="imgOne" src="img/uploadIMG/upLoad.jpg"  alt=""></label><input type="file" accept="image/jpeg,image/gif,image/png" id="imgOne_load"  onchange="loadFile(this)"  style="display: none;"></div><div class="bp-item"><label for="imgTwo_load"><img id="imgTwo" src="img/uploadIMG/upLoad.jpg"  alt=""></label><input type="file" accept="image/jpeg,image/gif,image/png" id="imgTwo_load"  onchange="loadFile(this)"  style="display: none;"></div><div class="bp-item"><label for="imgThree_load"><img id="imgThree" src="img/uploadIMG/upLoad.jpg"  alt=""></label><input type="file" accept="image/jpeg,image/gif,image/png" id="imgThree_load"  onchange="loadFile(this)"  style="display: none;"></div></div>')
}
</script>
<body>
<jsp:include page="../section/header.jsp"/>
<br>
	<form action="eventInsert.do" enctype="multipart/form-data" method="post">
        <div class="container">
            <div align="center">
            	<h4 data-lang="event_thumbnail"></h4>
                <div class="col-lg-4 col-md-6" align="left">
                    <div class="blog-item set-bg" data-setbg="../resources/img/defaultIMG/Ot_default.jpg" id="img_out" >
                    	<br>
                    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span  style="text-align:center; vertical-align: top;  background-color: #dfa974; border-radius: 3px; padding:5px; padding-bottom: 0px; display:inline-block; width: 80%;">
                    		<label for="img_out_load"><h5 align="center" data-lang="edit_btn"></h5></label>
                    	</span>
                        <div class="bi-text">
                            <span class="b-tag" data-lang="event_kategorie"></span>
                            <h4 ><a style="background-color: #dfa974; border-radius: 3px; padding-left: 5px; padding-right: 5px;" data-lang="title"></a></h4>
                            <span class="b-tag"><i class="icon_clock_alt"><h6 style="color: white" data-lang="date_created"></h6></i></span>
                             <input type="file" accept="image/jpeg,image/gif,image/png" id="img_out_load" name="img_out" onchange="loadFile(this)"  style="display: none;">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Blog Details Hero Section Begin -->
    
    <section class="blog-details-hero set-bg" id=img_title data-setbg="../resources/img/defaultIMG/t_default.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="bd-hero-text">
                        <span>
                        	<select name="kategorieOnEvnet">
                        	<!-- ************ 카테고리 정한 후 언어처리 하기 **************** -->
                        		<option value="Travel Trip & Camping">카테고리 선택</option>
                        		<option value="value2">카테고리2 선택</option>
                        	</select>
                        </span>
                        <h2><textarea class="insert_textarea_from" name="title_name" rows="1" cols="20" style="width:100%; text-align: center" required="required" data-lang="title"></textarea></h2>
                        <ul>
                            <li class="b-time"><i class="icon_clock_alt"></i> <input type="date" name="write_date" value="<%=sf.format(nowTime)%>"></li>
                            <li><i class="icon_profile"></i> <textarea class="insert_textarea_from"  name="writerOnEvnet" rows="1" cols="15" style="width:80%; vertical-align: middle; text-align: center;" required="required" data-lang="manager"></textarea></li>
                        </ul><br><br><br>
                        	<label for="img_title_load" style="color: white; background-color: #666666;" data-lang="event_titleImg"></label>
                        <input type="file" accept="image/jpeg,image/gif,image/png" id="img_title_load" name="img_title" onchange="loadFile(this)" style="display: none;">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Details Hero End -->

    <!-- Blog Details Section Begin -->
    <section class="blog-details-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="blog-details-text">
                        <div class="bd-title">
                            <textarea class="insert_textarea_from"  name="prologOnevnet" rows="20" cols="115" style="width:100%" data-lang="add_prologue"></textarea>
                        </div>
                        <div class="bd-pic">
                        	
                            <div class="bp-item">
	                            <label for="imgOne_load">
	                                <img id="imgOne" src="../resources/img/uploadIMG/upLoad.jpg"  alt="">
	                            </label>
	                            <input type="file" accept="image/jpeg,image/gif,image/png" id="imgOne_load" name="imgOne" onchange="loadFile(this)" style="display: none;">
                            </div>		<!-- img/uploadIMG/upLoad.png -->
                            			<!-- img/blog/blog-details/blog-details-1.jpg -->
                            
                            <div class="bp-item">
	                            <label for="imgTwo_load">
	                                <img id="imgTwo" src="../resources/img/uploadIMG/upLoad.jpg"  alt="">
	                            </label>
    	                        <input type="file" accept="image/jpeg,image/gif,image/png" id="imgTwo_load" name="imgTwo"   onchange="loadFile(this)" style="display: none;">
                            </div>
                            <div class="bp-item">
            	                <label for="imgThree_load">
        	                        <img id="imgThree" src="../resources/img/uploadIMG/upLoad.jpg"  alt="">
    	                        </label>
	                            <input type="file" accept="image/jpeg,image/gif,image/png" id="imgThree_load" name="imgThree"   onchange="loadFile(this)" style="display: none;">
                            </div>
                        </div>
                        <div class="bd-pic" id="text_img_append">
                        </div>
                        <div class="bd-more-text">
                            <div class="bm-item">
                                <h4><textarea class="insert_textarea_from" name="subTitleOnEvnet" rows="1" cols="71" style="width:100%" data-lang="subtitle"></textarea></h4>
                                <textarea class="insert_textarea_from" name="textOnsubTitle" rows="20" cols="115" style="width:100%" data-lang="add_contents"></textarea>
                            </div>
 							<div align="center">
                            	<button type="submit" class="button_blog_details_go_list" data-lang="save_btn"></button>
	                  		</div>                           	
                        </div>
                        <div class="tag-share">
                            <div class="tags">
                            <!-- ************* 카테고리 정한 후 언어처리 하기 ************ -->
                                <a href="#">Travel Trip</a>
                                <a href="#">Camping</a>
                                <a href="#">Event</a>
                            </div>
                            <div class="social-share">
                                <span data-lang="share"></span>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-tripadvisor"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                            </div>
                        </div>
                        <div class="leave-comment">
                            <h4 data-lang="leave_a_comment"></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </form>
    <!-- Blog Details Section End -->

    <!-- Recommend Blog Section Begin -->

    <!-- Recommend Blog Section End -->
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
</script>
</html>