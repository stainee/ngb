/**
 * 
 */
let regCheckMail = 0;

$(".searchId").on("click", function() {
	$(".first-content").removeClass("show-hide");
	$(".second-content").addClass("show-hide");
	$(".searchId").css("background-color", "white").css("color","rgb(50,50,50");
	$(".searchPw").css("background-color", "rgb(50,50,50)").css("color", "white");
});

$(".searchPw").on("click", function() {
	$(".second-content").removeClass("show-hide");
	$(".first-content").addClass("show-hide");
	$(".searchPw").css("background-color", "white").css("color", "black").css("font-weight", "700")
	$(".searchId").css("background-color", "rgb(50,50,50)").css("color","white");
});

$(".searchId").click();
//모달-----------------------------------
const searchId = document.querySelector("#searchId");
const searchName = document.querySelector("#searchName");
const searchMail = document.querySelector("input[name=searchMail]");
$(".first-content>.center-move>.search-content>.btn2").on("click", function() {
	const inputSearchName = searchName.value;
	const inputSearchMail = searchMail.value;
	if(inputSearchName !="" && inputSearchMail !=""){
		$(".modal-wrap").css("display", "flex");	
	}
});


$(".second-content>.center-move>.search-content>.btn2").on("click", function() {
	const inputSearchId = searchId.value;
	if (regCheckMail == 1 && inputSearchId !="") {
		$(".modal-wrap").css("display", "flex");
	} else {

	}
});


$("#close").on("click", function() {
	$(".modal-wrap").css("display", "none");
	$(".result-id").empty();
})
//모달-----------------------------------
$(".first-btn").on("click", function() {
	const memberName = $("#searchName").val();
	const memberMail = $("#searchMail1").val();

	const result = $(".result");
	result.empty();
	$.ajax({
		url: "/searchMemberId.do",
		type: "post",
		//타입 생략시 get
		data: {
			memberName: memberName,
			memberMail: memberMail
		},
		dataType: "json",
		success: function(data) {
			//console.log(data);
			if (data == null) {
				result.append("회원정보를 조회할 수 없습니다.")
			} else {
				result.append("아이디 :" + data.memberId);
			}
		},
		error: function() {
			console.log("서버호출실패");
		}
	});
});

$(".second-btn").on("click", function() {
	const memberId = $("#searchId").val();
	const memberMail = $("#searchMail2").val();
	const result = $(".result");
	result.empty();
	$.ajax({
		url: "/searchMemberPw.do",
		type: "post",
		//타입 생략시 get
		data: {
			memberId: memberId,
			memberMail: memberMail
		},
		dataType: "json",
		success: function(data) {
			//console.log(data);
			if (data == null) {
				result.append("회원정보를 조회할 수 없습니다.")
			} else {
				result.append("비밀번호 :" + data.memberPw);
			}
		},
		error: function() {
			console.log("서버호출실패");
		}
	});
});


//인증 메일 관련
const auth = $(".search-content>#auth");
let mailCode;
function sendMail() {
	const memberMail = $("#searchMail2").val();
	$("#timeZone").show();
	$("#authMsg").hide();
	$.ajax({
		url: "/sendMail.do",
		data: { memberMail: memberMail },
		type: "post",
		success: function(data) {
			if (data != null) {
				mailCode = data;
				//메일이 전송된 시점
				//에서 시간이 흐름
				auth.css("display","flex");
				$(".modal-wrap").css("display", "none");
				$(".search-content:last-child").css("margin-top","21px");
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
	}, 100);
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
	$("#authMsg").show();
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
		$("#timeZone").hide();
		$("#authMsg").text("인증시간만료");
		$("#authMsg").css("color", "red");
		regCheckMail = 0;
	}
});