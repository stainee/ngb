<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Thema> list =(ArrayList<Thema>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 시간 등록</title>
<link rel = "stylesheet" href = "/css/notosans.css">
<link rel = "stylesheet" href = "/css/themaTimeAddFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
	
    <div class="tap-wrap">
         <ul class="tap-ul">
         	<li><a href="/themaManageList.do" style="text-decoration-line: none;">테마관리</a></li>
         	<li><a href="/themaTimeManage.do" style="text-decoration-line: none;">시간관리</a></li>
         </ul>
    </div>
    
	<div class="title-wrap">테마별 시간 등록</div>
    
    <div class="table-wrap">
        <table class="tbl tbl-hover notice-tbl">
            <tr class="tr-1">
                <th>테마</th>
                <th>1타임</th>
                <th>2타임</th>
                <th>3타임</th>
                <th>4타임</th>
                <th>5타임</th>
                <th>6타임</th>
                <th>7타임</th>
                <th>8타임</th>
                <th>9타임</th>
                <th>10타임</th>
                <th>인원</th>
            </tr>
            <tr class="tr-3">
                <td>
                	<select onchange="getThemaCode(this)" class="addThemaCode">
                	<%String tmCode = "tm"; %>
                		<option value="">테마</option>
            		<%for(Thema tm: list) {%>
                		<option value="<%=tm.getThemaCode() %>"><%=tm.getThemaName() %></option>
               		<%} %>
                 	</select>
                </td>
                <td><input type="text" value="" name="tmTime1" class="tmTime1" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime2" class="tmTime2" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime3" class="tmTime3" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime4" class="tmTime4" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime5" class="tmTime5" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime6" class="tmTime6" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime7" class="tmTime7" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime8" class="tmTime8" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime9" class="tmTime9" placeholder="00:00"></td>
                <td><input type="text" value="" name="tmTime10" class="tmTime10" placeholder="00:00"></td>
                <td><input type="text" value="<%=1%>-<%=3%> 명" readonly></td>
            </tr>
        </table>
        
	       	<button onclick="addThemaTime();" class="upload-btn">등록</button>
	       	<a href="/themaManageTimeFrm.do" class="upload-a"><button class="cancel-btn">취소</button></a>

    </div>
    </div>
<script>
	function addThemaTime(){
		alert("쿼리하고와");
	}
	
	function getThemaCode(obj){
		let selectVal = $(obj).val();
		let tmName = $("#sltdCode").val();
		
	}
	
	const tabs=$(".tap-ul>li");
	tabs.on("click",function(){
		console.log("찍힘");
		tabs.css("color","black").css("background-color","white");
		$(this).css("color","white").css("background-color","rgb(255,193,7)");
	});
	tabs.eq(1).click();

</script>
</body>
</html>