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
    <link rel="stylesheet" href="/css/notosans.css">
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
	<style>
		tbody>tr>td{
		text-align:center;
		height: 60px;
		}
		#themaTh{
		width:200px;
		}
	</style>
</head>
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	
	<div class="content-wrap">
    <div class="title-wrap">예약관리</div>
    
	<form id="frm">
		<input type="hidden" name= 'playDate' id="playDate"/>
		<input type="hidden" name= 'peopleMax' id="peopleMax"/>
		<input type="hidden" name= 'reserveNo' id="reserveNo"/>
		<input type="hidden" name= 'themaCode' id="themaCode"/>
		<input type="hidden" name= 'timeCode' id="timeCode"/>
		<input type="hidden" name= 'themaName' id="themaName"/>
		<input type="hidden" name= 'themaPrice' id="themaPrice"/>
		<input type="hidden" name= 'time' id="time"/>
	</form>
			
		<div>
			<select id = "selectThema">
				<option hidden = "" disabled = "disabled" selected = "selected">테마선택</option>
				<%for(Thema t : list){ %>
				<option id = "option" value = "<%=t.getThemaCode()%>"><%=t.getThemaName() %>
				</option>
				<%} %>
			</select>
		</div>
		<div>
			<input type="text" class = "input-form" id="datepicker" size="15"/>
		</div>
		<table class="tbl1" id ="table">

			<thead>
					<th>번호</th>
		        	<th>시간</th>
		        	<th id = "themaTh">테마명</th>
		        	<th>예약자명</th>	
    		        <th>전화번호</th>
    		        <th>인원</th>
    		        <th>요금</th>
    		        <th>예약시간</th>
    		        <th>예약상태</th>
    		        <th>결제확인</th>
    		        <th>관리자모드</th>
	        </thead>
	        <tbody id="tbody_reserve">
	        	      	
	        </tbody>
	    </table>
    </div>
    

   	<script>
    	const selectDate = $("#datepicker");
    	const selectThema = $("#selectThema");
    	
    	function selectDateReserve(select){
    		$.ajax({
    			url : "/selectDateReserve.do",
    			type : "get",
    			data : {select:select},
    			success : function(data){
    				console.log(data);
    				var html ="";
    				$.each(data,function(idx,value){
    					html += "<tr>";
    					html += "<td>"+ (idx+1) +"</td>";
    					html += "<td>"+ value.time+"</td>";
    					html += "<td>"+ value.themaName +"</td>";
    					html += "<td>"+ value.reserveName +"</td>";
    					html += "<td>"+ value.reservePhone +"</td>";
    					html += "<td>"+ value.reserveAmount +"</td>";
    					html += "<td>"+ value.reservePay +"</td>";
    					html += "<td>"+ value.reserveDate +"</td>";
    					html += "<td>"+ value.reserveAmount+"/"+ value.peopleMax + "</td>";
    					html += "<td>"+ "-" +"</td>";
    					html += "<td><button onclick='fn_managePage("+value.themaPrice+",\""+select+"\","+value.peopleMax+",\""+value.themaName+"\",\""+value.time+"\","+value.reserveNo+",\""+value.themaCode+"\","+value.timeCode+");'>관리</button></td>";
    					html +="</tr>";
    				});
    				$("#tbody_reserve").html(html);
    			}
    		});
    	}
    	selectDate.on("change",function(){
    		const select = selectDate.val();
    		selectDateReserve(select);
    	});
     	function fn_managePage(themaPrice,select,peopleMax,themaName,time,reserveNo,themaCode,timeCode){
    		$("#frm").attr("action","/editReserveFrm.do");
    		$("#peopleMax").val(peopleMax);
    		$("#reserveNo").val(reserveNo);
    		$("#themaCode").val(themaCode);
    		$("#timeCode").val(timeCode);
    		$("#themaName").val(themaName);
    		$("#playDate").val(select);
    		$("#themaPrice").val(themaPrice);
    		$("#time").val(time);
    		$("#frm").submit();
    	}
     	selectThema.on("change",function(){
     		const select = selectThema.val();
     		console.log(select);
     		selectThemaReserve(select);
     	});
     	function selectThemaReserve(){
     		$.ajax({
     			url : "/selectThemaReserve.do",
     			type : get,
     			data : {select:select}

     		});
     	}

    </script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>
</html>