$(".btn3").on("click",function(event){
	//console.log("예약찾기 버튼 클릭 작동");
	const reserveName = $("[name=reserveName]").val();
	//console.log(reserveName);
	const reserveEmail = $("[name=reserveEmail]").val();
	//console.log(reserveEmail);
	if(reserveName == "" || reserveEmail == ""){
		//alert("전송실패");
		swal({
		title :'예약 찾기 실패',
		text :'성함과 이메일을 모두 입력해주세요',
		icon:'warning'
	   });
	   event.preventDefault();
	}
});
/*
$("[name=reserveEmail]").on("keyup",function(e){
	if(e.keycode == 13){
		$(".btn3").click();
	}
	
});
*/


