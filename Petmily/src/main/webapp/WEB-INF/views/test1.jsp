<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//cdn.rawgit.com/hiun/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" href="resources/css/signForm.css">
<link rel="stylesheet" href="resources/css/joinForm.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script src="/Petmily/jqlib/jquery-3.2.1.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1</title>
</head>
<script type="text/javascript">
$.fn.toggleState = function(b) {
	$(this).stop().animate({
		width: b ? "300px" : "40px"
	}, 600, "easeOutElastic" );
}

$(document).ready(function() {
	var container = $(".container");
	var boxContainer = $(".search-box-container");
	var submit = $(".submit");
	var searchBox = $(".search-box");
	var response = $(".response");
	var isOpen = false;
	submit.on("mousedown", function(e) {
		e.preventDefault();
		boxContainer.toggleState(!isOpen);
		isOpen = !isOpen;
		if(!isOpen) {
			handleRequest();
		} else {
			searchBox.focus();
		}	
	});
	searchBox.keypress(function(e) {
		if(e.which === 13) {
			boxContainer.toggleState(false);
			isOpen = false;
			handleRequest();
		}
	});
	searchBox.blur(function() {
		boxContainer.toggleState(false);
		isOpen = false;
	});
	  function handleRequest() {
		// You could do an ajax request here...
		var value = searchBox.val();
		searchBox.val('');
		if(value.length > 0) {
			response.text(('Searching for "' + value + '" . . .'));
			response.animate({
				opacity: 1
			}, 300).delay(2000).animate({
				opacity: 0
			}, 300);
		}
	}
	  
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
		
		// 네모 menu
		$("#square,#square_back,#square_menu").mouseover(function() {
			$("#square_back").css("display","block");
			$("#square_menu").css("display","block");
			$("#square").css("color","white");
		});
		$("#square,#square_back,#square_menu").mouseout(function() {
			$("#square_back").css("display","none");
			$("#square_menu").css("display","none");
			$("#square").css("color","gray");
		});
		
		// menu 선택 시 
		$("#dog").mouseover(function() {
			$("#dog").css("font-weight","bold");
		});
		$("#dog").mouseout(function() {
			$("#dog").css("font-weight","normal");
		});
		$("#cat").mouseover(function() {
			$("#cat").css("font-weight","bold");
		});
		$("#cat").mouseout(function() {
			$("#cat").css("font-weight","normal");
		});
		$("#other").mouseover(function() {
			$("#other").css("font-weight","bold");
		});
		$("#other").mouseout(function() {
			$("#other").css("font-weight","normal");
		});
		
		// 회원가입 팝업창
		$("#signUp1").click(function(){ 
			$("#signUp_wrap1").css("display", "block"); 
			$("#mask").css("display", "block"); 
		}); 
		$("#signUp_close1").click(function(){ 
			$("#signUp_wrap1").css("display", "none"); 
			$("#mask").css("display", "none"); 
		}); 
		
		// 로그인 팝업창
		$("#signIn").click(function(){ 
			$("#signIn_popup").css("display", "block"); 
			$("#mask").css("display", "block"); 
		}); 
		$("#signIn_close").click(function(){ 
			$("#signIn_popup").css("display", "none"); 
			$("#mask").css("display", "none"); 
		}); 
	});  
	

		//checkbox
		$(function() {
			$("#checkall").change(function() {
			// 전체선택 체크박스의 체크상태 판별
				var is_check = $(this).is(":checked");
			// 하위 체크박스에 체크상태 적용
			$(".check123").prop("checked", is_check);
		});
			$(".check123").change(function() {
			// 전체선택 체크박스의 체크상태 판별
			$("#checkall").prop("checked", false);
		});
			
			
	// 화면
		$(window).resize(function() {
			if ($(window).width() > 1400) {
				$("#content2_container").css("width", "1060px");
				$("#content3").css("height", "750px");
				$("#petList_container").css("width", "1080px");
				$("#petList_container").css("height", "750px");
			}

			else if ($(window).width() < 1100) {
				$("#content2_container").css("width", "510px");
				$("#content3").css("height", "1500px");
				$("#petList_container").css("width", "540px");
				$("#petList_container").css("height", "1500px");
			} else if ($(window).width() < 1400) {
				$("#content2_container").css("width", "790px");
				$("#content3").css("height", "1100px");
				$("#petList_container").css("width", "820px");
				$("#petList_container").css("height", "1100px");
			}
		});
	});
