<%@page import="com.ngb.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    	Member m = (Member)session.getAttribute("m");
 %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "/css/header2.css">
<link rel="stylesheet" href = "/css/notosans.css">
<script src="/js/jquery-3.6.0.js"></script>
</head>
<body>
    <div class = "header-wrap">
        <div class = "header">
            <li id = "logo-wrap"><a href="/index.jsp"><img src="/img/logo2.png"></a></li>
            <ul class = "notice menuwrap">
                <div>
                    <li><a href = "#">공지사항</a></li>
                    <li><a href = "#">NOTICE</a></li>
                </div>
            </ul>
            <ul class = "thema menuwrap">
                <div>
                    <li><a href = "#">테마소개</a></li>
                    <li><a href = "#">THEMA</a></li>
                </div>
            </ul>
            <ul class = "reserve menuwrap">
                <div>
                    <li><a href = "/reserveFrm.do">예약하기</a></li>
                    <li><a href = "/reserveFrm.do">RESERVATION</a></li>
                </div>
            </ul>
            <ul class = "mypage menuwrap">
            <div>
                <li><a href = "#">마이페이지</a></li>
                <li><a href = "#">MY PAGE</a></li>
            </div>
            </ul>
            <div class="signwrap">
            	<%if(m==null){ %>
                <a href="/loginFrm.do" class="login">로그인</a>
                <a href="/signupFrm.do" class="signin">회원가입</a>
                <%}else{ %>
                <a href="/logout.do" class="logout">로그아웃</a>
                <%} %>
            </div>
        </div>
       </div>
</body>
</html>