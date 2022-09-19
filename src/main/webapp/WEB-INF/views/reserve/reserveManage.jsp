<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Thema> list = (ArrayList<Thema>)request.getAttribute("list");
    	ArrayList<Reserve> dateList = (ArrayList<Reserve>)request.getAttribute("dateList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/reserveManage.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	
   <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
   <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

   <script type="text/javascript">
       $(function() {
               $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" }).val()
               $("#datepicker").datepicker('setDate','today');
               var today = $("#datepicker").val();
               selectDateReserve(today);
       });
   </script>
</head>
<body>
	<style>
		tbody>tr>td{
		text-align:center;
		height: 60px;
		}
		#themaTh{
		width:200px;
		}
	</style>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<form id="frm" method = "post">
		<input type ="hidden" name="reserveNo" id="reserveNo" value=""/>
	</form>
	<div class="content-wrap">
		<div>예약목록</div>
		<div>
			<p>Date: <input type="text" id="datepicker" size="15"/></p>
		</div>
		<table class="tbl1" id ="table">
			<thead>
		        	<th>시간</th>
		        	<th id = "themaTh">테마명</th>
    		        <th>전화번호</th>
    		        <th>인원</th>
    		        <th>요금</th>
    		        <th>예약시간</th>
    		        <th>예약상태</th>
    		        <th>결제확인</th>
    		        <th>관리자모드</th>
	        </thead>
	        <tbody id="tbody_reserve">
	        	<%for(Thema t : list) { %>
	        	<tr>
	        		<input type = "hidden" name = "themaCode" value = "<%=t.getThemaCode() %>">
	        		<input type = "hidden" name = "timeCode" value = "<%=t.getTimeCode() %>">
		        	<td id = "time"><%=t.getTime() %></td>
					<td id = "themaName"><%=t.getThemaName()%></td>
					<td id = "reservePay"></td>
					<td id = "reserveState"></td>
					<td id = "payState"></td>
					<td id = "button"></td>
					<td></td>
					<td></td>
					<td>
						<button>관리</button>
					</td>
				</tr>
				<%} %>	        	
	        </tbody>
	    </table>
    </div>
   	<script>
    	const selectDate = $("#datepicker");
    	
    	function selectDateReserve(select){
    		$.ajax({
    			url : "/selectDateReserve.do",
    			type : "get",
    			data : {select:select},
    			success : function(data){
					console.log(data);
					if()
    			}
    		});
    	}
    	selectDate.on("change",function(){
    		const select = selectDate.val();
    		selectDateReserve(select);
    	});
    	function go_managePage(reserveNo){
    		$("#frm").attr("action","/editReserveFrm.do");
    		$("#reserveNo").val(reserveNo);
    		$("#frm").submit();
    	}
    </script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>
</html>