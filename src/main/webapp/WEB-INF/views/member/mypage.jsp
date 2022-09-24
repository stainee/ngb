<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mypageFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<h2>마이페이지</h2><br>
	<div class="content-wrap">
		<div class="title-wrap">
			<h2>MY PAGE</h2>
		</div>
		<div class="input-wraps">
			<div class="subjects">아이디</div>
			<div class="contentss" >
				<input type="text" class="editAlert" id="userId" name="userId" value=<%=m.getMemberId() %> disabled>
				<input type="hidden" id="userNo" name="userNo" value=<%=m.getMemberNo() %>>
			</div>
		</div>
		<div class="input-wraps">
			<div class="subjects">이름</div>
			<div class="contentss">
				<input type="text" class="editAlert" id="userName" name="userName" value=<%=m.getMemberName() %> disabled>
			</div>
		</div>
		<div class="input-wraps">
			<div class="subjects">비밀번호</div>
			<div class="contentss">
				<input type="password" id="userPw" name="userPw" style="color: blue" value=<%=m.getMemberPw() %>>
			</div>
			<span id="pwChk"></span>
		</div>
		<div class="input-wraps">
			<div class="subjects">비밀번호확인</div>
			<div class="contentss">
				<input type="password" id="userPwRe" name="userPwRe" style="color: blue" value=<%=m.getMemberPw() %>>
			</div>
		</div>
		<div class="input-wraps">
			<div class="subjects">이메일주소</div>
			<div class="contentss">
				<input type="text" class="editAlert" id="userMail" name="userMail" value=<%=m.getMemberMail() %> disabled>
			</div>
		</div>
		<div class="input-wraps">
			<div class="subjects">전화번호</div>
			<div class="contentss">
				<input type="text" id="userPhone" name="userPhone" style="color: blue" value=<%=m.getMemberPhone() %>>
			</div>
		</div>
		<div class="input-wraps">
			<div>
				<button onclick="updateUser();" class="bot-btn btn2" id="editDiv">회원수정</button>
			</div>
			<div>
				<button onclick="deleteFunc();" class="bot-btn btn2" id="delDiv">회원탈퇴</button>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
<script src="/js/mypage.js"></script>
</body>
</html>