<%@page import="com.ngb.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href = "css/managerTemplate.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/js/jquery-3.6.0.js"></script>
<body>
	<div class="header-wrap">
		<div class="header">
			<div id="logo"><a href="/index.jsp"><img src="/img/logo2.png"></a></div>
		</div>
	</div>
	<div class="menu-wrap">
		<ul>
			<li><a href="#">관리자페이지</a></li>
		</ul>
		<ul class="menu">
			<li><a href="#" class="index">회원관리</a></li>
		</ul>
		<ul class="menu">
			<li><a href="#">예약관리</a></li>
		</ul>
		<ul class="menu">
			<li><a href="#">테마관리</a></li>
		</ul>
	</div>

	<script>
	$(".menu a").on("click",function(){
		const length = $(".menu a").length;
		const idx = $(".menu a").index(this);
		for(let i=0; i<length; i++){
			$(".menu a").eq(i).removeClass("index");
		}
		$(".menu a").eq(idx).addClass("index");
	})
			
	</script>
</body>
</html>