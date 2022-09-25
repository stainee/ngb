payment={};
//예약취소버튼
$("#cancle").on("click",function(){
	const reserveNo = $("[name=reserveNo]").val();
	paymentInfo(reserveNo);

	
});

//예약번호로 결제정보 조회
function paymentInfo(reserveNo){
	$.ajax({
		url:"/getPaymentInfo.do",
		type:"post",
		dataType:"json",
		data : {reserveNo:reserveNo},
		success: function(resp){
			//가격과 tid 정보 조회 결과
			payment.reserveNo = reserveNo;
			payment.price = resp.price;
			payment.tid = resp.tid;
			if(payment.tid ==null){ //무통장결제
				deleteReserve(reserveNo);
			}else{
				paymentCancle(reserveNo);
			}
		}
	})
}

//결제 취소 API 요청
function paymentCancle(reserveNo){
	$.ajax({
		url:"https://kapi.kakao.com/v1/payment/cancel",
        type:"post",
        headers:{"Authorization" : "KakaoAK 4cd7966831fbf5f2f92cde2508a84cac"},
        dataType:"json",
        data:{
            "cid": "TC0ONETIME",
			"tid" : payment.tid,
			"cancel_amount" : payment.price,
			"cancel_tax_free_amount" : 0,
        },
		success:function(){
			deleteReserve(reserveNo);
		},
		error:function(resp){
			console.log(resp);
			swal({
				title :"결제취소실패",
				text :"관리자에게 문의해주세요",
				icon:"error"
			}).then(function(){
				location.href = "/";
			});
		}
	})
}

//결제 내역 삭제. 정책상 쓰지 않을수도 있다 
function deletePayment(reserveNo){
	$.ajax({
		url:"/deletePayment.do",
        type:"post",
        data:{reserveNo:reserveNo},
        success: function(result){
			if(result>0){
				deleteReserve(reserveNo);
			}
		}
	})
}
//예약 취소
function deleteReserve(){
	const reserveNo = $("[name=reserveNo]").val();
	$.ajax({
		url:"/deleteReserve2.do",
        type:"post",
        data:{reserveNo:reserveNo},
        success: function(){
			swal({
				title :"예약취소성공",
				text :"예약이 취소되었습니다",
				icon:"success"
			}).then(function(){
			//location.href = "/";
			}
			)
		},
		error : function(){
			swal({
				title :"예약취소실패",
				text :"관리자에게 문의해주세요",
				icon:"error"
			}).then(function(){
				//location.href = "/";
			});
		}
	})
}