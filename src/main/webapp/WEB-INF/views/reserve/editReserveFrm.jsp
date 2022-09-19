<%@page import="com.ngb.reserve.model.vo.ReserveMngr"%>
<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ReserveMngr result = (ReserveMngr) request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/template.css">
<script type="text/javascript">

function updateReserve(reserveNo){
	$.ajax({
		url : "/updateReserve.do",
		type : "get",
		data : {
			reserveNo:$("#reserveNo").val(),
			reserveName:$("#reserveName").val(),
			reservePhone:$("#reservePhone").val(),
			reserveAmount:$("#reserveAmount").val()
		},
		success : function(result){
			if(result == 'success'){
				alert("수정이 완료되었습니다.");
				location.href = "/reserveManage.do"
			}else{
				alert("수정 중 오류가 발생하였습니다.");
			}
		},
		error :function(data){
			console.log("2");
		}
	});
}
</script>
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
				<tr>
					<input type="hidden" id="reserveNo" value="<%=result.getReserveNo()%>">
					<td><%=result.getTime()%></td>
					<td><%=result.getThemaName()%></td>
					<td><input type="text" class="input-form" id="reserveName" value="<%=result.getReserveName()%>"></td>
					<td><input type="text" class="input-form" id="reservePhone" value="<%=result.getReservePhone()%>"></td>
					<td><input type="text" class="input-form" id="reserveAmount" value="<%=result.getReserveAmount()%>"></td>
					<td><%=result.getReservePay()%></td>
					<td><%=result.getReserveDate()%></td>
					<td><%=result.getReserveAmount() + "/" + result.getPeopleMax()%></td>
					<td>-</td>
					<td>
						<button onclick="updateReserve()">수정</button>
					</td>
				</tr>
		</table>
	</div>
	<script>
	</script>
</body>
</html>