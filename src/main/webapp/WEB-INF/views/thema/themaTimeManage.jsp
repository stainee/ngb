<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 시간 수정</title>
<link rel = "stylesheet" href = "/css/notosans.css">
<style>
.tap-wrap{
	width:1800px;
    margin: 30px auto;
    padding-left: 370px;
}

.tap-ul{
	width:1300px;
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


/*테이블*/
.table-wrap{
	width:1800px;
    margin: 0 auto;
    padding-left: 350px;
}


.tbl{
    margin-left: 20px;
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
}

.reserve-btn{
	display: inline-block;
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: rgb(55,55,55);
	color: white;
	box-shadow: 0px 0.2px 0.2px 0.2px white;
	border-radius: 50px;
	cursor: pointer;
	font-size:15px;
	text-decoration: none;
	font-family: ns-bold;
}

.reserve-btn:hover{
	display: inline-block;
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: white;
	color: black;
	box-shadow: 0px 0.2px 0.2px 0.2px rgb(55,55,55);
	border-radius: 50px;
	cursor: pointer;
	font-size:15px;
	text-decoration: none;
	font-family: ns-bold;
}
.reserve-btn1{
	margin-left: 1050px;
}
.reserve-btn2{
	margin-left: 30px;
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
.timeDelBtn{
	width: 80px;
	background-color: rgb(55,55,55);
	color: white;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	
    <div class="tap-wrap">
         <ul class="tap-ul">
         	<li>테마관리</li>
         	<li>시간관리</li>
         </ul>
    </div>
    
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
        <div class="timeBtn-wrap">
	       	<button onclick="editThemaTime();" class="reserve-btn reserve-btn1">수정</button>
	       	<a href="/themaManageTimeFrm.do"><button class="reserve-btn reserve-btn2">취소</button></a>
       	</div>
    </div>
<script>
function deleteThemaTime(){
	alert("쿼리부터하고와라");
}

const tabs=$(".tap-ul>li");
tabs.on("click",function(){
	console.log("찍힘");
	tabs.css("color","black").css("background-color","white");
	$(this).css("color","white").css("background-color","rgb(255,193,7)");
});
tabs.eq(0).click();


</script>
</body>
</html>