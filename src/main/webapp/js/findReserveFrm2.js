$(".btn3").on("click",function(event){
	//console.log("예약찾기 버튼 클릭 작동");
	//let reserveNo = parseInt($("[name=reserveNo]").val());
	let reserveNo = $("[name=reserveNo]").val();
	//console.log(reserveName);
	//const reserveEmail = $("[name=reserveEmail]").val();
	let reserveName = $("[name=reserveName]").val();
	//console.log(reserveEmail);
	let noReg = /^[0-9]{0,5}$/;
	let noTest = noReg.test(reserveNo);
	const nameReg=/^[가-힣][a-z][A-Z]{0,20}$/;

	 console.log(reserveNo)	
	 console.log(noTest); // true/false
	 console.log("이름 테스트 : "+nameReg.test(reserveName));
	 
	 if(reserveNo == "" || reserveName == ""){		
				//alert("전송실패");
			swal({
			title :'예약 찾기 실패',
			text :'예약번호와 이름을 모두 입력해주세요',
			icon:'warning'
		   	})
		   	event.preventDefault();	
		}
		if(!noTest){
		//alert("전송실패");
		swal({
		title :'예약 번호 입력 오류',
		text :'예약번호는 숫자만 입력가능합니다.',
		icon:'warning'
	   	})
	   	event.preventDefault();
	   }
	  
	/*
	
	  if(!nameReg.test(reserveName)){
		swal({
		title :'이름 입력오류',
		text :'이름은 한글, 영문 대문자/소문자만 가능합니다.',
		icon:'warning'
	   	})
	   	event.preventDefault();
	   }
	   */
	
	  }); 
	  
	
	   /*
	 
		if(reserveNo == "" || reserveName == ""){		
				//alert("전송실패");
			swal({
			title :'예약 찾기 실패',
			text :'예약번호와 이름을 모두 입력해주세요',
			icon:'warning'
		   	})
		   	event.preventDefault();	
		}else{
				if(!noTest){
		//alert("전송실패");
		swal({
		title :'예약 번호 입력 오류',
		text :'예약번호는 숫자만 입력가능합니다.',
		icon:'warning'
	   	})
	   	event.preventDefault();
	   }
		}
		 });  
		 
		 */
		 
		/*
		else{
			$.ajax({
			url : "/findReserve.do",
			data : {reserveNo:reserveNo , reserveName:reserveName},
			//findReserve 서블렛으로 데이터 넘겨줌
			dataType :"json",
			success : function(data){
				//서블렛에서 객체 타입으로 받아옴(resereNo,reserveName 담겨있음)
			if(data != "") {
                    location.href = "/findReserveFrm.do";
                }else {
                    swal({
                    title :'무통장 가상계좌 정보 메일 전송 실패',
                    text :'관리자에게 문의해주세요',
                    icon:'warning'
                    })
                }			
			}		
			})
		}
		*/
		
	
	   
