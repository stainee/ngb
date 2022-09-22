/**
 * 
 */
 /*
 function deleteReserve(){
	const reserveNo = $("[name=reserveNo]").val();
	
	$.ajax({
			url : "/deleteReserve.do",
			data: {reserveNo:reserveNo},
			type : "post"
			});
}
*/
//예약취소버튼
$("#credit").on("click",function(){
	const reserveNo = $("[name=reserveNo]").val();
	//console.log("예약취소 클릭 동작확인");
	//console.log(reserveNo);
	
	$.ajax({
		url : "/deleteReserve2.do",
			data: {reserveNo:reserveNo},
			//키값,밸류값 (서블릿으로 값 넘겨줌)
			type : "post",
			success : function(data){
				//jsp에서 넘겨준 값(result)
			console.log(data);
			if(data>0){
				//alert("취소성공");
				swal({
					title :'취소성공',
					text :'예약이 취소되었습니다.',
					icon:'success'
				}).then(function(){
				location.href = "/";
	         });
			}else{
				alert("취소실패");
				swal({
					title :'취소실패',
					text :'관리자에게 문의해주세요.',
					icon:'error'
			}).then(function(){
				location.href = "/";
	         });
			}
			}
	})
	
});