<%@page import="com.ngb.thema.model.vo.ThemaTime"%>
<%@page import="com.ngb.thema.model.vo.ThemaTimeManage"%>
<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Thema> list =(ArrayList<Thema>)request.getAttribute("list");
    Thema tCodeName = (Thema)request.getAttribute("tCodeName");
    ArrayList<ThemaTimeManage> oneTimeList =(ArrayList<ThemaTimeManage>)request.getAttribute("oneTimeList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel = "stylesheet" href = "/css/notosans.css">
<link rel = "stylesheet" href = "/css/themaTimeAddFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
	
    <div class="tap-wrap">
         <ul class="tap-ul">
         	<li><a href="/themaManageList.do" style="text-decoration-line: none; display:block;  width:100%;">테마관리</a></li>
         	<li><a href="/themaManageTimeFrm.do" style="text-decoration-line: none; display:block;  width:100%;">시간관리</a></li>
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
            </tr>
            <tr class="tr-3">
                <td>
                	<%=tCodeName.getThemaName()%>
                	<input type="hidden" class = "tmCode" name="themaCode" value="<%=tCodeName.getThemaCode() %>">
                </td>
                <%for(ThemaTimeManage t : oneTimeList){ %>
                <td>
                	<input type="text" value="<%=t.getTime() %>" name="tmTime" class="tmTime" placeholder="00:00">
                </td>
                <%} %>
                
                <form action = "/themaTimeAdd.do" id = "frm">
                <input type = "hidden" value = "" name="tmCode" class = "tmCode">
                <td><input type="hidden" value="" name="tmTime1" class="tmTime1" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime2" class="tmTime2" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime3" class="tmTime3" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime4" class="tmTime4" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime5" class="tmTime5" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime6" class="tmTime6" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime7" class="tmTime7" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime8" class="tmTime8" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime9" class="tmTime9" placeholder="00:00"></td>
                <td><input type="hidden" value="" name="tmTime10" class="tmTime10" placeholder="00:00"></td>
                </form>
            </tr>
        </table>
	       	<button class="upload-btn">등록</button>
	       	<a href="/themaManageTimeFrm.do" class="upload-a"><button class="cancel-btn">취소</button></a>

    </div>
    </div>
<script>
	$(".upload-btn").on("click",function(){
		const tmTime = $(".tmTime");
		const tmCode = $(".tmCode");
		$(".tmCode").val(tmCode.eq(0).val());
		$(".tmTime1").val(tmTime.eq(0).val());
		$(".tmTime2").val(tmTime.eq(1).val());
		$(".tmTime3").val(tmTime.eq(2).val());
		$(".tmTime4").val(tmTime.eq(3).val());
		$(".tmTime5").val(tmTime.eq(4).val());
		$(".tmTime6").val(tmTime.eq(5).val());
		$(".tmTime7").val(tmTime.eq(6).val());
		$(".tmTime8").val(tmTime.eq(7).val());
		$(".tmTime9").val(tmTime.eq(8).val());
		$(".tmTime10").val(tmTime.eq(9).val());
		$("#frm").submit();
	});
	
	function getThemaCode(obj){
		let selectVal = $(obj).val();
		let tmName = $("#sltdCode").val();
		
	}
	
	const tabs=$(".tap-ul>li");
	tabs.on("click",function(){
		tabs.css("color","black").css("background-color","white");
		$(this).css("color","white").css("background-color","rgb(255,193,7)");
	});
	tabs.eq(1).click();

</script>
</body>
</html>