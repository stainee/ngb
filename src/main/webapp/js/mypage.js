//비밀번호 유효성 검사 
//비밀번호,확인 인풋 받아오기
const memberPw = document.querySelector("#userPw");
const memberPwRe = document.querySelector("#userPwRe");

memberPw.addEventListener("change", function() {
	// pwReg = 정규표현식
	// 대소문자,숫자,특수문자포함 8자 이상
	const inputPw = memberPw.value;
	const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	
	const inputPwRe = memberPwRe.value;
	if (pwReg.test(inputPw)) {
		//정규 표현식 만족시
	} else {
		//정규 표현식 불만족시
		alert("비밀번호 조건이 충족되지 않습니다.\n대소문자,숫자,특수문자포함 8자 이상");
	}
	if(inputPwRe != ""){
        if(inputPw == inputPwRe){
           
        }else{
            alert("비밀번호와 일치하지 않습니다.");
        }
    }else{
	
    }
});


const memberPhone = document.querySelector("#userPhone");

memberPhone.addEventListener("change", function() {
	const inputPhone = memberPhone.value;
	const phoneReg = /^[0-9]{11}$/;
	if (phoneReg.test(inputPhone)) {
	
	} else {
		alert("비밀번호 양식에 맞게 입력해주세요\n01012345678");
	}

});

$(".editAlert").on("click",function(){
	alert("해당 항목 변경은 관리자에게 문의하세요.");
});
