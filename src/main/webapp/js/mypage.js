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

function deleteFunc(){
	const userNo = $("#userNo").val();
	if(confirm("정말 탈퇴하시겠습니까?\n확인 시 탈퇴페이지로 이동합니다.")){
		location.href="/deleteUserFrm.do?jhjk="+userNo;
	}else{
		return;
	}
}