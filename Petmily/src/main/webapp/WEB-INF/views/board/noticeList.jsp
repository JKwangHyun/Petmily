<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<link rel="stylesheet" href="resources/css/joinForm.css">
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
		background-color:#f0efef;
	}
	li a {
		font-size:16px;
		display:block;
		margin:0px 15px;
		text-decoration:none;
		color:white;
	}
	#menu li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		height:37px;
	}
	#sign li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		margin:0px 15px;
		color:white;
		cursor:pointer;
	}
	#menu li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		height:37px;
	}
	#sign li {
		float:left;
		list-style:none;
		display:inline-block;
		font-weight:bold;
		margin:0px 15px;
		color:white;
		cursor:pointer;
	}
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
	.container {
        display: block;
		position: absolute;
        text-align: center;
        width: 100%;
        top: 50%;
        padding: 50px 0;
        -moz-transform: translateY(-50%);
        -webkit-transform: translateY(-50%);
        -o-transform: translateY(-50%);
        -ms-transform: translateY(-50%);
        transform: translateY(-50%);
        
	}
	.search-box-container {
	  display: inline-block;
	  box-sizing: content-box;
	  height: 40px;
	  width: 40px;
	  padding: 0;
	  background-color: #fff;
	  border: 3px solid #FBBC05;
	  border-radius: 28px;
	  overflow: hidden;
	}
	.search-box-container * {
	  display: inline-block;
	  margin: 0;
	  height: 100%;
	  padding: 5px;
	  border: 0;
	  outline: none;
	}
	.search-box {
	  width: calc(100% - 50px);
	  padding: 0 20px;
	  float: left;
	  font-family: "Lato";
	  font-size: 1em;
	  color: #333;
	  background-color: #fff;
	}
	.submit {
	  float: right;
	  width: 50px;
	  left: 0;
	  top: 0;
	  font-size: 1.2em;
	  text-align: center;
	  cursor: pointer;
	  background-color: #fff;
	}
	.fa {
	  display: inline !important;
	  line-height: 100%;
	  pointer-event: none;
	  color: #FBBC05;
	}
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
	#noticeInsert {width:600px; height:800px; background:#f0efef; border: 0px solid black; border-radius:20px;position:fixed; top:35%; left:45%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	@-webkit-keyframes animatetop {
		from {top:-300px; opacity:0} 
 		to {top:50%; opacity:1}
	}
	@keyframes animatetop {
		from {top:-300px; opacity:0}
		to {top:35%; opacity:1;display:none;}
	}
	.buttonnn button{
		position:relative;
		font-family:'Nanum Square';
		font-weight:bold;
		font-size:25px;
		color:#333;
		opacity:0.5;
		border:none;
		background-color:#f0efef;
	}

	 
</style>
<script>

$.fn.toggleState = function (b) {
	$(this).stop().animate(
		{
		width: b ? "400px" : "40px" },
    	600,"easeOutElastic");
};
$(document).ready(function(){
	// menu_slide 
	$("#menu_slide_Community,#menu_slide_Adoption").css("display","none");
	$("#community,#menu_slide_Community").mouseout(function() {
		$("#menu_slide_Community").stop().slideUp("fast");
	});
	$("#community,#menu_slide_Community").mouseover(function() {
		$("#menu_slide_Community").stop().slideDown("fast");
	});
	$("#adoption,#menu_slide_Adoption").mouseout(function() {
		$("#menu_slide_Adoption").stop().slideUp("fast");
	});
	$("#adoption,#menu_slide_Adoption").mouseover(function() {
		$("#menu_slide_Adoption").stop().slideDown("fast");
	});
	
	/* 검색창 */
	var container = $(".container");
	var boxContainer = $(".search-box-container");
	var submit = $(".submit");
	var searchBox = $(".search-box");
	var response = $(".response");
	var isOpen = false;
	submit.on("mousedown", function (e) {
		e.preventDefault();
		boxContainer.toggleState(!isOpen);
		isOpen = !isOpen;
		if (!isOpen) {
			handleRequest();
		} else {
			searchBox.focus();
		}
	});
	searchBox.keypress(function (e) {
		if (e.which === 13) {
			boxContainer.toggleState(false);
			isOpen = false;
			handleRequest();
		}
	});
	searchBox.blur(function () {
		boxContainer.toggleState(false);
		isOpen = false;
	});
	function handleRequest() {
		var value = searchBox.val();
		searchBox.val("");
		if (value.length > 0) {
			response.text('Searching for "' + value + '" . . .');
			response.
			animate(
			{
				opacity: 1 },
			300).
			delay(2000).
			animate(
			{
				opacity: 0 },
			300);
		}
	}
	
	if(${Login.id=='admin'}){
		$('#write').html('<input type="button" value="새 글 등록" id="insertForm" style="border:none;background-color:#F8F8F8;border-radius:10px;padding:10px 15px;">');
	}
	
	// 새 글 쓰기 팝업창
	$("#insertForm").click(function(){ 
		$("#noticeInsert").css("display", "block"); 
		$("#mask").css("display", "block"); 
	}); 
	$("#nInsert_close").click(function(){ 
		$("#noticeInsert").css("display", "none"); 
		$("#mask").css("display", "none"); 
	});
});
	
