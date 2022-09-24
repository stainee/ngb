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
		<div class="title-wrap">
			<h2>아이디/비밀번호 찾기</h2>
		</div>
		<div class="content-box first-content show-hide">
			<div class="center-move">
				<div class="search-wrap">
					<div class="searchId">아이디 찾기</div>
					<div class="searchPw">비밀번호 찾기</div>
				</div>
				<div class="search-content">
					<span>이름</span> <input type="text" name="searchName"
						id="searchName" placeholder="조회할 이름 입력">
				</div>
				<div class="search-content">
					<span>이메일</span> <input type="text" name="searchMail"
						id="searchMail1" placeholder="이메일 입력">
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
					<span>아이디</span> <input type="text" name="searchId" id="searchId"
						placeholder="비밀번호를 조회할 아이디 입력">
						<div class="btn-box"></div>
				</div>
				<div class="search-content">
					<span>이메일</span> <input type="text" name="searchMail"
						id="searchMail2" placeholder="이메일 입력">
					<div class="btn-box">
						<button onclick="sendMail();" class="btn2 notsubmit">인증메일전송</button>
					</div>
				</div>
				
				<!-- 인증코드 -->
				<div class="search-content">
					<div id="auth">
						<input type="text" id="authCode" placeholder="인증코드입력"
							class="input-form">
						<div class="btn-center">
							<button class="btn2" id="authBtn">인증하기</button>
						</div>
						<div class="span-box">
                            <span id="timeZone"></span>
                            <span id="authMsg"></span>
                        </div>
					</div>
				</div>
				
				<!-- 인증코드 -->

				<div class="search-content">
					<button type="button" class="btn2 second-btn">조회</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 모달 -->

	<div class="modal-wrap">
		<div class="modal">
			<div class="modal-top">
				<h1>조회결과</h1>
			</div>
			
			<div class="modal-content">
                <div>
                    <p class="result"></p>
                    <div class="btn-last">
                        <button type="button" id="close" class="btn2">닫기</button>
                    </div>
                </div>
            </div>
			
		</div>
	</div>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/js/searchMember.js"></script>
</body>
</html>