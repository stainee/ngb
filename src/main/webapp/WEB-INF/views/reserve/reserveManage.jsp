<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Reserve> list = (ArrayList<Reserve>)request.getAttribute("list");
    	ArrayList<Reserve> dateList = (ArrayList<Reserve>)request.getAttribute("dateList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="/css/reserveManage.css">
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
		<div>예약목록</div>
		<div>
			<select>
				<%for(Reserve r : dateList) {%>
				<option><%=r.getPlayDate() %></option>
				<%} %>
			</select>
		</div>
		<table class="tbl1">
	        <tr>
	        	<th>시간</th>
	        	<th>테마명</th>
	            <th>예약자</th>
	            <th>전화번호</th>
	            <th>인원</th>
	            <th>요금</th>
	            <th>예약시간</th>
	            <th>예약상태</th>
	            <th>결제확인</th>
	            <th>관리자모드</th>
	        </tr>
	        <%for(Reserve r : list) {%>
	        <form action = "editReserveFrm.do" method = "post">
	        <tr>
	        	<input type = "hidden" name = "reserveNo" value = "<%=r.getReserveNo() %>">
	        	<td>
	        		<%=r.getTime() %>
	        		<input type = "hidden" name = "time" value = "<%=r.getTime() %>">
	        	</td>
	        	<td>
	        		<%=r.getThemaCode() %>
	        		<input type = "hidden" name = "thema" value = "<%=r.getThemaCode() %>">
	        	</td>
	        	<td>
	        		<%=r.getReserveName() %>
	        		<input type = "hidden" name = "name" value = "<%=r.getReserveName() %>">
	        	</td>
	        	<td>
	        		<%=r.getReservephone() %>
	        		<input type = "hidden" name = "phone" value = "<%=r.getReservephone() %>">
	        	</td>
	        	<td>
	        		<%=r.getReserveAmount()+"명" %>
	        		<input type = "hidden" name = "amount" value = "<%=r.getReserveAmount() %>">
	        	</td>
	        	<td>
	        		<%=r.getReservePay()+"원" %>
	        		<input type = "hidden" name = "pay" value = "<%=r.getReservePay() %>">
	        	</td>
	        	<td>
	        		<%=r.getReserveDate() %>
	        		<input type = "hidden" name = "playTime" value = "<%=r.getReserveDate() %>">
	        	</td>
	        	<td>
	        		<%=r.getReserveAmount()+"/"+r.getPeopleMax()%>
	        		<input type = "hidden" name = "reserveState" value = "<%=r.getReserveAmount()%>">
	        	</td>0
	        	<td>
	        		<%="결제확인" %>
	        		<input type = "hidden" name = "payState" value = "<%="결제확인" %>">
	        	</td>
	        	<td>
	        		<button>관리</button>
	        	</td>
	        </tr>
	        </form>
	        <%} %>
	    </table>
    </div>
    <script>
    
    
    </script>
</body>
</html>