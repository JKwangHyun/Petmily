<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1</title>
</head>

<script type="text/javascript">

$.fn.toggleState = function(b) {
	$(this).stop().animate({
		width: b ? "300px" : "50px"
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
});
</script>

<style>
	body {
		width:100%;
		margin: 0 auto;
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
  		height: 50px;
  		width: 50px;
  		padding: 0;
  		background-color: #fff;
  		border: 3px solid #f44336;
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
  		color: #212121;
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
  		color: #d32f2f;
	}
</style>

<body>
	<div style="position:relative;width:100%;height:50px;background-color:black;"></div>
	<div style="position:relative;width:100%;height:480px;background-color:white;"></div>
	<div style="position:relative;width:100%;height:50px;background-color:#F7F7F7;">
		<div class="container">
  			<div class="search-box-container">
    			<button class="submit"><i class="fa fa-search"></i></button>
    			<input class="search-box">
  			</div>
		</div>
		<!-- <i class="fas fa-th-large" style="position:relative;float:left;margin-left:270px;margin-top:10px;font-size:30px;color:gray"></i> -->
	</div>
	<div style="position:relative;width:100%;height:320px;background-color:#f0efef;margin:0 auto;">
		<div style="position:relative;float:left;width:250px;height:250px;background-color:white;margin-top: 35px;margin-left:240px;margin-right: 10px;"></div>
		<div style="position:relative;float:left;width:250px;height:250px;background-color:white;margin:35px 10px"></div>
		<div style="position:relative;float:left;width:250px;height:250px;background-color:white;margin:35px 10px"></div>
		<div style="position:relative;float:left;width:250px;height:250px;background-color:white;margin:35px 10px"></div>
	</div>
</body>
</html>