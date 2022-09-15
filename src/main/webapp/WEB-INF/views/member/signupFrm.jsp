<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
	.signupContent{
		background-color : white;
	}
</style>
<link rel = "stylesheet" href = "/css/signupFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="signupContent">
		<h3 class="page-title">회원가입</h3>
		<div class="tabstep ">이용약관</div>
		<div class="tabstep tabstep-now">정보입력</div>
		<div class="tabstep">완료</div>
		
		<form action="/signup.do" method ="post">
			<div class="input-wrap">
				<label for="memberId">아이디 <span id="ajaxCheckId"></span></a></label>
				<div class="id-wrap">
					<input type="text" name="memberId" id="memberId" class="input-form">
					<button type="button" id="idChkBtn" class="btn3">중복체크</button>
				</div>
			</div>
			
			<div class="input-wrap">
				<label for="memberPw">비밀번호</label>
					<input type="password" name="memberPw" id="memberPw" class="input-form">
			</div>
			
			<div class="input-wrap">
				<label for="memberName">이름</label>
					<input type="text" name="memberName" id="memberName" class="input-form">
			</div>
			
			<div class="input-wrap">
				<label for="memberPhone">전화번호</label>
					<input type="text" name="memberPhone" id="memberPhone" class="input-form">
			</div>
			
			<div class="input-wrap">
				<label for="memberMail">메일</label>
					<input type="text" name="memberMail" id="memberMail" class="input-form">
					<button onclick="sendMail();" class="btn3">인증메일전송</button>
				<div id="auth">
	              <input type="text" id="authCode" placeholder="인증코드입력" class="input-form">
	              <button class="btn3" id="authBtn">인증하기</button>
	              <span id="timeZone"></span>
	              <span id="authMsg"></span>
			</div>
			
			<div class="submit-btn">
				<button type="submit" class="btn3">회원가입</button>
			</div>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>