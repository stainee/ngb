<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/findReserveFrm.css">
    <link rel="stylesheet" href = "/css/notosans.css">

</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<div class="reserv_find_wrap">
        <div class="title-box">
            <h1>비회원 예약확인</h1>
        </div>
        <div class="input-wrap">
            <form name="findReserveFrm" action="/findReserve.do" method="post" id="reserv_find">
                <div class="input-area">
                    <div class="subjcet">성함</div>
                    <input type="text" name="reserveName" class="input-form" placeholder="예약자분의 성함을 입력해주세요">
                </div>
                <div class="input-area">
                    <div class="subjcet">이메일</div>
                    <input type="text" name="reserveEmail" class="input-form" placeholder="예약시 입력한 이메일주소를 입력해주세요">
                </div>
                <div class="submit">
                    <input type="submit" class="btn3" value="예약찾기">
                </div>
            </form>
        </div><!--input-wrap-->

    </div><!--reserv_find_wrap-->
<%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>