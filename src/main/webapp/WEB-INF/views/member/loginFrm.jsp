<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="page-title">로그인</div>

		<form action="/login.do" method="post">
			<div>
				<div class="input-box">
					<label for="loginId">아이디</label>
					
					<input type="text" name="loginId" id="loginId" placeholder="아이디입력">
				</div>

				<div class="input-box">
					<label for="loginPw">비밀번호</label> <input type="password"
						name="loginPw" id="loginPw" placeholder="비밀번호입력">
				</div>

				<div class="input-box link-box">
					<a href="searchIdPw.do">아이디/비밀번호 찾기</a>
				</div>

			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">취소</button>
			</div>
		</form>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>