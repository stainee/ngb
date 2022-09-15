<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					         <th>가격</th>
					         <th>시간</th>
					     </tr>
					     <tr>
					         <td>달력API</td>
					         <td>
					         	<ul class="thema-list">
					         		<li><a>테마1</a></li>
					         		<li><a>테마2</a></li>
					         	</ul>
					         </td>
					         <td>20000</td>
					         <td>
					         	<ul class="time-list">
					         		<li>12:00</li>
					         	</ul>
					         </td>
					     </tr>
				 	</table>
		    	</div>
		    	<div class="tab tab2" style="display:none;">
		    		<table class="tbl2">
					     <tr>
					         <th>예약일</th>
					         <td>YYYYMMDD</td>
					         <th>인원선택</th>
					     </tr>
					     <tr>
					     	<th>예약시간</th>
					     	<td>18:00</td>
					     	<td><input type="text" name="amount"></td>
					     </tr>
					     <tr>
					     	<th>예약테마</th>
					     	<td>당산탈출</td>
					     	<td>20000 원</td>
					     </tr>
				 	</table>
				 	
				 	<table class="tbl3">
				 		<tr>
				 			<th>이름</th>
				 			<td><input type="text" name="reserveName"></td>
				 			<th>전화번호</th>
				 			<td><input type="text" name="reserveMail"></td>
				 		</tr>
				 	</table>
		    	</div>
		    	<div class="tab tab3" style="display:none;">
		    		222222
		    	</div>
		    </div>
	    </div>
	     <button class="btn2">다음</button>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<script>
	let idx=0;
	$(".btn2").on("click", function(){
		const length = $(".tab-menu .tabstep").length;
		idx++;
		for(let i=0; i<length; i++){
			$(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");
		}
		for(let k=0; k<=idx; k++){
			$(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
		}
		
		nextTab();
	})
	
	function nextTab(){
		const length = $(".tabs .tab").length;
		for(let i=0; i<length; i++){
			 $(".tabs .tab").eq(i).css("display", "none");
		}
		 $(".tabs .tab").eq(idx).css("display", "block");
	}
</script>
</html>