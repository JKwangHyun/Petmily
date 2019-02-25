// Test1. JavaScript

/*var xhrObject; //XMLHttpRequest객체를 저장할 변수를 전역변수로 선언

function createXHR(){ //XMLHttpRequest객체를 생성하는 메소드
	  if(window.ActiveXObject){ //웹 브라우저가 IE5.0, IE6.0인 경우 
	     xhrObject = new ActiveXObject("Microsoft.XMLHTTP"); //XMLHttpRequest객체 생성
	  }else if(window.XMLHttpRequest){ //웹 브라우저가 IE7.0, 파이어폭스, 사파리, 오페라등의 경우
         xhrObject = new XMLHttpRequest(); //XMLHttpRequest객체 생성
	  }
}

function getParameterValues(){//요청파라미터를 설정하는 메소드
	var id = document.getElementById("id").value ;
	var password = document.getElementById("password").value ;
 	return "id=" + id + "&password=" + password ; //요청파라미터를 설정해서 리턴
}
function startMethod(){//클라이언트로부터 이벤트가 발생시 실행되는 메소드
	 createXHR(); //createXHR()메소드 호출
	  var url = "/Spring02/mlogin.do?"+ getParameterValues() ; //요청 URL설정
	 xhrObject.onreadystatechange = resultProcess; 
	 xhrObject.open("Get", url, "true");
	 xhrObject.send(null);//서버로 요청을 보냄
}
function resultProcess(){//응답결과가 오면 자동으로 실행
	  if(xhrObject.readyState == 4){ 
	    if(xhrObject.status == 200){ 
	    	 document.getElementById("resultArea").innerHTML = xhrObject.responseText; 
		}
	  }
} // function*/

// Test2. JQuery
$(document).ready(function(){
	
 $('#jqtest').click(function () {
    $.ajax({
    type: "GET",
    url: "login/loginForm",
	data: {	id: $("#id").val(), 
			password : $("#password").val(),
		   },
	success:function(result) {
        $("#resultArea").html(result);
	}
    }); //  $.ajax
 }); //  click
}); // ready(function()
