
let idx = 0;

$(".nextBtn").on("click", function() {
	if (idx == 1) {
		if ($("input:checkbox[name = agreeCheckBox]").is(":checked") == true) {
			for (let i = 0; i < idx; i++) {
				$(".signup-content").eq(i).hide();
			}
			$(".signup-content").eq(idx).show();
		} else {

		}

	} else {
		for (let i = 0; i < idx; i++) {
			$(".signup-content").eq(i).hide();
		}
		$(".signup-content").eq(idx).show();
	}
});

$(".nextBtn").on("click", function() {
	const length = $(".tab-menu .tabstep").length;
	if (idx == 1) {
		if ($("input:checkbox[name = agreeCheckBox]").is(":checked") == true) {
			idx++;
			for (let i = 0; i < length; i++) {
				$(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");
			}
			for (let k = 0; k < idx; k++) {
				$(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
			}
		} else {

		}
	} else {
		idx++;
		for (let i = 0; i < length; i++) {
			$(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");

		}
		for (let k = 0; k < idx; k++) {
			$(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
		}
	}
})

$(".nextBtn:eq(0)").click();

// 아이디 중복 검사
//memberId 받아오는것
const memberId = document.querySelector("#memberId");

//memberId.addEventListener("change", function() {
$("[name=memberId]").on("change",function(){
	// inputId = 입력된 memberId의 값을 저장
	//const inputId = memberId.value;
	const memberId = $(this).val();
	// idReg = 정규표현식
	const idReg = /^[a-zA-Z0-9가-힣]{6,}/;
	// 이부분은 고쳐야함
	// idChkMsg 는 텍스트를 띄어줄 공간.
	const idChkMsg = document.querySelector("#idChkMsg");
	if (idReg.test(memberId)) {
		$.ajax({
			url: "/ajaxCheckId.do",
			type: "get",
			data: { memberId: memberId },
			success: function(data) {
				//정규 표현식 만족시
				if (data == "1") {
					idChkMsg.innerText = "이미 사용중인 아이디 입니다."
					idChkMsg.style.color = "red";

				} else if (data == "0") {
					idChkMsg.innerText = "사용가능한 아이디 입니다."
					idChkMsg.style.color = "blue";
				}
			}
		});
	} else {
		//정규 표현식 불만족시
		idChkMsg.innerText = "6자이상 입력해 주세요."
		idChkMsg.style.color = "red";
	}
});
//비밀번호 유효성 검사 
//비밀번호,확인 인풋 받아오기
const memberPw = document.querySelector("#memberPw");
const memberPwRe = document.querySelector("#memberPwRe");

memberPw.addEventListener("change", function() {
	// pwReg = 정규표현식
	// 대소문자,숫자,특수문자포함 8자 이상
	const inputPw = memberPw.value;
	const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	const pwChkMsg = document.querySelector("#pwChkMsg");
	if (pwReg.test(inputPw)) {
		//정규 표현식 만족시
		pwChkMsg.innerText = "조건이 일치합니다."
		pwChkMsg.style.color = "blue";
	} else {
		//정규 표현식 불만족시
		pwChkMsg.innerText = "조건이 일치하지 않습니다."
		pwChkMsg.style.color = "red";
	}
});

memberPwRe.addEventListener("change", function() {
	const inputPw = memberPw.value;
	const inputPwRe = memberPwRe.value;
	const pwReChkMsg = document.querySelector("#pwReChkMsg");
	if (inputPw == inputPwRe) {
		//비밀번호,확인 일치시
		pwReChkMsg.innerText = "비밀번호가 일치합니다."
		pwReChkMsg.style.color = "blue";
	} else {
		pwReChkMsg.innerText = "비밀번호가 일치하지않습니다."
		pwReChkMsg.style.color = "red";
	}
});

const memberPhone = document.querySelector("#memberPhone");

memberPhone.addEventListener("change", function() {
	const inputPhone = memberPhone.value;
	const phoneReg = /^[0-9]{9}$/;
	if (phoneReg.test(inputPhone)) {
		phoneChkMsg.innerText = ""
	} else {
		phoneChkMsg.innerText = "양식과 일치하지 않습니다."
		phoneChkMsg.style.color = "red";
	}

});