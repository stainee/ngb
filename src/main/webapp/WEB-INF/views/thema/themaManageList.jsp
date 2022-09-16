<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.tap-wrap{
    margin-top: 30px;
    margin-left: 270px;
    padding: 0;
}


.tab-time{
    margin-left: 20px;
}

.btn2{
	width:100px;
	height:50px;
	background-color: rgb(255,193,7);
	box-shadow: 1px 1px 1px 1px black;
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
    margin-top: 20px;
    margin-left: 250px;
}


.tbl{
    margin-left: 20px;
    width: 1200px;
    border-spacing: 0px;
    border-collapse: collapse;
}
.tbl th,.tbl td {
    padding: 1rem;
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
    text-align : left;
}

.tbl .tr-1 {
    background-color: rgb(255,193,7);
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

.reserve-btn{
    margin-top: 20px;
    width:80px;
	height:40px;
	background-color: rgb(230,230,230);
	box-shadow: 0px 1px 1px 1px black;
	border-radius: 50px;
	cursor: pointer;
	font-size:20px;
    margin-left: 1150px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	


    <div class="tap-wrap">
        <button class="btn2 tab-thema">테마관리</button>
        <button class="btn2 tab-time">시간관리</button>
    </div>

    <div class="table-wrap">
        <table class="tbl tbl-hover notice-tbl">
            <tr class="tr-1">
                <th>테마코드</th>
                <th>테마</th>
                <th>테마명</th>
                <th>가격(1인당)</th>
                <th>시간제한</th>
                <th>잠금장치</th>
                <th>자물쇠</th>
                <th>최소인원</th>
                <th>최대인원</th>
                <th>난이도</th>
            </tr>
            <tr class="tr-3">
                <td>A001</td>
                <td>공포</td>
                <td>당산에서 살아남기</td>
                <td>18000</td>
                <td>120</td>
                <td>70</td>
                <td>30</td>
                <td>2</td>
                <td>4</td>
                <td>3</td>
            </tr>
        </table>

       <button class="reserve-btn"><a href="/themaWriteFrm.do">등록</a></button>
    </div>
</body>
</html>