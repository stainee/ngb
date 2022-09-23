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
<style>

.tap-wrap{
	width:1800px;
    margin: 30px auto;
}

.tap-ul{
	width:1200px;
	border-bottom: 1px solid rgb(255,193,7);
	list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    
}

.tap-ul>li{
	width:200px;
	height: 50px;
	line-height:50px;
	text-align: center;
	float:left;
	background-color:rgb(255,193,7);
	box-sizing: border-box;
	font-weight: bold;
	font-family: ns-bold;
}


.tap-ul>li:hover{
	cursor:pointer;
}


.btn2{
	width:100px;
	height:50px;
	background-color: rgb(255,193,7);
	box-shadow: 0.5px 0.5px 0.5px 0.5px black;
	cursor: pointer;
	font-size:20px;
}

.btn2:active{
	width:100px;
	height:50px;
	background-color: rgb(255,193,7);
	border:1px solid black;
	box-shadow: none;
}
.addThemaCode{
	text-align: center;
	width: 160px;
}

/*테이블*/
.table-wrap{
	width:1200px;
    flaot:left;
}


.tbl{
    width: 1200px;
    border-spacing: 0px;
    border-collapse: collapse;
}
.tbl th,.tbl td {
    padding: 0.1rem;
    text-align: center;
}
.tbl td>a {
    text-decoration: none;
    color : black;
}

.notice-tbl a:hover{
    text-decoration : underline;
}
.notice-tbl tr{
    border-bottom : 1px solid #ccc;
}
.notice-tbl tr>td:nth-child(2){
    text-align : center;
}

.tbl .tr-1 {
    background-color: white;
    border-top: 3px solid rgb(255,193,7);
    border-bottom: 3px solid rgb(255,193,7);
}
.tbl .tr-2 {
    background-color: rgba(57, 62, 70, 0.1);
    
}
.tbl .tr-3 {
    background-color: rgba(255, 255, 255, 1);
    
}
.tbl .tr-4 {
    background-color: #664d02;
}
.tbl.tbl-hover .tr-3:hover {
    background-color: rgba(0, 0, 0, 0.05);
}
.timeBtn-wrap{
	display: flex;
	margin-left: -20px;
}

.reserve-btn{
	display: inline-block;
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: rgb(230,230,230);
	box-shadow: 0px 0.5px 0.5px 0.5px black;
	border-radius: 50px;
	cursor: pointer;
	font-size:20px;
	text-decoration: none;
}
.reserve-btn1{
	margin-left: 1050px;
	margin-right:30px;
}
.reserve-btn2{
}

.reserve-btn:link{
	color:black;
}

.reserve-btn:visited{
	color:black;
}

.tr-3 input{
	width: 90px;
	height: 20px;
	border: none;
	text-align: center;
	outline: none;
}

.timeBtn-wrap>a{
	width: 80px;
	height:40px;
}

.content-wrap{
	width: 1400px;
	/*margin-left:20vw;*/
	margin-top:3vw;
}

.upload-a{
	text-decoration: none;
	width:80px;
}

.upload-btn{
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: rgb(55,55,55);
	box-shadow: 0px 0.5px 0.5px 0.5px black;
	color: white;
	border-radius: 50px;
	cursor: pointer;
	font-size:15px;
	float:right;
}

.cancel-btn{
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: rgb(55,55,55);
	box-shadow: 0px 0.5px 0.5px 0.5px black;
	color: white;
	border-radius: 50px;
	cursor: pointer;
	font-size:15px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
    <div class="tap-wrap">
         <ul class="tap-ul">
         	<li>테마관리</li>
         	<li>시간관리</li>
         </ul>
    </div>
    
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