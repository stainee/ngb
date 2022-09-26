<%@page import="com.ngb.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
		String pageNavi = (String)request.getAttribute("pageNavi");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel="stylesheet" href="/css/noticeList.css">


</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">
		<div class="page-title">
			<h2>NOTICE</h2>
		</div>

		<table class="notice-tbl">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 45%;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 20%;">작성일</th>
				<th style="width: 10%;">조회수</th>
			</tr>

			<%for(Notice n : list) {%>

			<tr class="tr-2">

				<td><%=n.getNoticeNo() %></td>
				<td><a href="/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle() %></a>
				</td>
				<td><%=n.getNoticeWriter() %></td>
				<td><%=n.getRegDate() %></td>
				<td><%=n.getReadCount() %></td>

			</tr>

			<%} %>
		</table>	
		<%if(m!=null && m.getMemberLevel() == 0) {%>
		<div class="btn-box">
		<button class="btn2 writeBtn"><a href="/noticeWriteFrm.do">글쓰기</a></button>
		</div>
		<%} %>
		<div id="pageNavi"><%=pageNavi %></div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>