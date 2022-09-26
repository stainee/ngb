<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 시간 수정(관리자용)</title>
<link rel="icon" href="/img/logo2.png">
<link rel = "stylesheet" href = "/css/notosans.css">
<link rel = "stylesheet" href = "/css/themaTimeManage.css">
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
    
    <div class="title-wrap">테마별 시간 수정</div>
    
    <div class="table-wrap">
        <table class="tbl tbl-hover notice-tbl">
            <tr class="tr-1">
                <th>테마코드</th>
                <th>테마명</th>
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
                <th>관리</th>
                <th></th>
            </tr>
            <tr class="tr-3">
                <td><input type="text" value="테마코드"></td>
                <td><input type="text" value="테마명"></td>
                <td><input type="text" value="타임1"></td>
                <td><input type="text" value="타임2"></td>
                <td><input type="text" value="타임3"></td>
                <td><input type="text" value="타임4"></td>
                <td><input type="text" value="타임5"></td>
                <td><input type="text" value="타임6"></td>
                <td><input type="text" value="타임7"></td>
                <td><input type="text" value="타임8"></td>
                <td><input type="text" value="타임9"></td>
                <td><input type="text" value="타임10"></td>
                <td><input type="text" value="1-3명"></td>
                <td>
                	<button onclick="deleteThemaTime();" class="timeDelBtn">삭제</button>
                </td>
            </tr>
        </table>

	    <button onclick="editThemaTime();" class="update-btn">수정</button>
	    <a href="/themaManageTimeFrm.do"class="cancel-a"><button class="cancel-btn">취소</button></a>
 
    </div>
</div>
<script>
	function deleteThemaTime(){
		alert("쿼리부터하고와라");
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