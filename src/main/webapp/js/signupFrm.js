
let idx = 0;
let regCheckId = 0;
let regCheckPw = 0;
let regCheckPwRe = 0;
let regCheckPhone = 0;
let regCheckMail = 0;
$(".nextBtn").on("click", function() {
	if (idx == 1) {
		if ($("input:checkbox[name = agreeCheckBox]").is(":checked") == true) {
			for (let i = 0; i < idx; i++) {
				$(".signup-content").eq(i).hide();
			}
			$(".signup-content").eq(idx).show();
		} else {

		}

	} else if (idx == 2) {
		//수정중인 부분
		if (regCheckId == 1 && regCheckPw == 1 && regCheckPwRe == 1 && regCheckPhone == 1 && regCheckMail ==1) {
			for (let i = 0; i < idx; i++) {
				$(".signup-content").eq(i).hide();
			}
			$(".signup-content").eq(idx).show();
		} else {
			event.preventDefault();
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
	} else if (idx == 2) {
		//수정중인 부분
		if (regCheckId == 1 && regCheckPw == 1 && regCheckPwRe == 1 && regCheckPhone == 1 && regCheckMail ==1) {
			idx++;
			for (let i = 0; i < length; i++) {
				$(".tab-menu .tabstep").eq(i).removeClass("tabstep-now");

			}
			for (let k = 0; k < idx; k++) {
				$(".tab-menu .tabstep").eq(k).addClass("tabstep-now");
			}
		} else {
			event.preventDefault();
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

$(".notsubmit").on("click", function(){
	event.preventDefault();
});
$(".nextBtn:eq(0)").click();

// 아이디 중복 검사
//memberId 받아오는것
const memberId = document.querySelector("#memberId");

//memberId.addEventListener("change", function() {
$("[name=memberId]").on("change", function() {
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
					regCheckId = 0;
				} else if (data == "0") {
					idChkMsg.innerText = "사용가능한 아이디 입니다."
					idChkMsg.style.color = "rgb(255,193,7)";
					regCheckId = 1;
				}
			}
		});
	} else {
		//정규 표현식 불만족시
		idChkMsg.innerText = "6자이상 입력해 주세요."
		idChkMsg.style.color = "red";
		regCheckId = 0;
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
	
	const inputPwRe = memberPwRe.value;
	const pwReChkMsg = document.querySelector("#pwReChkMsg");
	if (pwReg.test(inputPw)) {
		//정규 표현식 만족시
		pwChkMsg.innerText = "조건이 일치합니다."
		pwChkMsg.style.color = "rgb(255,193,7)";
		regCheckPw = 1;
	} else {
		//정규 표현식 불만족시
		pwChkMsg.innerText = "조건이 일치하지 않습니다."
		pwChkMsg.style.color = "red";
		regCheckPw = 0;
	}
	if(inputPwRe != ""){
        if(inputPw == inputPwRe){
            //비밀번호,확인 일치시
            pwReChkMsg.innerText = "비밀번호가 일치합니다."
            pwReChkMsg.style.color = "rgb(255,193,7)";
			regCheckPwRe = 1;
        }else{
            pwReChkMsg.innerText = "비밀번호가 일치하지않습니다."
            pwReChkMsg.style.color = "red";
			regCheckPwRe = 0;
        }
    }else{
	
    }
});

memberPwRe.addEventListener("change", function() {
	const inputPw = memberPw.value;
	const inputPwRe = memberPwRe.value;
	const pwReChkMsg = document.querySelector("#pwReChkMsg");
	if (inputPw == inputPwRe) {
		//비밀번호,확인 일치시
		pwReChkMsg.innerText = "비밀번호가 일치합니다."
		pwReChkMsg.style.color = "rgb(255,193,7)";
		regCheckPwRe = 1;
	} else {
		pwReChkMsg.innerText = "비밀번호가 일치하지않습니다."
		pwReChkMsg.style.color = "red";
		regCheckPwRe = 0;
	}
});

const memberPhone = document.querySelector("#memberPhone");

memberPhone.addEventListener("change", function() {
	const inputPhone = memberPhone.value;
	const phoneReg = /^[0-9]{11}$/;
	if (phoneReg.test(inputPhone)) {
		phoneChkMsg.innerText = ""
		regCheckPhone = 1;
	} else {
		phoneChkMsg.innerText = "양식과 일치하지 않습니다."
		phoneChkMsg.style.color = "red";
		regCheckPhone = 0;
	}

});

//인증 메일 관련

let mailCode;
function sendMail() {
	const memberMail = $("#memberMail").val();
	$.ajax({
		url: "/sendMail.do",
		data: { memberMail: memberMail },
		type: "post",
		success: function(data) {
			if (data != null) {
				mailCode = data;
				$("#auth").show();

				//메일이 전송된 시점
				//에서 시간이 흐름
				authTime();
			}
		}
	});
}
//전역변수
let intervalId;
function authTime() {

	$("#timeZone").html("<span id='min'>3</span> : <span id='sec'>00</span>");
	intervalId = window.setInterval(function() {
		timeCount();
	}, 1000);
}

function timeCount() {
	//#min 값그대로 읽어와라
	//min은 숫자로변환
	const min = Number($("#min").text());
	//초는 변환안함
	const sec = $("#sec").text();
	if (sec == "00") {
		if (min == 0) {
			mailCode = null;
			clearInterval(intervalId);
		} else {
			$("#min").text(min - 1);
			$("#sec").text(59);
			
		}
	} else {
		//초를 문자열로 받아와서 계산하기위해 숫자타입으로 변환
		const newSec = Number(sec) - 1;
		if (newSec < 10) {
			//문자형이니까 09초 이런식으로 띄우기위해 숫자타입으로 변환 안하고
			//더해줌
			$("#sec").text("0" + newSec);
		} else {
			$("#sec").text(newSec);
		}
	}
}

$("#authBtn").on("click", function() {
	const inputValue = $("#authCode").val();
	if (mailCode != null) {
		if (inputValue == mailCode) {
			$("#authMsg").text("인증에 성공하셨습니다.");
			$("#authMsg").css("color", "rgb(255,193,7)");
			clearInterval(intervalId);
			$("#timeZone").hide();
			regCheckMail = 1;
		} else {
			$("#authMsg").text("인증번호가 일치하지 않습니다.");
			$("#authMsg").css("color", "red");
			regCheckMail = 0;
		}
	} else {
		$("#authMsg").text("인증시간만료");
		$("#authMsg").css("color", "red");
		regCheckMail = 0;
	}

});
