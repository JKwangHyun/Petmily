<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test1</title>
</head>
<style>
	body {
		margin: 0px;
		padding: 0px;
	}
	.petList {
		position:relative;float:left;width:250px;height:250px;background-color:white;margin:35px 10px
	}
	
</style>
<body>
	<div id="headbar" style="position:relative;width:100%;height:50px;background-color:black;">
	</div>
	
	<div id="content1" style="position:relative;width:100%;height:480px;background-color:white;">
	</div>
	
	<div id="content2" style="position:relative;width:100%;height:50px;background-color:#F7F7F7;">
		<div style="position:relative;width:550px;height:50px;margin:0 auto">
			<input type="search" style="border-radius:10px;width:450px;height:30px;margin-top:10px; position:relative;float:left;"/>
			<i class="fas fa-th-large" style="position:relative;float:left;margin-top:10px;margin-left:50px;font-size:30px;color:gray"></i>
		</div>
	</div>
	
	<div id="content3" style="position:relative;width:100%;height:320px;background-color:#f0efef;">
		<div style="position:relative;width:1140px;height:320px;margin:0 auto">
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
			<div class="petList"></div>
		</div>
	</div>
	
</body>
</html>