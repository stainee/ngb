let payment ={};
//예약취소버튼
$("#cancle").on("click",function(){
	const reserveNo = $("[name=reserveNo]").val();
	//deleteReserve2.do 호출하면됨 , reserveNo 필요
	paymentInfo(reserveNo);
	
	
});

function paymentInfo(reserveNo){
	$.ajax({
		url:"/getPaymentInfo.do",
		type:"post",
		dataType:"text",
		data : reserveNo,
		success: function(resp){
			
		}
	})
}

function paymentCancle(){
	$.ajax({
		url:"https://kapi.kakao.com/v1/payment/cancel",
        type:"post",
        headers:{"Authorization" : "KakaoAK 4cd7966831fbf5f2f92cde2508a84cac"},
        dataType:"json",
        data:{
            "cid": "TC0ONETIME",
			"tid" : "1",
			"cancle_amount" : "2000",
			"cancle_tax_free_amount" : "0"
        }
	})
}
// url : "/deleteReserve2.do",
// 			data: {reserveNo:reserveNo},
// 			type : "post",
// 			success : function(data){
				
// 			}
// if(data='success'){
// 	swal({
// 		title :'취소성공',
// 		text :'예약이 취소되었습니다.',
// 		icon:'success'
// 	}).then(function(){
// 	location.href = "/";
// });
// }else{//취소하지 못하였으면
// 	//alert("취소실패");
// 	swal({
// 		title :'취소실패',
// 		text :'관리자에게 문의해주세요.',
// 		icon:'error'
// }).then(function(){
// 	location.href = "/";
// 	});
// }
// }