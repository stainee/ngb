<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<Thema> tList = (ArrayList<Thema>)request.getAttribute("themaList");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/css/reserveFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="content-wrap">
		<div class="tab-wrap"> 
	        <ul class="tab-menu">
	            <li class="tabstep tabstep-now" id="tabstep1">
	                <img src=/img/tabstep1.png class="tabstep1-img"><span id="tabstep1-span">예약하기</span>
	            </li> 
	            <li class="tabstep" id="tabstep2">
	                <img src=/img/tabstep2.png class="tabstep2-img"><span id="tabstep2-span">결제하기</span>
	            </li>
	            <li class="tabstep" id="tabstep3">
	                <img src=/img/tabstep3.png class="tabstep3-img"><span id="tabstep3-span">예약완료</span>
	            </li> 
	        </ul>
	    </div>
	    <div class="tabs-container">
         	
		    <div class="tabs">
		    	<div class="tab tab1">
		    		<table class="tbl1">
					     <tr>
					         <th>날짜</th>
					         <th>테마</th>
					         <th>인당가격</th>
					         <th>시간</th>
					     </tr>
					     <tr>
					         <td><div id="datepicker"></div></td>
					         <td>
					         	<ul class="themaList">
					         		<%for(Thema t : tList){%>
					         		<li id="<%=t.getThemaCode()%>" price="<%=t.getThemaPrice()%>" min="<%=t.getPeopleMin()%>" max="<%=t.getPeopleMax()%>">
					         		<%= t.getThemaName()%> </li>
					         		<% }%>
					         		
					         	</ul>
					         </td>
					         <td id="themaPrice"></td>
					         <td>
					         	<ul class="timeList">
					         		
					         	</ul>
					         </td>
					     </tr>
				 	</table>
				 	<div class="btn-wrap">
				    	<button class="prev btn4">이전</button>
				     	<button class="next btn2" id="tab1NextBtn">다음</button>
			     	</div>
		    	</div>
		    	<div class="tab tab2" style="display:none;">
		    		<table class="tbl2">
					     <tr>
					         <th>예약일</th>
					         <td class="playDate">YYYYMMDD</td>
					         <th colspan="2">인원선택</th>
					     </tr>
					     <tr>
					     	<th>예약시간</th>
					     	<td class="playTime">18:00</td>
					     	<td rowspan="2" colspan="2">
					     	<select name="reserveAmount">
					     	<option>1</option>
					     	<option>2</option>
					     	<option>3</option>
					     	<option>4</option>
					     	<option>5</option>
					     	<option>6</option>
					     	</select></td>
					     </tr>
					     <tr>
					     	<th>예약테마</th>
					     	<td class="themaName">당산탈출</td>
					     </tr>
					     <tr>
				 			<th>이름</th>
				 			<td><input type="text" name="reserveName" placeholder="입금자명"></td>
				 			<th>전화번호</th>
				 			<td><input type="text" name="reservePhone" placeholder="01012345678"></td>
				 		</tr>
				 		<tr>
				 			<th>이메일</th>
				 			<td colspan="3" class="email"><input type="text" name="reserveMail" placeholder="abc@def.com"></td>
				 		</tr>
					     <tr>
					     	<th>결제금액</th>
					     	<td colspan="3" class="totalPrice"></td>
					     </tr>
				 		<tr>
					     	<th colspan="4"></th>
					     </tr>
				 		<tr>
				 			<th colspan="2"><button id="credit" class="credit btn2">카드결제</button></th>
				 			<th colspan="2"><button id="account" class="account btn2">무통장입금</button></th>
				 		</tr>
				 	</table>
				 	<div class="btn-wrap">
				 		
				    	<button class="prev btn4">이전</button>
				    	<button class="next btn2" id="tab2NextBtn">다음</button>
			     	</div>
		    	</div>
		    	<div class="tab tab3" style="display:none;">
		    		<table class="tbl2 tbl3">
					     <tr>
					         <th>예약일</th>
					         <td class="playDate">YYYYMMDD</td>
					         <th colspan="2">인원선택</th>
					     </tr>
					     <tr>
					     	<th>예약시간</th>
					     	<td class="playTime">18:00</td>
					     	<td rowspan="2" colspan="2" class="peopleAmount">
					     		2
					     	</td>
					     </tr>
					     <tr>
					     	<th>예약테마</th>
					     	<td class="themaName">당산탈출</td>
					     </tr>
					     <tr>
					     	<th>결제금액</th>
					     	<td colspan="3" class="totalPrice">20000원</td>
					     </tr>
				 		<tr>
					     	<th colspan="4"></th>
					     </tr>
				 		<tr>
				 			<th colspan="4"><button id="home" class="btn4" onclick="location.href='index.jsp'" >홈으로</button></th>
				 		</tr>
				 	</table>
		    	</div>
		    </div>
	    </div>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="/js/reserve.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</body>
<script>

</script>
</html>