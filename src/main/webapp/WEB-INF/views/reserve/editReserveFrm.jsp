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
		         <%=r.toString() %>
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