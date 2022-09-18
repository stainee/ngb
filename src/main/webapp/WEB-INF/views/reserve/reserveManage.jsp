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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
    <link rel="stylesheet" href="/css/reserveManage.css">
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<form id="frm" method = "post">
		<input type ="hidden" name="reserveNo" id="reserveNo" value=""/>
	</form>
	<div class="content-wrap">
		<div>예약목록</div>
		<div>
			<select id = "selectDate">
				<%for(Reserve r : dateList) {%>
				<option><%=r.getPlayDate() %></option>
				<%} %>
			</select>
		</div>
		<table class="tbl1" id ="table">
			<thead>
		        <th>
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
		        </th>
	        </thead>
	        <tbody id="tbody_reserve">
	        </tbody>
	    </table>
    </div>
    <script>
    	const selectDate = $("#selectDate");
    	selectDate.on("change",function(){
    		const select = $("option:selected").text();
    		
    		$.ajax({
    			url : "/selectDateReserve.do",
    			type : "get",
    			data : {select:select},
    			success : function(data){
    				console.log(data);
    				const name = Object.keys(data[0]);
    				console.log(name);
    				var html ="";
    				
    				$.each(data,function(idx,value){
    					html +="<tr>";
    					html += "<td>"+ value.playDate +"</td>";
    					html += "<td>"+ value.themaCode +"</td>";
    					html += "<td>"+ value.reserveName +"</td>";
    					html += "<td>"+ value.reservephone +"</td>";
    					html += "<td>"+ value.reserveAmount +"</td>";
    					html += "<td>"+ value.reservePay +"</td>";
    					html += "<td>"+ value.reserveDate +"</td>";
    					html += "<td>"+ value.reserveState +"</td>";
    					html += "<td><button onclick='go_managePage("+value.reserveNo+");'>관리</button></td>";
    					html +="</tr>";
    				});
    				
    				
    				
    				$("#tbody_reserve").html(html);
    				
    			}
    		})

    	});
    	selectDate.trigger("change");
    	
    	function go_managePage(reserveNo){
    		
    		$("#frm").attr("action","/editReserveFrm.do");
    		$("#reserveNo").val(reserveNo);
    		$("#frm").submit();
    		
    	}
    	
    </script>
</body>
</html>