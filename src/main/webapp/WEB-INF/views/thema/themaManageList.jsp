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
<title>Insert title here</title>
<link rel = "stylesheet" href = "/css/themaManageList.css">
<link rel = "stylesheet" href = "/css/notosans.css">
<style>
.tap-wrap{
    margin-top: 30px;
    margin-left: 370px;
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
    padding-left: 350px;
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

.reserve-btn{
    margin-top: 20px;
    width:80px;
   height:40px;
   background-color: rgb(230,230,230);
   box-shadow: 0px 0.5px 0.5px 0.5px black;
   border-radius: 50px;
   cursor: pointer;
   font-size:20px;
    margin-left: 1150px;
}

.reserve-btn>a{
   text-decoration: none;
}

.reserve-btn>a:link{
   color:black;
}

.reserve-btn>a:visited{
   color:black;
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
            <%for(Thema thema:list) {%>
            <tr class="tr-3">
                <td><%=thema.getThemaCode() %></td>
                <td><%=thema.getCategory()%></td>
                <td>
                     <a href="/themaManageView.do?themaCode=<%=thema.getThemaCode()%>"><%=thema.getThemaName() %></a>
                </td>
                <td><%=thema.getThemaPrice() %></td>
                <td><%=thema.getThemaTime()%></td>
                <td><%=thema.getDevicePer() %></td>
                <td><%=thema.getLockPer() %></td>
                <td><%=thema.getPeopleMin() %></td>
                <td><%=thema.getPeopleMax() %></td>
                <td><%=thema.getThemaLevel() %></td>
            </tr>
            <%}%>
        </table>
       <a href="/themaWriteFrm.do"><button class="reserve-btn">등록</button></a>
    </div>
    <script>
   
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