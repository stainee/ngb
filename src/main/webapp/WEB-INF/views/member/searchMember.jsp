<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="css/searchMember.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">
		<div class="content-box first-content show-hide">
			<div class="center-move">
				<div class="search-wrap">
					<div class="searchId">아이디 찾기</div>
					<div class="searchPw">비밀번호 찾기</div>
				</div>
				<div class="search-content">
					<span>이름 입력</span> <input type="text" name="searchName"
						id="searchName" placeholder="조회할 이름 입력">
				</div>
				<div class="search-content">
					<span>이메일 입력</span> <input type="text" name="searchId"
						id="searchId" placeholder="이메일 입력">
				</div>
				<div class="search-content">
					<button type="submit" class="btn2 first-btn">조회</button>
				</div>
			</div>
		</div>

		<div class="content-box second-content show-hide">
			<div class="center-move">
				<div class="search-wrap">
					<div class="searchId">아이디 찾기</div>
					<div class="searchPw">비밀번호 찾기</div>
				</div>
				<div class="search-content">
					<span>ID 입력</span> <input type="text" name="searchId" id="searchId"
						placeholder="비밀번호를 조회할 아이디 입력">
				</div>
				<div class="search-content">
					<span>이메일 입력</span> <input type="text" name="searchName"
						id="searchName" placeholder="이메일 입력">
				</div>
				<div class="search-content">
					<button type="submit" class="btn2 second-btn">조회</button>
				</div>
			</div>
		</div>

	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="js/searchMember.js"></script>
</body>
</html>