<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	Reserve reser = (Reserve)request.getAttribute("reserve");
    													//ㄴ키값?
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/css/reserveConfirm.css">
</head>
<body>
 <%@include file="/WEB-INF/views/common/header.jsp" %>
 <div class="content-wrap">
		<div class="tab-wrap"> 
	        <ul class="tab-menu">
	            <li class="tabstep tabstep-now" id="tabstep1">
	                <img src=/img/tabstep1.png class="tabstep1-img"><span id="tabstep1-span">예약하기</span>
	            </li> 
	            <li class="tabstep tabstep-now" id="tabstep2">
	                <img src=/img/tabstep2.png class="tabstep2-img"><span id="tabstep2-span">결제하기</span>
	            </li>
	            <li class="tabstep  tabstep-now" id="tabstep3">
	                <img src=/img/tabstep3.png class="tabstep3-img"><span id="tabstep3-span">예약완료</span>
	            </li> 
	        </ul>
	    </div>
	    <div class="reserveName"><h4><%=reser.getReserveName() %>님의 예약내역입니다.</h4></div>
	    <div class="tabs-container">
         	
		    <div class="tabs">
		    	<div class="tab tab1">
		    	
		    	<div class="tab tab3" style="display:block;">
		    		<table class="tbl2 tbl3">
					     <tr>
					         <th>예약일</th>
					         <td><%=reser.getPlayDate() %></td>
					         <th colspan="2">선택인원</th>
					     </tr>
					     <tr>
					     	<th>예약시간</th>
					     	<td><%=reser.getTime() %></td>
					     	<td rowspan="2" colspan="2">
					     		<%=reser.getReserveAmount() %>
					     	</td>
					     </tr>
					     <tr>
					     	<th>예약테마</th>
					     	<td><%=reser.getThemaName() %></td>
					     </tr>
					     <tr>
					     	<th>결제금액</th>
					     	<td colspan="3"><%=reser.getReservePay() %></td>
					     </tr>
				 		<tr>
					     	<th colspan="4"></th>
					     </tr>
				 		<tr>
				 			<th colspan="4"><button id="account" class="btn2" onclick="location.href='index.jsp'" >홈으로</button></th>
				 		</tr>
				 	</table>
		    	</div>
		    </div>
	    </div>
	    
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="/js/reserve.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>


</body>