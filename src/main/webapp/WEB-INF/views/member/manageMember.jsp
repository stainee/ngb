<%@page import="java.util.ArrayList"%>
<%@page import="com.ngb.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
	<link rel="stylesheet" href="/css/memberManage.css">
	<link rel = "stylesheet" href = "/css/notosans.css">
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
	<div class="title-wrap">회원 목록</div>
		
		<%-- 우선순위 나중
		<div>
			<select>
				<option>이름</option>
				<option>아이디</option>
				<option>이메일</option>
				<option>전화번호</option>
			</select>
		</div>
		--%>
	
			<table class="tbl tbl-hover notice-tbl">
		        <tr class="tr-1">
		        	<th>회원번호</th>
		        	<th>이름</th>
		            <th>아이디</th>
		            <th>비밀번호</th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>등급</th>
		            <th>가입일</th>	
		            <th>관리자모드</th>
		        </tr>
			    <%for(Member m : list) {%>
		        <tr class="tr-3">
		        	<td>
		        		<%=m.getMemberNo() %>
		        		<input type = "hidden" name = "memberNo" value = <%=m.getMemberNo() %>>
		        	</td>
		        	<td>
		        		<%=m.getMemberName() %>
		        		<input type = "hidden" name = "memberName" value = <%=m.getMemberName() %>>
		        	</td>
		        	<td>
		        		<%=m.getMemberId() %>
		        		<input type = "hidden" name = "memberId" value = <%=m.getMemberId() %>>
		        	</td>
		        	<td>
		        		<%=m.getMemberPw() %>
		        		<input type = "hidden" name = "memberPw" value = <%=m.getMemberPw() %>>
		        	</td>
		        	<td>
		        		<%=m.getMemberPhone() %>
		        		<input type = "hidden" name = "memberPhone" value = <%=m.getMemberPhone() %>>
		        	</td>
		        	<td>
		        		<%=m.getMemberMail() %>
		        		<input type = "hidden" name = "memberMail" value = <%=m.getMemberMail() %>>
		        	</td>
		        	<td>
		        		<%if(m.getMemberLevel() == 0) { %>
		        		관리자
		        		<input type = "hidden" name = "memberLevel" value = <%=m.getMemberLevel()%>>
		        		<%}else	{%>
		        		일반회원
		        		<input type = "hidden" name = "memberLevel" value = <%=m.getMemberLevel()%>>
		        		<%} %>
		        	</td>
		        	<td>
		        		<%=m.getEnrollDate() %>
		        		<input type = "hidden" name = "enrollDate" value = <%=m.getEnrollDate() %>>
		        	</td>
		        	<td>
		        		<a href="/editMemberManageFrm.do?memberNo=<%=m.getMemberNo()%>"><button class="manage-btn">관리</button></a>
		        	</td>
	        	</tr>
	        	<%} %>
	    	</table>
	    </div>
 
</body>
</html>