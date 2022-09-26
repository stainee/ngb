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
<link rel="icon" href="/img/logo.png">
<link rel="stylesheet" href="/css/template.css">
<link rel="stylesheet" href="/css/reserveManage.css">
<link rel = "stylesheet" href = "/css/editReserveFrm.css">
<link rel = "stylesheet" href = "/css/notosans.css">
<script type="text/javascript">

function updateReserve(){
	$.ajax({
		url : "/updateReserve.do",
		type : "post",
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

function deleteReserve(){
	$.ajax({
		url : "/deleteReserve.do",
		type : "get",
		data : {
			reserveNo:$("#reserveNo").val(),
		},
		success : function(result){
			if(result == 'success'){
				alert("예약삭제가 완료되었습니다.");
				location.href = "/reserveManage.do"
			}else{
				alert("예약 삭제 중 오류가 발생하였습니다.");
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
		th{
		height:50px;
		background-color: #fff !important; 
		border-top: none;
		border-bottom: 3px solid rgb(255,193,7) !important;
		border-right: none !important;
		}
		td{
		text-align:center;
		border-right: none !important;
		}
		.input-form{
		text-align:center;
		}
		button{
		border:none; background-color:white; cursor: pointer;
					background-color:rgb(255,193,7); color:#fff; height: 30px; width:50px;
		}
	</style>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp"%>
	<div class="content-wrap">
	<div class = "title-wrap">예약수정</div>
		<table class = "tbl1" style = "margin:0;">
		<thead>
			<tr style = "background-color:#fff!important;">
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
			</thead>
			<tbody>
				<tr>
					<input type="hidden" id="reserveNo" value="<%=result.getReserveNo()%>">
					<td><%=result.getPlayDate()%></td>
					<td style = "width:20%;"><%=result.getThemaName()%></td>
					<td><input type="text" class="input-form" id="reserveName" value="<%=result.getReserveName()%>"></td>
					<td><input type="text" class="input-form" id="reservePhone" value="<%=result.getReservePhone()%>"></td>
					<td><input type="text" class="input-form" id="reserveAmount" value="<%=result.getReserveAmount()%>"></td>
					<td><%=result.getReservePay()%></td>
					<td><%=result.getReserveDate()%></td>
					<td><%=result.getReserveAmount() + "/" + result.getPeopleMax()%></td>
					<td>-</td>
					<td>
						<button onclick="updateReserve()"style = "border:none; background-color:white; cursor: pointer;
					background-color:rgb(255,193,7); color:#fff; height: 30px; width:50px;
					">수정</button>
						<button onclick="deleteReserve()"style = "border:none; background-color:white; cursor: pointer;
					background-color:rgb(255,193,7); color:#fff; height: 30px; width:50px;
					">삭제</button>
					</td>
				</tr>
				</tbody>
		</table>
		<div style = "text-align: right; border:none; background-color:white;width:1200px;">
			<button onclick="location.href='reserveManage.do'" 
					style = "border:none; background-color:white; cursor: pointer;
					background-color:rgb(255,193,7); color:#fff; height: 30px; width:100px;
					margin-top:10px;">
					BACK
			</button>
		</div>
	</div>
	<script>
	</script>
</body>
</html>