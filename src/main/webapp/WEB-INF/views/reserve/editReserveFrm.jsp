<%@page import="com.ngb.reserve.model.vo.Reserve"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Reserve r = (Reserve)request.getAttribute("r");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "/css/template.css">
</head>
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
		<div class="content-wrap">
		<button class = "btn4">수정</button>
		<button class = "btn4">추가</button>
		<button class = "btn4">삭제</button>
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
		        <form action = "updateReserve.do" method = "get">
		        <tr>
		        	<input type ="hidden" name = "reserveNo" value = "<%=r.getReserveNo() %>">
		        	<td>
		        		<%=r.getTime() %>
		        	</td>
		        	<td>
		        		<%=r.getThemaCode() %>
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveName" value = "<%=r.getReserveName() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reservePhone" value = "<%=r.getReservephone() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveAmount" value = "<%=r.getReserveAmount() %>">
		        	</td>
		        	<td>
		        		<%=r.getReservePay() %>
		        	</td>
		        	<td>
		        		<%=r.getReserveDate() %>
		        	<td>
		        		<%="1/6" %>
		        	</td>
		        	<td><%="어떻게하지" %></td>
		        	<td>
		        		<button>수정</button>
		        	</td>
		        </tr>
		        </form>
		    </table>
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
		        	<input type ="hidden" name = "reservNo" value = "<%=r.getReserveNo() %>">
		        	<td>
		        		<%=r.getTime() %>
		        	</td>
		        	<td>
		        		<%=r.getThemaCode() %>
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveName" value = "<%=r.getReserveName() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reservePhone" value = "<%=r.getReservephone() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveAmount" value = "<%=r.getReserveAmount() %>">
		        	</td>
		        	<td>
		        		<%=r.getReservePay() %>
		        	</td>
		        	<td>
		        		<%=r.getReserveDate() %>
		        	<td>
		        		<%="1/6" %>
		        	</td>
		        	<td><%="어떻게하지" %></td>
		        	<td>
		        		<button>추가</button>
		        	</td>
		        </tr>
		    </table>
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
		       		<td>
		       			<input type ="hidden" name = "reservNo" value = "<%=r.getReserveNo() %>">
		        		<%=r.getTime() %>
		        	</td>
		        	<td>
		        		<%=r.getThemaCode() %>
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveName" value = "<%=r.getReserveName() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reservePhone" value = "<%=r.getReservephone() %>">
		        	</td>
		        	<td>
		        		<input type = "text" name = "reserveAmount" value = "<%=r.getReserveAmount() %>">
		        	</td>
		        	<td>
		        		<%=r.getReservePay() %>
		        	</td>
		        	<td>
		        		<%=r.getReserveDate() %>
		        	<td>
		        		<%="1/6" %>
		        	</td>
		        	<td><%="어떻게하지" %></td>
		        	<td>
		        		<button>삭제</button>
		        	</td>
		        </tr>
		    </table>
	    </div>
	    <script>
	    	const btn = $(".btn4");
	    	const tbl = $(".tbl1");
	    	btn.on("click",function(){
	    		const index = btn.index(this);
	    		const select = tbl.eq(index);
				tbl.eq(index).show();
				tbl.not(select).hide();
	    	});
	    	btn.eq(0).trigger("click");
	    </script>
</body>
</html>