</script>
<body>
	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href="home"><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="adoption"><a href="#">Adoption Of Pets</a></li>
				<li id="community"><a href="#">Community</a></li>
				<li><a href="#">Find Pet Hospital</a></li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<c:choose>
					<c:when test="${Login.id == null}">
						<li id="signIn">Sign In</li>
						<li id="signUp">Sign Up</li>
					</c:when>
					<c:when test="${Login.id != null}">
						<li><a href="myPage"><i class="fas fa-user-circle" style="font-size:25px;margin-top:-1px;"></i><font style="position:relative;top:-2px;"> ${Login.name} 님</font></a></li>
						<li><a href="logout" style="margin:0;">Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
			
		</div>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:170px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Registration</a></li>
			<li><a href="">Adoption</a></li>
		</ul>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:150px;height:85px;background-color:#333;z-index:10;left:385px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Notice</a></li>
			<li><a href="">Sharing Info</a></li>
		</ul>
	</div>
	
	<!-- 중앙화면 -->
	<div id="noticeList" style="position:relative;width:100%;height:850px;top:50px;">
		<div id="notice_container" style="position:relative;width:500px;height:300px;margin:0 auto;">
			<div style="pointer-events:none;cursor:default;position:relative;top:30px; width:500px;height:100px;margin:0 auto;text-align:center;font-size:40px;font-family: 'Do Hyeon', sans-serif;color:#333;">공지사항</div>
			<!-- 검색창 -->
	    	<div class="container">
			    <div class="search-box-container">
				    <button class="submit"><i class="fa fa-search" style="padding-left: 15px;"></i></button>
				    <input class="search-box">
			    </div>
	    	</div>
	    	<div id="write" style="position:relative;width:100px;left:640px;top:40px;"></div>
	    </div>
	    <!-- list -->
	    	<div style="position:relative;width:1000px;margin:0 auto;top:-80px;">
	    		<table style="width:1000px;margin:0 auto;border-radius:10px;">
					<tr align="center" height="35" style="font-size:15px;background-color:#F8F8F8;font-weight:bold;">
						<td style="width:5%;">번호</td><td style="width:70%;">제목</td><td>등록일</td><td>조회수</td>
					</tr>
				<c:forEach var="nt" items="${notice}">
					<tr align="left" height="45" >
						<td style="text-align: center;">${nt.SEQ}</td>
						<td><a href="noticeDetail?seq=${nt.SEQ}&title=${nt.TITLE}" style="text-decoration:none;color:#333;"> ${nt.TITLE}</a></td>
						<td style="text-align: center;">${nt.NDATE}</td>
						<td style="text-align: center;">${nt.CNT}</td>
					</tr>
				</c:forEach>
				</table>
				<!-- Paging Code 추가 -->
				<table style="postion:relative;margin:0 auto;">
				<tr>
					<td colspan=5 align="center" height="100px"
						style="text-align: center;"><c:forEach var="i" begin="1"
							end="${totalPage}">
							<c:choose>
								<c:when test="${i==currPage}">
									<font size=4.5>${i}</font>&nbsp;
					</c:when>
								<c:otherwise>
									<a href="plist?currPage=${i}">${i}</a>&nbsp;
					</c:otherwise>
							</c:choose>
						</c:forEach></td>
				</tr>
				</table>
			
	    	</div>
		</div>
		<!-- 새 글 등록 팝업창 -->
	<div id="mask"></div>
	<div id="noticeInsert">
		<form id="nInsert_form" action="noticeInsert" autocomplete="off">
		 <div style="position:relative;top:100px;display: grid;">		
		  <label for="title" class="inp">
  		  	<input type="text" id="title" name="title" placeholder="&nbsp;" style="width:400px;position:relative;right:50px;">
  	      	<span class="label"style="left:-40px;">제목</span>
          	<span class="border" style="width:400px;left:-50px;"></span>
	      </label>
	      </div>
	      <div style="position:relative;top:130px;">
	      <textarea id="content"name="content"rows="30" cols="54" placeholder="내용" style="resize:none;border-radius:10px;background-color:#f0efef;position:relative;left:110px;">
     	  </textarea>
	      </div>
		    <div class="buttonnn" style="position:absolute; top:710px;width:600px;" >
			    <button type="submit" style="right:40;float:right;">등록&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></button>
			    <button id="nInsert_close" style="left:40;float:left;"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;취소</button>
		    </div>
		</form>
	</div>
</body>
</html>