<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="/css/reserveManage.css">
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
		<div>예약목록</div>
		<div>
			<select>
				<option>월</option>
				<option>화</option>
				<option>수</option>
			</select>
			<select>
				<option>수정</option>
				<option>추가</option>
				<option>삭제</option>
			</select>
		</div>
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
	        <form action = "editReserveFrm.do" method = "post">
	        <tr>
	        	<td>
	        		<%="시간" %>
	        		<input type = "hidden" name = "time" value = "<%="시간" %>">
	        	</td>
	        	<td>
	        		<%="테마" %>
	        		<input type = "hidden" name = "thema" value = "<%="테마" %>">
	        	</td>
	        	<td>
	        		<%="이름" %>
	        		<input type = "hidden" name = "name" value = "<%="이름" %>">
	        	</td>
	        	<td>
	        		<%="전화번호" %>
	        		<input type = "hidden" name = "phone" value = "<%="전화번호" %>">
	        	</td>
	        	<td>
	        		<%="인원" %>
	        		<input type = "hidden" name = "amount" value = "<%="인원" %>">
	        	</td>
	        	<td>
	        		<%="요금" %>
	        		<input type = "hidden" name = "pay" value = "<%="요금" %>">
	        	</td>
	        	<td>
	        		<%="예약시간" %>
	        		<input type = "hidden" name = "playTime" value = "<%="예약시간" %>">
	        	</td>
	        	<td>
	        		<%="예약상태" %>
	        		<input type = "hidden" name = "reserveState" value = "<%="예약상태" %>">
	        	</td>
	        	<td>
	        		<%="결제확인" %>
	        		<input type = "hidden" name = "payState" value = "<%="결제확인" %>">
	        	</td>
	        	<td>
	        		<button>관리</button>
	        	</td>
	        </tr>
	        </form>
	    </table>
    </div>
</body>
</html>