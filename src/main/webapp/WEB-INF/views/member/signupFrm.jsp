<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/css/signupFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">

		<div class="content-box">
			<div class="title-wrap">
				<h2>회원가입</h2>
			</div>
			<div class="tab-menu">
				<ul class="tabstep tabstep-now ">
					<img src="img/tabstep1.png">이용약관
				</ul>
				<ul class="tabstep">
					<img src="img/tabstep2.png">회원가입
				</ul>
				<ul class="tabstep">
					<img src="img/tabstep3.png">완료
				</ul>
			</div>
			<div class="signup-content">
				<div class="center-move">
					<textarea readonly class="textarea-form">
정보통신망법 규정에 따라 주식회사 나가방에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 대부분의 나가방 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 개인 기록과 같은 회원제 서비스를 이용하기 위해 홈페이지 회원 가입 시에 “아이디, 비밀번호, 이름, 휴대폰 번호,이메일”을 필수항목으로 수집합니다. 

2. 개인정보의 수집 및 이용목적
주식회사 나가방은 홈페이지 회원 가입 및 관리, 예약서비스 제공에 관한 결제정보, 신규 서비스 개발 및 마케팅 광고에의 활용을 위하여 아래와 같은 최소한의 개인정보를 필수항목으로 온라인상에서 입력 받아 수집하고 있으며, 별도의 민간정보를 수집하지 않습니다.

1) 홈페이지 회원 가입 및 관리
- 아이디, 비밀번호, 이름, 휴대폰 번호, 이메일

2) 예약서비스 제공에 관한 결제 정보 등 개인정보 수집
- 이용자가 구매한 재화나 용역의 대금 결제
- 결제 과정 중 본인 식별, 인증, 실명확인 및 이용자가 결제한 거래의 내역을 요청하는 경우 응대 및 확인
- 이용자가 결제한 거래의 취소 또는 환불, 상품 배송 등 전자상거래 관련 서비스 제공
- 이용자가 결제한 대금의 청구 및 수납
- 전자금융거래 및 통신과금 서비스 이용 불가능한 이용자(미성년자 등)와 불량, 불법 이용자의 부정 이용 방지
- 서비스 제공 및 관련 업무 처리에 필요한 동의 또는 철회 등 의사확인
- 회사가 제공하는 결제알림메일 발송
- 고객 불만 및 민원처리

3) 신규 서비스 개발 및 마케팅 광고에의 활용
- 이용 빈도 파악 및 마케팅 특성에 따른 서비스 제공 및 CRM 용도
- 신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트, 광고성 정보 제공(결제알림메일 내) 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계

3. 개인정보 보유 및 이용기간
주식회사 나가방은 이용자의 개인정보에 대해 개인정보의 수집 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 다만, 수집 목적이 살성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 회원의 개인정보를 보유할 수 있습니다.
- 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우
- 부정이용기록(부정가입, 징계기록 등의 비정상적 서비스 이용기록) : 1년
- 계약 또는 청약철회 등에 관한 기록 : 5년
- 대금결제 및 재화 등의 공급에 관한 기록 : 5년
- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
- 정당한 절차에 따라 보유기간을 미리 회원에게 고지하거나 명시한 경우

                </textarea>

				</div>
				<div class="agree">
					<label><input type="checkbox" name="agreeCheckBox">이용약관의
						내용에 동의합니다.</label>
				</div>
				<div class="center-move">
					<button class="btn2 agreeBtn nextBtn">다음</button>
				</div>
			</div>
			<!-----------------------------------------------이 위는 약관동의 -->

			<!-----------------------------------------------이 아래는 사용자 데이터 받기 -->
			<div class="signup-content">
				<div class="center-move">
					<div>
						<form action="/signup.do" method="post">
							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberId">아이디 <span id="ajaxCheckId"></span></a></label>
								</div>
								<div class="id-wrap">
									<div class="input-location">
										<input type="text" name="memberId" id="memberId"
											class="input-form" placeholder="문자 6자 이상 입력">
									</div>
									<span id="idChkMsg"></span>
								</div>
							</div>
							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberPw">비밀번호</label>
								</div>
								<div class="input-location ">
									<input type="password" name="memberPw" id="memberPw"
										class="input-form" placeholder="대소문자,숫자,특수문자 8자 이상 입력">
								</div>
								<span id="pwChkMsg"></span>
							</div>
							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberPw">비밀번호확인</label>
								</div>
								<div class="input-location ">
									<input type="password" name="memberPwRe" id="memberPwRe"
										class="input-form">
								</div>
								<span id="pwReChkMsg"></span>
							</div>

							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberName">이름</label>
								</div>
								<div class="input-location">
									<input type="text" name="memberName" id="memberName"
										class="input-form">
								</div>
							</div>
							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberPhone">전화번호</label>
								</div>
								<div class="input-location ">
									<input type="text" name="memberPhone" id="memberPhone"
										class="input-form" placeholder="01012349876">
								</div>
								<span id="phoneChkMsg"></span>
							</div>
							<div class="input-wrap">
								<div class="input-location input-backColor">
									<label for="memberMail">메일</label>
								</div>
								<div class="input-location">
									<input type="text" name="memberMail" id="memberMail"
										class="input-form">
								</div>
								<div class="backColor mailBtn">
									<button onclick="sendMail();" class="btn3 notsubmit">인증메일전송</button>
								</div>
								<div id="auth">
									<div class="input-location input-backColor">
										<label>인증번호</label>
									</div>
									<div class="input-location">
										<input type="text" id="authCode" placeholder="인증코드입력"
											class="input-form">
									</div>
									<div class="input-location backColor mailBtn">
										<button class="btn3 notsubmit" id="authBtn">인증하기</button>			
									</div>						
								</div>
							</div>
							<span id="timeZone"></span>
							<span id="authMsg"></span>
							<div class="center-move">
								<button type="submit" class="btn2">회원가입</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="/js/signupFrm.js"></script>
</body>
</html>