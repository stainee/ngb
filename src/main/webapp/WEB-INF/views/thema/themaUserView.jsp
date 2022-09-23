<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
        	Thema t = (Thema)request.getAttribute("t");
   		 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/notosans.css">
<link rel="stylesheet" href="/css/themaUser.css">

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
		<div class="title-wrap">
			<span class="title-span">ABOUT THEMA</span>
		</div>
	
	
        <div class="thema-wrap">
            
            <div class="img-wrap">
                <img src="/upload/thema/<%=t.getThemaFilepath() %>" class="img-content">
            </div>
            <form class="thema-content-wrap">
            	<input value="<%=t.getThemaCode()%>" type="hidden">
            	<div class="thema-title">INTRODUCTION</div>
                <table class="thema-table">
                    <tr>
                        <th class="thColor">카테고리</th>
                        <th colspan="3" class="th-left"><%=t.getCategory() %></th>
                    </tr>
                    <tr>
                        <th class="thColor">테마명</th>
                        <th colspan="3" class="th-left"><%=t.getThemaName() %></th>
                    </tr>
                    <tr>
                        <th class="thColor">시간제한</th>
                        <th colspan="3" class="th-left"><%=t.getThemaTime() %>분</th>
                    </tr>
                    <tr>
                        <th class="thColor">잠금장치</th>
                        <th><%=t.getDevicePer() %>%</th>
                        <th class="thColor">자물쇠</th>
                        <th><%=t.getLockPer() %>%</th>
                    </tr>
                    <tr>
                        <th class="thColor">최소인원</th>
                        <th><%=t.getPeopleMin() %>명</th>
                        <th class="thColor">최대인원</th>
                        <th><%=t.getPeopleMax() %>명</th>
                    </tr>
                    <tr>
                        <th class="thColor">난이도</th>
                        <th colspan="3" class="th-left">
                        <%for(int i=0; i<t.getThemaLevel(); i++) {%>
                			<img src="/img/key.png" class="key">
                		<%} %></th>
                    </tr>
                    <tr>
                        <th class="thColor">내용</th>
                        <th colspan="3" class="th-left"><%=t.getThemaContentBr()%></th>
                    </tr>
                </table>
            </form>
            <button class="reserve-btn" type="submit">예약하기</button>
        </div>
        
        <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>