<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테마 시간 등록</title>
<style>
.tap-wrap{
    margin-top: 30px;
    margin-left: 260px;
    padding: 0;
}


.tab-time{
    margin-left: 20px;
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


/*테이블*/
.table-wrap{
	width:1800px;
    margin: 30px auto;
    padding-left: 240px;
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
	background-color: rgb(230,230,230);
	box-shadow: 0px 0.5px 0.5px 0.5px black;
	border-radius: 50px;
	cursor: pointer;
	font-size:20px;
	text-decoration: none;
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
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
    <div class="tap-wrap">
        <a href="themaManageList.do"><button class="btn2 tab-thema">테마관리</button></a>
        <a href="themaManageTimeFrm.do"><button class="btn2 tab-time">시간관리</button></a>
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
            </tr>
        </table>
        <div class="timeBtn-wrap">
	       	<button onclick="addThemaTime();" class="reserve-btn reserve-btn1">등록</button>
	       	<a href="/themaManageTimeFrm.do"><button class="reserve-btn reserve-btn2">취소</button></a>
       	</div>
    </div>
<script>
function addThemaTime(){
	alert("쿼리하고와");
}
</script>
</body>
</html>