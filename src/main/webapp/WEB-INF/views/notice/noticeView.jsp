    <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.ngb.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%
Notice n = (Notice) request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/noticeView.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="page-title">공지사항</div>
		<table class="tbl" id="noticeView">
			<tr class="tr-3">
				<th colspan="6"><%=n.getNoticeTitle()%></th>
			</tr>
			<tr class="tr-1">
				<th class="td-3">작성자</th>
				<td><%=n.getNoticeWriter()%></td>
				<th class="td-3">조회수</th>
				<td><%=n.getReadCount()%></td>
				<th class="td-3">작성일</th>
				<td><%=n.getRegDate()%></td>
			</tr>
			<tr>
				<td colspan="6">
					<div id="noticeContent">
						<%=n.getNoticeContentBr()%>
					</div>
				</td>
			</tr>
			<!-- 로그인 되어있고 작성자랑 세션의 아이디가 같을때 라는 조건 -->
			<%
			if (m != null && n.getNoticeWriter().equals(m.getMemberId())) {
			%>
			<tr>
				<th colspan="6"><a
					href="/noticeUpdateFrm.do?noticeNo=<%=n.getNoticeNo()%>">수정</a>
					<button onclick="noticeDelete(<%=n.getNoticeNo()%>);">삭제</button></th>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>