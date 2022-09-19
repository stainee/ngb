<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Reserve result = (Reserve) request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/template.css">
</head>
<body>
	<style>
		td{
		text-align:center;
		}
		.input-form{
		text-align:center;
		}
	</style>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp"%>
	<div class="content-wrap">
	<div>예약수정</div>
	<hr>
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
			<form action="/updateReserve.do" method="post">
				<tr>
					<input type="hidden" name="reserveNo"
						value="<%=result.getReserveNo()%>">
					<td><%=result.getTime()%></td>
					<td><%=result.getThemaName()%></td>
					<td><input type="text" class="input-form" name="reserveName"
						value="<%=result.getReserveName()%>">	</td>
					<td><input type="text" class="input-form" name="reservePhone"
						value="<%=result.getReservephone()%>"></td>
					<td><input type="text" class="input-form" name="reserveAmount"
						value="<%=result.getReserveAmount()%>"></td>
					<td><%=result.getReservePay()%></td>
					<td><%=result.getReserveDate()%></td>
					<td><%=result.getReserveAmount() + "/" + result.getPeopleMax()%></td>
					<td>-</td>
					<td>
						<button>수정</button>
					</td>
				</tr>
			</form>
		</table>
	</div>
	<script>
	</script>
</body>
</html>