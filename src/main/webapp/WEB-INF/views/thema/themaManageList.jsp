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
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel = "stylesheet" href = "/css/themaManageList.css">
<link rel = "stylesheet" href = "/css/notosans.css">

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
    </div>
    <script>
    
    const pageSelector = 2;
    </script>
</body>
</html>