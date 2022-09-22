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
	<h2>마이페이지</h2>
	<div class="content-wrap">
		
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
				<button onclick="updateUser();" class="bot-btn" id="editDiv">회원수정</button>
			</div>
			<div>
				<a href="/deleteMember.do?memberNo=<%=m.getMemberNo()%>"><button class="bot-btn">회원탈퇴</button></a>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
<%--	<script src="/js/mypage.js"></script>   --%>
<script>

function updateUser(){
	const userNo = $("#userNo").val();
	const userPw = $("#userPw").val();
	const userPwRe = $("#userPwRe").val();
	const userPhone = $("#userPhone").val();
	const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	const phoneReg = /^[0-9]{11}$/;
	let phoneRegState = true;
	let pwRegState = true;
	pwRegState = pwReg.test(userPw); //조건이 다만족이면 얘가 true로 남게
	if(pwReg.test(userPw) && userPw==userPwRe){
		pwRegState = true;
	}else{
		alert("비밀번호를 확인하세요.\n1.비밀번호 일치\n2.대소문자,숫자,특수문자포함 8자 이상");
		pwRegState = false;
	}
	
	if(phoneReg.test(userPhone)){
		let phoneRegState = true
	}else{
		alert("전화번호를 확인하세요.\nex)01012345678");
		let phoneRegState = false;
	}
	
	if(pwRegState && phoneRegState){
		$.ajax({
			url : "/updateUser.do",
			type : "get",
			data : {
				userNo:userNo,
				userPw:userPw,
				userPhone:userPhone
			},
			success : function(data){
				if(data==1){
					alert("수정이 완료되었습니다.");
					location = "/mypageFrm.do"				
				}else{
					location = "/mypageFrm.do"	
				}
			},
			error :function(){
				alert("수정 중 오류가 발생하였습니다.(error)");
				location = "/mypageFrm.do"
			}
		});
	}
}
</script>
</body>
</html>