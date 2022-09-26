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
<script src="/js/sweetalert.min.js"></script>
 <link rel="stylesheet" href="/css/reserveView.css">
</head>
<body>

 <%@include file="/WEB-INF/views/common/header.jsp" %>
 <div class="content-wrap">
	    
	    <div class="tabs-container">
		    <div class="tabs">
			    <div class="reserveName">
		    		<h4><span><%=reser.getReserveName() %></span>님의 예약내역입니다.</h4>
		    	</div>
		    	<input type="hidden" name="reserveNo" value="<%=reser.getReserveNo() %>">
		    	<input type="hidden" name="reserveName" value="<%=reser.getReserveName() %>">
		    	<input type="hidden" name="reserveMail" value="<%=reser.getReserveMail() %>">
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
					     	<td colspan="3"><%=reser.getReservePay()*reser.getReserveAmount() %></td>
					     </tr>
				 		<tr>
					     	<th colspan="4"></th>
					     </tr>
				 		<tr>
				 			<th colspan="2"><button id="cancel" class="btn4">예약취소</button></th>
				 			<th colspan="2"><button id="home" class="btn2" onclick="location.href='index.jsp'">확인</button></th>
				 		</tr>
				 	</table>
		    	</div>
		    </div>
	    </div>
	    
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="/js/deleteReserve.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

</body>
</html>