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

function go_insert(){
	console.log($("#reserveMail").val());
	$.ajax({
		url : "/updateReserve.do",
		type : "get",
		data : {
			reserveNo:$("#reserveNo").val(),
			timeCode:$("#timeCode").val(),
			themaCode:$("#themaCode").val(),
			reserveName:$("#reserveName").val(),
			reservePhone:$("#reservePhone").val(),
			reserveAmount:$("#reserveAmount").val(),
			reserveMail:$("#reserveMail").val(),
			playDate:$("#playDate").val()
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
	<div class="content-wrap">
		<table class="tbl1" style = "width:1000px">
			<thead>
				<tr>
					<th colspan = 2 style ="width:1200px; height:50px;">예약정보</th>
				</tr>
				<tr>
					<td colspan = 2 style = "border:none;"><%="예약날짜 : "+result.getPlayDate() %></td>
				</tr>
				<tr>
					<td colspan = 2 style ="width:10%; border:none"><%="예약시간 : "+result.getTime() %></td>
				</tr>
				<tr>
					<td colspan = 2 style = "width:10%"><%="테마명 : "+result.getThemaName() %></td>
				</tr>
				<tr>
					<th colspan = 2 style = "height:50px;">회원정보입력</th>
				</tr>
				<tr style = "height:50px;">
					<th>구분</th>
					<th>입력란</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>예약자명</td>
					<td>
						<input type ="text" id = "reserveName" value = ""/>
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
				<tr>
					<td colspan = 2>
						<button onclick = 'go_insert()'>예약추가</button>
					</td>
				</tr>
			</body>
		</table>
	</div>
	<script>
	</script>
</body>
</html>