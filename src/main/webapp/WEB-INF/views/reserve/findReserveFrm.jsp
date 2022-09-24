<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="/js/sweetalert.min.js"></script>
<link rel="stylesheet" href="/css/findReserveFrm.css">
    <link rel="stylesheet" href = "/css/notosans.css">

</head>
<body>
<%@include file ="/WEB-INF/views/common/header.jsp" %>
<div class="content-wrap">
<div class="reserv_find_wrap">
        <div class="title-wrap">
            <h2>SEARCH</h2>
        </div>
        <div class="input-wrap">
            <form name="findReserveFrm" action="/findReserve.do" method="post" id="reserv_find">
            <div class="input-area">
                <div class="subjcet">이름</div>
                    <input type="text" name="reserveName" class="input-form" placeholder="예약자분의 성함을 입력해주세요">
            </div>
            <div class="input-area">
                <div class="subjcet">예약번호</div>
                <input type="text" name="reserveNo" class="input-form" placeholder="예약번호를 입력해주세요">
            </div>    
                <div class="submit">
                    <input type="submit" class="btn3" value="예약찾기">
                </div>
            </form>
        </div><!--input-wrap-->

    </div><!--reserv_find_wrap-->
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script src="/js/findReserveFrm2.js"></script>


</body>
</html>