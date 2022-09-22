
	
	function sendReserveMail(){
		const reserveMail = $("[name=reserveMail]").val();
		const reserveName = $("[name=reserveName]").val();
		const reservePhone = $("[name=reservePhone]").val();
		
		//console.log(reserveMail);
		//console.log(reserveName);
		//console.log(reservePhone);
		//console.log("무통장입금 클릭동작!");
		if(reserveMail != "" && reserveName != "" && reservePhone != "" ){
			$.ajax({
				url : "/sendReserveMail2.do",
				data : {reserveMail:reserveMail},
				type : "post",
				success : function(data){
									//ㄴ서블릿에서 보내준 데이터가 들어감(reserveMail)
					if(data != "") {
						swal({
						title :'메일 전송 성공',
						text :'메일 전송에 성공했습니다.',
						icon:'success'
						})
					}else {
						swal({
						title :'메일 전송 실패',
						text :'관리자에게 문의해주세요',
						icon:'warning'
	
						})
					}
				}
				});
			}else{
				swal({
						title :'메일 전송 실패',
						text :'성함,전화번호,메일주소를 모두 입력해주세요',
						icon:'warning'
	
						})
			}
			}
				
		
		/*		
		function sendReserveMail(){
		const reserveMail = $("[name=reserveMail]").val();
		
		console.log(reserveMail);
		//console.log("무통장입금 클릭동작!");
		$.ajax({
			url : "/sendReserveMail2.do",
			data : {reserveMail:reserveMail},
			type : "post",
			success : function(data){
								//ㄴ서블릿에서 보내준 데이터가 들어감(reserveMail)
						console.log(data);
						if(data == "") {
							//alert("전송실패");
							swal({
							title :'메일 전송 실패',
							text :'메일주소를 입력하주세요',
							icon:'warning'
							});
						}else{
							//alert("전송성공");
							swal({
							title :'메일 전송 성공',
							text :'메일 전송에 성공했습니다.',
							icon:'success'
							});
						}
					}
			
		}).then(function(){

		});
	}
	
	/*
		
		
		/*
		$("#account").on("click",function sendReserveMail(){
			const reserveMail = $("[name=reserveMail]").val();
			const reserveName = $("[name=reserveName]").val();
			const reservePhone = $("[name=reservePhone]").val();
			console.log(reserveMail);
			console.log(reserveName);
			console.log(reservePhone);
		    console.log("무통장입금 클릭동작!");
		if(reserveMail != "" && reserveName != "" && reservePhone != "" ){
			$.ajax({
				url : "/sendReserveMail2.do",
				data : {reserveMail:reserveMail},
				type : "post".
				swal({
						title :'메일 전송 성공',
						text :'메일 전송에 성공했습니다.',
						icon:'success'
					})
			});
		}else{
			swal({
				title :'메일 전송 실패',
				text :'메일주소와 입금자명을 모두 입력해주세요',
				icon:'warning'
	
				});
		}
		
		*/
		
		/*
		$.ajax({
			url : "/sendReserveMail2.do",
			data : {reserveMail:reserveMail},
			type : "post",
			success : function(data){
								//ㄴ서블릿에서 보내준 데이터가 들어감(reserveMail)
						//console.log(data);
						const reserveName = $("[name=reserveName]").val();
						console.log(reserveName);
						if(data != "" && reserveName != "" ) {
							//alert("전송성공");
							swal({
							title :'메일 전송 성공',
							text :'메일 전송에 성공했습니다.',
							icon:'success'
							});
						}else{
							//alert("전송실패");
							swal({
							title :'메일 전송 실패',
							text :'메일주소와 입금자명을 모두 입력해주세요',
							icon:'warning'
	
							});
						}
					}
			
		}).then(function(){

		});
	}
	
	*/
	/*
	
	$("#account").on("click",function(event){
		const reserveMail = $("[name=reserveMail]").val();
		const reserveName= $("[name=reserveName]").val();
			if(reserveMail == "" || reserveName=="" ){
				event.preventDefault();
			}
		 
		});
		
	*/