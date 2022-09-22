<%@page import="com.ngb.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
    	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">
		<div class="page-title">공지사항</div>

		<!-- m에 로그인되있으면 유저데이터 안되있으면 null이 들어간다. -->
		<%if(m.getMemberLevel() == 0) {%>
		<a class="btn2 writeBtn" href="/noticeWriteFrm.do">글쓰기</a>
		<%} %>

		<table>

			<tr>

				<th style="width: 10%;">번호</th>
				<th style="width: 45%;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 20%;">작성일</th>
				<th style="width: 10%;">조회수</th>

			</tr>

			<%for(Notice n : list) {%>

			<tr class="tr-1">

				<td><%=n.getNoticeNo() %></td>
				<td><a href="/noticeView.do?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle() %></a>
				</td>
				<td><%=n.getNoticeWriter() %></td>
				<td><%=n.getRegDate() %></td>
				<td><%=n.getReadCount() %></td>

			</tr>

			<%} %>
		</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>