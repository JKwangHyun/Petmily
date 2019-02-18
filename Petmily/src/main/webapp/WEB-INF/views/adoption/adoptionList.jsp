<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
<script src="resources/jqlib/jquery-3.2.1.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f264b44d614a364c2551241f9596ac9d&libraries=services,clusterer,drawing"></script>
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
	  border: 3px solid #5c5c5b;
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
	  color: #5c5c5b;
	}
	/*Checkboxes styles*/
	input[type="checkbox"] { display: none; }
	input[type="checkbox"] + label {
  		display: block;
  		position: relative;
  		padding-left:10px;
  		font: 13px/20px 'Open Sans', Arial, sans-serif;
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
	.petList {
		position:relative;float:left;width:250px;height:300px;background-color:white;margin:35px 10px;text-align:center;border-top-left-radius:10px;border-top-right-radius:10px;
	}
	.petlist a{
		text-decoration:none;
		color:black;
		font-weight:bold;
	}
	.pets{
		height:220px;
		width:90%;
		margin:10px auto;
		display:block;"
	}
	@keyframes animatetop {
		from {top:-300px; opacity:0}
		to {top:35%; opacity:1;display:none;}
	}
	/* 상세보기 팝업창 */
	#adoptionDetail {width:800px; height:1000px; background:#F8F8F8; border: 0px solid black; border-radius:20px;position:absolute ; top:35%; left:40%; margin:-250px 0 0 -200px; z-index:9999; display:none;
				-webkit-animation-name: animatetop;
  				-webkit-animation-duration: 0.4s;
  				animation-name: animatetop;
  				animation-duration: 0.4s
	} 
	#mask {width:100%; height:100%; position:fixed; background:rgba(0,0,0,0.7) repeat; top:0; left:0; z-index:999; display:none;} 
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
			// categoryCheck
			$('input[type="checkbox"][name="category"]').click(function(){
				if($(this).prop('checked')) {
					$('input[type="checkbox"][name="category"]').prop('checked', false);
					$(this).prop('checked', true);
				}
				
			});
			
			// categoryCheck-List
			$('input[type="checkbox"][name="category"]').click(function(){
				var pettype = $(this).val();
				if(pettype==1) $('#textArea').html('Dogs');
				else if(pettype==2) $('#textArea').html('Cats');
				else if(pettype==3) $('#textArea').html('Others');
				else $('#textArea').html('All');
				$.ajax({
					type:'Post',
					url:"categoryList",
					data:{
						PETTYPE:pettype,
					},
					success:function(result){
						$('#writingList').html(result)
					}
				});
			});
			
			
			
			
			var pettype = <%=(String)session.getAttribute("PetType") %> 
			if(pettype=="1") $('#textArea').html('Dogs');
			else if(pettype=='2') $('#textArea').html('Cats');
			else if(pettype=='3') $('#textArea').html('Others');
			else $('#textArea').html('All');
			
			$.ajax({
				type:'Post',
				url:"categoryList",
				data:{
					PETTYPE:pettype,
				},
				success:function(result){
					$('#writingList').html(result)
				}
			});
		});
	
	function adoptionDetail(n){
		$.ajax({
			type:'Post',
			url:"adoptionDetail",
			data:{
				seq:n,
				root:${list.ROOT},
			},
			success:function(result){
				$('#detailForm').html(result)
			}
		});
		$("#adoptionDetail").css("display", "block"); 
		$("#mask").css("display", "block"); 
		
	}
	
	
	
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
	<div id="adoptionList" style="position:relative;width:100%;height:300px;top:50px;">
		<div id="adoption_container" style="position:relative;width:500px;height:300px;margin:0 auto;">
			<div style="pointer-events:none;cursor:default;position:relative;top:30px; width:500px;height:100px;margin:0 auto;text-align:center;font-size:40px;font-family: 'Do Hyeon', sans-serif;color:#333;">분양 게시판</div>
			<!-- 검색창 -->
	    	<div class="container">
			    <div class="search-box-container">
				    <button class="submit"><i class="fa fa-search" style="padding-left: 15px;"></i></button>
				    <input class="search-box">
			    </div>
	    	</div>
	    	<!-- Check Box -->
	  			<div id="category" style="position:relative;margin:0 auto; width:500px;height:100px;border-radius:20px;top:120px;">
					<input type="checkbox" id="showall" class="petType"name="category" value="showall"  checked>
	   				<label for="showall" style="position:relative;top:20px;float:left;left:50px;"><font style="margin-left:25px;font-family:'Nanum Square';font-weight:bold;color:#333;">Show All</font></label>
   	    			<input type="checkbox" id="dogs" class="petType" name="category" value="1">
	  				<label for="dogs" style="position:relative;top:20px;left:175px;"><font style="margin-left:-55px;font-family:'Nanum Square';font-weight:bold;color:#333;">Dogs</font></label>
					<input type="checkbox" id="cats" class="petType" name="category" value="2">
	  				<label for="cats" style="position:relative;top:0px;left:275px;"><font style="margin-left:25px;font-family:'Nanum Square';font-weight:bold;color:#333;">Cats</font></label>
	  				<input type="checkbox" id="others" class="petType" name="category" value="3">
	  				<label for="others" style="position:relative;top:-20px;left:370px;"><font style="margin-left:25px;font-family:'Nanum Square';font-weight:bold;color:#333;">Others</font></label>
	  			</div>
		</div>
		</div>
		
		
		<div id="textArea"style="pointer-events:none;cursor:default;position:relative;top:50px; width:500px;height:60px;margin:0 auto;text-align:center;font-size:40px;font-family: 'Do Hyeon', sans-serif;color:#333;">All</div>
		<div id="writingList" style="position:relative;width:100%;height:750px;top:30px;">
		<div id="writingList_container" style="position:relative;width:1080px;height:750px;margin:0 auto">
			<c:forEach var="list" items="${list}">
				<c:choose>
					<c:when test="${list.COMPLETE eq 'N'}">
						<div class="petList" onclick="adoptionDetail(${list.SEQ})" style="cursor:pointer;">
							<img class="pets" src="resources/img/dog1.jpg"  />
							<c:choose>
							<c:when test="${list.PETGENDER eq '남'}">
								<i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							<c:when test="${list.PETGENDER eq '여'}">
								<i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							</c:choose>
							<i class="fas fa-eye" style="margin-top:10px;color:gray"> ${list.CNT}&nbsp;<i class="fas fa-thumbtack"> ${list.RESERVE}</i></i>
						</div>
					</c:when>
					
					<c:when test="${list.COMPLETE eq 'Y'}">
						<div class="petList" onclick="adoptionDetail(${list.SEQ})" style="cursor:pointer;opacity:0.5;">
							<img class="pets" src="resources/img/dog1.jpg"  />
							<c:choose>
							<c:when test="${list.PETGENDER eq '남'}">
								<i class="fas fa-mars"style="color:#4285F4;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							<c:when test="${list.PETGENDER eq '여'}">
								<i class="fas fa-venus" style="color:hotpink;"></i>&nbsp; ${list.PETKIND}  ${list.PETAGE}<br>
							</c:when>
							</c:choose>
							<font style="position:absolute;top:265px;left:85px;font-family: 'Do Hyeon', sans-serif;color:#da532c;font-size:20px;">분&nbsp;양&nbsp;완&nbsp;료</font>
						</div>
					</c:when>
				</c:choose>
				
			</c:forEach>
		</div>
	</div>
	
	<!-- 상세보기 팝업창 -->
	<div id="mask" style="position:fixed;"></div>
	<div id="adoptionDetail">
		<div id="detailForm">
		</div>
	
	</div>	
		
	
</body>
</html>