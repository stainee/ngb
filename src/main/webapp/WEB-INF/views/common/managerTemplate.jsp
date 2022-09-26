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
			<li><a href="/manageMember.do">회원관리</a></li>
		</ul>
		<ul class="menu">
			<li><a href="/reserveManage.do">예약관리</a></li>
		</ul>
		<ul class="menu">
			<li><a href="/themaManageList.do">테마관리</a></li>
		</ul>
	</div>

	<script>
	$(".menu a").on("click",function(){
		const length = $(".menu a").length;
		const idx = $(".menu a").index(this);
		
		/*
		for(let i=0; i<length; i++){
			$(".menu a").eq(i).removeClass("index");
		}
		$(".menu a").eq(idx).addClass("index");
		*/
		console.log("1");
		console.log(pageSelector);
		console.log($(".menu a").eq(1))
	});
	
	$(function(){
		if(pageSelector == 0){
			const select = $(".menu a").eq(0);
			$(".menu a").eq(0).addClass("index");
			$(".menu a").not(select).removeClass("index");
		}else if(pageSelector == 1){
			const select = $(".menu a").eq(1);
			$(".menu a").eq(1).addClass("index");
			$(".menu a").not(select).removeClass("index");s
		}else if(pageSelector == 2){
			const select = $(".menu a").eq(2);
			$(".menu a").eq(2).addClass("index");
			$(".menu a").not(select).removeClass("index");
		}
	});
			
	</script>
</body>
</html>