</script>

<style>
	body {
		margin: 0px;
		padding: 0px;
	}
	.petList {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;
	}
	.petlist a{
	text-decoration:none;
	color:black;
	font-weight:bold;
	}
	.petList2 {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;
	}
	.petlist2 a{
	text-decoration:none;
	color:black;
	font-weight:bold;
	}
	* {
  		box-sizing: border-box;
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
	.container:before {
  		content: '';
  		display: block;
  		position: absolute;
  		width: 150%;
  		height: 100%;
  		top: 0;
  		left: -25%;
  		-moz-transform: rotate(-3deg);
  		-webkit-transform: rotate(-3deg);
  		-o-transform: rotate(-3deg);
  		-ms-transform: rotate(-3deg);
  		transform: rotate(-3deg);
  		z-index: -1;
  	
	} 
	.search-box-container {
  		display: inline-block;
  		box-sizing: content-box;
  		height: 40px;
  		width: 40px;
  		padding: 0;
  		background-color: #fff;
  		border: 3px solid #5c5c5b;
  		border-radius: 28px;
  		overflow: hidden;
  		margin:0 auto;
	}
	.search-box-container * {
  		display: inline-block;
  		margin: 0;
  		height: 100%;
  		padding: 5px;
  		border: 0;
  		outline: none;
  		position:relative;
  		margin:0 auto;
	}
	.search-box {
  		width: calc(100% - 50px);
  		padding: 0 20px;
  		float: left;
  		font-family: "Lato";
  		font-size: 1em;
  		color: #212121;
  		background-color: #fff;
	}
	.submit {
  		float: right;
  		width: 40px;
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
  		color:#5c5c5b;

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
	.menu_slide {
		list-style:none;
		font-weight:bold;
		margin-top:10px;
    	padding-left:0px;
	}
	.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
	#square_menu a{
		text-decoration:none;
		color:white;
	}
	
	/* 로그인 팝업창 */
	#signIn_popup {
		width:550px;
		height:400px; 
		background:#f0efef; 
		border: 0px solid black; 
		border-radius:20px;
		position:fixed; top:50%; left:46%; margin:-250px 0 0 -200px; z-index:9999; display:none;
		-webkit-animation-name: animatetop;
  		-webkit-animation-duration: 0.4s;
  		animation-name: animatetop_signIn;
  		animation-duration: 0.4s
	} 
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
	#signIn_close {z-index:9999;color:#333;font-size:20px;position: absolute;right:10; top:10;cursor:pointer;}
	
	@-webkit-keyframes animatetop_signIn {
		from {top:-300px; opacity:0} 
 		to {top:50%; opacity:1}
	}
	@keyframes animatetop_signIn {
		from {top:-300px; opacity:0}
		to {top:50%; opacity:1}
	}
	
	/*회원가입 팝업창 */
	/* 팝업 내용 */
	#signUp_wrap1 {width:600px; height:800px; background:#f0efef; border: 0px solid black; border-radius:20px;position:fixed; top:35%; left:45%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	/* 팝업 뒷 배경 */
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
	/* Add Animation */
	@-webkit-keyframes animatetop {
		from {top:-300px; opacity:0} 
 		to {top:50%; opacity:1}
	}
	@keyframes animatetop {
		from {top:-300px; opacity:0}
		to {top:35%; opacity:1}
	}
	
	/*Checkboxes styles*/
	input[type="checkbox"] { display: none; }

	input[type="checkbox"] + label {
  		display: block;
  		position: relative;
  		padding-left:10px;
  		font: 14px/20px 'Open Sans', Arial, sans-serif;
  		color: #ddd;
  		cursor: pointer;
  		-webkit-user-select: none;
  		-moz-user-select: none;
  		-ms-user-select: none;
  
	}

	input[type="checkbox"] + label:last-child { margin-bottom: 0; }

	input[type="checkbox"] + label:before {
  		content: '';
  		display: block;
  		width: 20px;
  		height: 20px;
  		border: 2px solid #da532c;
  		border-radius:9px;
  		position: absolute;
  		left: 0;
  		top: 0;
  		opacity: .6;
  		-webkit-transition: all .12s, border-color .08s;
  		transition: all .12s, border-color .08s;
	}

	input[type="checkbox"]:checked + label:before {
  		width: 10px;
  		top: -5px;
  		left: 5px;
  		border-radius: 0;
  		opacity: 1;
  		border-top-color: transparent;
  		border-left-color: transparent;
  		-webkit-transform: rotate(45deg);
  		transform: rotate(45deg);
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

<body>

	<!-- header -->
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:#333;">
		<div style="position:absolute;width:97%;height:40px;margin:0 auto;padding-top:6px;left:40px;">
			<a href=""><img src="resources/img/logo6.png" width="140px" height="40px" style="float:left;"/></a>
			<ul id="menu" style="position:relative;top:-8px;float:left;">
				<li id="community"><a href="#">Community</a></li>
				<li id="adoption"><a href="#">Adoption Of Pets</a></li>
				<li><a href="#">Find Pet Hospital</a></li>
			</ul>
			<ul id="sign" style="position:relative;top:-8px;float:right;">
				<li id="signIn">Sign In</li>
				<li id="signUp1">Sign Up</li>
			</ul>
		</div>
	</div>
	
	<!-- Community slide -->
	<div id="menu_slide_Community" style="position:absolute;width:190px;height:85px;background-color:#333;z-index:10;left:220px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Notice</a></li>
			<li><a href="">Sharing Info</a></li>
		</ul>
	</div>
	
	<!--  Adoption Of Pets slide -->
	<div id="menu_slide_Adoption" style="position:absolute;width:190px;height:85px;background-color:#333;z-index:10;left:337px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
		<ul class="menu_slide">
			<li style="margin-bottom:15px;"><a href="">Registration</a></li>
			<li><a href="">Adoption</a></li>
		</ul>
	</div>

	
	
	<div id="content1" style="position:relative;width:100%;height:480px;background-color:white;">
		<div style="position:relative;margin:0 auto; width:1200px;height:480px;">
			<div style="position:relative;float:left;width:800px;height:100%;">
				<pre style="position:relative ;display:block; top:100;left:-180;">
					<font size="35" style="font-family: 'Nanum Square';font-weight:bold;">Animal is</font>
					<font size="35" style="font-family: 'Nanum Square';font-weight:bold;">Love</font>
					<font size="35" style="font-family: 'Nanum Square';font-weight:bold;">with PetMily</font>
				</pre>
				<div style="position:relative;top:100;left:80;">
					<input type="button" value="Sign Up" style="padding:10px 25px;border:none; border-radius:10px;color:white;font-size:20px;font-weight:bold;background-color:#333">
					<input type="button" value="Adoption" style="margin-left: 10px;padding:10px 25px;border:none;border-radius:10px;color:white;font-size:20px;font-weight:bold;background-color:#333">
				</div>
			</div>
			<div style="position:relative;float:left;width:400px;height:100%;">
				<iframe src="https://giphy.com/embed/8UHB9thDBfbOTaRJNn" width="280px" height="280px" style="position:absolute;pointer-events:none;cursor:default;top:100px;left:80px;" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>
			</div>
		</div>
	</div>
	
	<div id="content2" style="position:relative;width:100%;height:50px;background-color:#F7F7F7;margin:0 auto;">
    	<div id="content2_container" style="position:relative;width:1060px;height:50px;margin:0 auto">
	    	<div class="container">
			    <div class="search-box-container">
				    <button class="submit"><i class="fa fa-search" style="padding-left: 5px;"></i></button>
				    <input class="search-box">
			    </div>
	    	</div>
	    	<div id="square_back" style="position:absolute;width:50px;height:40px;right:-10;margin-top:5px;background-color:#333;border-top-left-radius:5px;border-bottom-left-radius:5px;display:none;opacity:0.5"></div>
			  <div id="square_menu" style="position:absolute;z-index:10;margin-top:5px;right:-160;width:150px;height:200px;background-color:#333;border-bottom-left-radius:5px;border-top-right-radius:5px;border-bottom-right-radius:5px;display:none;opacity:0.5">
	    		<div style="width:150px;height:50px;text-align:center;color:white;font-size:20;pointer-events:none;cursor:default;">Select</div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href=""  id="dog"><i class="fas fa-dog"></i> Dogs</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="" id="cat"><i class="fas fa-cat"></i> Cats</a></div>
	    		<div style="width:150px;height:50px;text-align:center;color:white;"><a href="" id="other"><i class="fas fa-paw"></i> Others</a></div>
	    	</div>
	    	<i id="square" class="fas fa-th-large" style="position:absolute;right:0;margin-top:11px;font-size:30px;color:gray"></i>
   		</div>
	</div>
	

	<div id="content3" style="position:relative;width:100%;height:700px;background-color:#f0efef;">
		<div id="petList_container" style="position:relative;width:1080px;height:320px;margin:0 auto">
			<div class="petList" >
				<img class="pets" src="resources/img/dog1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 미니 핀  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 2</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/dog3.jpg"  />
				<a href="" >
				<i class="fas fa-venus" style="color:hotpink;"></i> 
				<i class="fas fa-venus" style="color:hotpink;"></i> 
				<i class="fas fa-mars"style="color:#4285F4;"></i>
				 포메라니안  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 2</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/cat1.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 고양이  5개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 37&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
			<div class="petList">
				<img class="pets" src="resources/img/rabbit1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 토끼  1살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 37&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/cat2.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 페르시안  4개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 39&nbsp;<i class="fas fa-thumbtack"> 5</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/hamster1.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 햄스터 2살</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 13&nbsp;<i class="fas fa-thumbtack"> 0</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/dog2.jpg"  />
				<a href="" ><i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; 푸들 6개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 29&nbsp;<i class="fas fa-thumbtack"> 7</i></i>
			</div>
			<div class="petList2">
				<img class="pets" src="resources/img/cat3.jpg"  />
				<a href="" ><i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; 랙돌 5개월</a><br>
				<i class="fas fa-eye" style="margin-top:10px;color:gray"> 30&nbsp;<i class="fas fa-thumbtack"> 6</i></i>
			</div>
		</div>
		</div>
		
			
	
	
	<!-- 로그인 팝업창 -->
	<div id="mask"></div>
	<div id="signIn_popup">
		<form id="signIn_form" action="#">
	  		<h1 style="pointer-events:none;cursor:default;">Sign In</h1>
	  		<div class="question">
	    		<input type="text" required/>
	    		<label>UserID</label>
	  		</div>
	 		 <div class="question">
	    		<input type="password" required/>
	   			<label>Password</label>
	  		</div>
	  		<input type="button" value="로그인">
	  		<i id="findid" class="fas fa-user" style="margin-left:170px;cursor:pointer;color:#333;"> Find ID</i>
	  		<i id="findpw" class="fas fa-key" style="margin-left:20px;cursor:pointer;color:#333;"> Find PW</i>
		</form>
		<i id="signIn_close" class="fas fa-sign-out-alt"></i>
	</div>
	
	<!-- 이용약관 팝업창 -->
	<div id="mask"></div>
	<div id="signUp_wrap">
		<form id="joincheck" action="" style="margin-top:100px;text-align:center;">
		  <div class="boxes" style="padding-left:100px;">
		  	 <input type="checkbox" id="checkall" name="checkall" value="all" style="float:center;">
  			 <label for="checkall" style="width:425px;"><font style="font-family: 'Nanum Square';font-weight:bold;color:#333;">이용약관,개인정보 수집 및 이용과 메일 수신에 <b style="color:#da532c;">모두</b> 동의합니다.</font></label>
		  </div>
		  <div style="margin-top:35px;">
			<textarea rows="7" cols="58" style="resize:none;border-radius:10px;background-color:#f0efef;">
Petmily 서비스를 이용해 주셔서 감사합니다. 
본 약관은 다양한 Petmily 서비스의 이용과 관련하여
Petmily 서비스를 제공하는 Petmily와 이를 이용하는 
Petmily 서비스 회원 또는 비회원과의 관계를 설명하며,
아울러 여러분의 Petmily 서비스 이용에 도움이 될 수 있는 
유익한 정보를 포함하고 있습니다.
			</textarea>
		  </div>	
		  <div class="boxes" style="padding-left:100px;margin-top:20px;">
		  	 <input type="checkbox" id="check1" name="check1" class="check123" value="1">
  			 <label for="check1" style="width:240px;left:100px;"><font style="font-family: 'Nanum Square';font-weight:bold;color:#333;">Petmily 이용 약관 동의<b style="color:#da532c;"> (필수)</b></font></label>
		  </div>
		   <div style="margin-top:30px;">
			<textarea rows="16" cols="58" style="resize:none;border-radius:10px;background-color:#f0efef;">
정보통신망법 규정에 따라 Petmily에 회원가입 신청하시는 분께 수집하는 개인정보의 항목,
개인정보의 수집 및 이용목적,개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색 등 대부분의 Petmily 서비스를 회원과 동일하게 이용할 수 있습니다.
이용자가 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우,Petmily는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 네이버가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시에 ‘아이디,비밀번호,이름,생년월일,가입인증 휴대전화번호’를 필수항목으로 수집합니다.
			</textarea>
		  </div>
		  <div class="boxes" style="padding-left:100px;margin-top:20px;">
		  	 <input type="checkbox" id="check2" name="check2"class="check123" value="2">
  			 <label for="check2" style="width:220px;left:100px;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">개인정보 수집 동의<b style="color:#da532c;"> (필수)</b></font></label>
		  </div>
		  <div class="boxes" style="padding-left:100px;margin-top:20px;">
		  	 <input type="checkbox" id="check3" name="check3"class="check123" value="3">
  			 <label for="check3" style="width:220px;left:100px;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">메일/문자 수신 동의<b style="color:gray"> (선택)</b></font></label>
		  </div>
		  <div class="buttonnn" style="margin-top:80px;" >
		  <button type="submit" style="right:40;float:right;">NEXT&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></button>
		  <button id="signUp_close" style="left:40;float:left;"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;BACK</button>
		  </div>
		</form>
		
	</div>
	
	<!-- 회원가입 팝업창 -->
	<div id="mask"></div>
	<div id="signUp_wrap1">
		<form action="">
		 <div style="position:relative;top:100px;display: grid;">		
		  <label for="id" class="inp">
  		  	<input type="text" id="id" name="id" placeholder="&nbsp;">
  	      	<span class="label">아이디</span>
          	<span class="border"></span>
	      </label>
	      <label for="pw" class="inp" style="top:20px;">
  		  	<input type="password" id="pw" name="pw" placeholder="&nbsp;">
  	      	<span class="label">비밀번호</span>
          	<span class="border"></span>
	      </label>
	      <label for="pwcheck" class="inp" style="top:40px;">
  		  	<input type="password" id="pwcheck" name="pwcheck" placeholder="&nbsp;">
  	      	<span class="label">비밀번호 확인</span>
          	<span class="border"></span>
	      </label>
	       <label for="name" class="inp" style="top:60px;">
  		  	<input type="text" id="name" name="name" placeholder="&nbsp;">
  	      	<span class="label">이름</span>
          	<span class="border"></span>
	      </label>
	      </div>
	      <div style="position:relative;top:100px;left:200px;">
	      <input type="checkbox" id="checkM" name="checkM"value="M">
  		  <label for="checkM" style="position:relative;top:80px;float:left;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">남성</font></label>
  		  <!-- </div> -->
  		  <!-- <div style="position:relative;top:100px;left:300px;"> -->
  		  <input type="checkbox" id="checkF" name="checkF"value="F">
  		  <label for="checkF" style="position:relative;top:80px;left:110px;"><font style="font-family:'Nanum Square';font-weight:bold;color:#333;">여성</font></label>
	      </div>
		  <div class="buttonnn" style="margin-top:300px;" >
		  <button type="submit" style="right:40;float:right;">NEXT&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-right"></i></button>
		  <button id="signUp_close1" style="left:40;float:left;"><i class="fas fa-arrow-left"></i>&nbsp;&nbsp;&nbsp;BACK</button>
		  </div>
		</form>
	</div>
	
</body>
</html>