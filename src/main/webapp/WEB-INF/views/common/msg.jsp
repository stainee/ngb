<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% //서블릿이 넘겨준 데이터 꺼내옴
    	String title = (String)request.getAttribute("title");
	    String msg = (String)request.getAttribute("msg");
	    String icon = (String)request.getAttribute("icon");
	    String loc = (String)request.getAttribute("loc");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/js/sweetalert.min.js"></script>
</head>
<body>
	<div style="display:none;">
		<div id="title"><%=title %></div>
		<div id="msg"><%=msg %></div>
		<div id="icon"><%=icon %></div>
		<div id="loc"><%=loc %></div>
	</div>
	<script>
		const title = document.querySelector("#title").innerText;
		const msg = document.querySelector("#msg").innerText;
		const icon = document.querySelector("#icon").innerText;
		const loc = document.querySelector("#loc").innerText;
		swal({
			//함수를 실행하면서 객체전달
			title:title,
			text : msg,
			icon : icon
		}).then(function(){
			location.href = loc;
		});
	</script>
	
</body>
</html>