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

function insert(){
	$.ajax({
		url : "/updateReserve.do",
		type : "get",
		data : {
			reserveName:$("#reserveNo").val(),
			reserveName:$("#reserveName").val(),
			reservePhone:$("#reservePhone").val(),
			reserveAmount:$("#reserveAmount").val()
			reserveAmount:$("#timeCode").val()
			reserveAmount:$("#themaCode").val()
		},
		success : function(result){
			if(result == 'success'){
				alert("예약추가가 완료되었습니다.");
				location.href = "/reserveManage.do"
			}else{
				alert("예약추가 중 오류가 발생하였습니다.");
			}
		},
		error :function(data){
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
	<div>예약추가</div>
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
					<input type = "hidden" id = "timeCode" value = "<%=result.getTimeCode() %>">
					<input type = "hidden" id = "themaCode" value = "<%=result.getThemaCode() %>">
					<input type = "hidden" id = "reserveNo" value = "<%=result.getReserveNo() %>">
					<td><%=result.getTime()%>
					</td>
					<td><%=result.getThemaName() %></td>
					<td><input type="text" class="input-form" id="reserveName"></td>
					<td><input type="text" class="input-form" id="reservePhone"></td>
					<td><input type="text" class="input-form" id="reserveAmount" value = "<%="최대인원"+result.getPeopleMax()+"명"%>"></td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>
						<button onclick="insertReserve()">추가</button>
					</td>
				</tr>
		</table>
	</div>
	<script>
	</script>
</body>
</html>