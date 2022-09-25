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
<<<<<<< HEAD
<link rel="stylesheet" href="/css/reserveManage.css">
<style>
	.title-wrap{
			width:500px;
			font-family: ns-bold;
			font-weight:bold;
			font-size:16px;	
			padding-bottom:10px;
	}
	
	.content-wrap{
	width: 1400px;
	}	

	.tbl1{
	}
	thead tr td{
	text-align:left;
	font-size:13px;
	height:30px;
	}
	thead{
	}
	tbody td{
	height: 50px;
	}
	select{
	width:50%;
	height:70%;
	text-align:center;
	}
	input{
	border:2px solid light-gray;
	width: 50%;
	height:70%;
	text-align:center;
	}
	button{
	cursor: pointer;
	height:100%;
	}
</style>
=======
<link rel = "stylesheet" href = "/css/insertReserveFrm.css">
<link rel = "stylesheet" href = "/css/notosans.css">
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
<script type="text/javascript">

function go_insert(){
	console.log($("#reserveMail").val());
	$.ajax({
		url : "/updateReserve.do",
		type : "post",
		data : {
			reserveNo:$("#reserveNo").val(),
			timeCode:$("#timeCode").val(),
			themaCode:$("#themaCode").val(),
			reserveName:$("#reserveName").val(),
			reservePhone:$("#reservePhone").val(),
			reserveAmount:$("#reserveAmount").val(),
			reserveMail:$("#reserveMail").val(),
			playDate:$("#playDate").val(),
			themaPrice:$("#themaPrice").val()
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
	<input type = "hidden" id = "reserveNo" value = "<%=result.getReserveNo()%>">
	<input type = "hidden" id = "themaCode" value = "<%=result.getThemaCode()%>">
	<input type = "hidden" id = "timeCode" value = "<%=result.getTimeCode()%>">
	<input type = "hidden" id = "playDate" value = "<%=result.getPlayDate()%>">
	<input type = "hidden" id = "themaPrice" value = "<%=result.getThemaPrice() %>">
	<div class="content-wrap">
<<<<<<< HEAD
	 	<div class="title-wrap" stlye = "width: 500px;">예약추가</div>
		<table class = "tbl1" style = "width:500px !important;">
=======
<<<<<<< HEAD
	 	<div class="title-wrap">예약관리</div>
		<table class="tbl1">
=======
	 	<div class="title-wrap">예약추가</div>
		<table class="tbl1" style = "width:1000px">
>>>>>>> refs/remotes/origin/master
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
			<thead>
<<<<<<< HEAD
				<tr style = "margin-top:10px;">
					<td colspan = 2 style = "border:none;"><%="예약날짜 : " +result.getPlayDate() %></td>
=======
				<tr>
<<<<<<< HEAD
					<th colspan = 2 style ="width:1200px; height:50px;" class="tr-1">예약정보</th>
=======
					<th colspan = 2 style ="width:1200px; height:30px;  background-color:#fff; border-color: rgb(255,193,7);">예약정보</th>
>>>>>>> refs/remotes/origin/master
				</tr>
				<tr>
					<td colspan = 2 style = "border:none;"><%="예약날짜 : "+result.getPlayDate() %></td>
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
				</tr>
				<tr>
					<td colspan = 2 style ="width:10%; border:none"><%="예약시간 : "+result.getTime() %></td>
				</tr>
				<tr>
<<<<<<< HEAD
					<td colspan = 2 style = "width:10%; border-color: rgb(255,193,7);"><%="테 마 명  : "+result.getThemaName() %></td>
=======
<<<<<<< HEAD
					<td colspan = 2 style = "width:10%"><%="테마명 : "+result.getThemaName() %></td>
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
				</tr>
<<<<<<< HEAD
				<tr style = "height:50px; width: 200px;">
=======
				<tr>
					<th colspan = 2 style = "height:50px;" class="tr-1">회원정보입력</th>
=======
					<td colspan = 2 style = "width:10%; border-color: rgb(255,193,7); border-bottom:2px solid rgb(255,193,7);"><%="테마명 : "+result.getThemaName() %></td>
>>>>>>> refs/remotes/origin/master
				</tr>
				<tr style = "height:50px;" class="title">
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
					<th>구분</th>
					<th>입력란</th>
				</tr>
			</thead>
			<tbody>
				<tr>	
					<td>예약자명</td>
					<td>
						<input class = "input-form" type ="text" id = "reserveName" value = ""/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input type = "text" id = "reservePhone" value = ""/>
					</td>
				</tr>
				<tr>
					<td>메일입력</td>
					<td>
						<input type = "text" id = "reserveMail" value = ""/>
					</td>
				</tr>
				<tr>
					<td>예약인원</td>
					<td>
						<select id = "reserveAmount" name = "reserveAmount">
							<%int size = Integer.parseInt(result.getPeopleMax());%>
							<%for(int i=0;i<size;i++){ %>
							<option><%=i+1%></option>						
							<%} %>
						</select>
					</td>
				</tr>
<<<<<<< HEAD
				<tr>
					<td colspan = 2>
						<button onclick = 'go_insert()' style = "width: 200px;">예약추가</button>
					</td>
				</tr>
			</body>
=======
			</tbody>
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
		</table>
		<button onclick = 'go_insert()' class="add-btn">예약추가</button>
	</div>
	<script>
	</script>
</body>
</html>