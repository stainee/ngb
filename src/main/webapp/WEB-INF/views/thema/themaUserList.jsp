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

<link rel = "stylesheet" href = "/css/ThemaUserView.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
		<div class="title-wrap">
			<span class="title-span">ABOUT THEMA</span>
		</div>
	
		
	        <form action="/searchThema.do" method="post" class="thema-select-wrap" >
	            <span class="level-span">난이도</span>
	            <select class="level" name="level">
	                <option value="0">전체</option>
	                <option value="1">아주 쉬움</option>
	                <option value="2">쉬움</option>
	                <option value="3">보통</option>
	                <option value="4">어려움</option>
	                <option value="5">매우 어려움</option>
	            </select>
	
	            <span class="select-them-span">테마</span>
	            <select class="select-thema" name="select-thema">
	                <option value="전체">전체</option>
	                <option value="공포">공포</option>
	                <option value="SF">SF</option>
	                <option value="추리">추리</option>
	                <option value="감성">감성</option>
	            </select>
	            <button class="search-btn" type="submit">검색</button>
        	</form>
        	 
		
		
		<hr>
	    <div class="thema-content-wrap">
	    <%for(Thema thema: list) {%>
            <a href="/themaUserView.do?themaCode=<%=thema.getThemaCode()%>" class="content-font">
            <div class="thema-wrap">
                <div class="img-wrap"><img src="/upload/thema/<%=thema.getThemaFilepath() %>" class="imgwrap"></div>
                <span class="category"><%=thema.getCategory() %></span>
                <%for(int i=0; i<thema.getThemaLevel(); i++) {%>
                	<img src="/img/key.png" class="key">
                <%} %>
                <br>
                <span class="thema-name"><%=thema.getThemaName() %></span>    
            </div>
            </a>
         <%} %>
        </div>
           

        
          
       <%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>