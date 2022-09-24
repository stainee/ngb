<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link rel="stylesheet" href="/css/delUser.css">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
	<h2>회원탈퇴</h2>
	<div class="content-wrap">
		<div class="context-wrap">
		<div class="text-wrap">
			<div class="delNotice">
	
				<p class="delRed">회원탈퇴 시 개인정보 및 NaGaBang에서 만들어진 모든 데이터는 삭제됩니다.<br>
				(단, 아래 항목은 표기된 	법률에 따라 특정기간 동안 보관됩니다.)</p>
				<br><br>				
				1. 계약 또는 청약철회 등에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존기간 : 5년
				<br><br>
				2. 대금결제 및 재화 등의 공급에 관한 기록보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 	/ 보존기간 : 5년
				<br><br>
				3. 전자금융 거래에 관한 기록 보존 이유 : 전자금융거래법 보존 기간 : 5년
				<br><br>
				4. 소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률 / 보존기간 : 3년
				<br><br>
				5. 신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유 : 신용정보의 이용 및 보호에 관한 법률 / 보존기간 : 3년
				<br><br>
				6. 전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제 2016-3호)	(전자세금계산서 사용자에 한함) : 5년
				<br>
				(단, (세금)계산서 내 개인식별번호는 3년 경과 후 파기)
				
				<br><br><br><br>
				<p class="youeui">유의사항</p>
				<p class="youeuii">회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 해당 
				아이디는 영구적으로 삭제되어 	재가입이 불가합니다.</p>
			</div>
		</div>
		<div class="delBtn-wrap">
			<label for="delCheck" class="chkText">
				<input type="checkbox" id="delCheck">
				해당 내용을 모두 확인했으며 회원탈퇴에 동의합니다.
			</label>
			<button onclick="delUser();" type="button" class="realDelBtn btn6">회원탈퇴	</button>
			<input type="hidden" id="delMemNo" value=<%=m.getMemberNo()%>>
			<button onclick="noDelUser();" type="button" class="noDelBtn btn6">취소</button>
		</div>	
		</div>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
<script>
function noDelUser(){
	location.href="/mypageFrm.do";
}

function delUser(){
	const agreeChk = $("#delCheck");
	const userNo = $("#delMemNo").val();
	if (agreeChk.is(":checked")) {
		$.ajax({
			url : "/deleteUser.do",
			type : "get",
			data : {
				userNo:userNo
			},
			success : function(data){
				if(data==1){
					alert("탈퇴가 완료되었습니다.");
					location = "/"				
				}else{
					location = "/mypageFrm.do"	
				}
			},
			error :function(){
				alert("탈퇴에 실패했습니다.\n관리자에게 문의하세요.");
				location = "/mypageFrm.do"
			}
		});
	}else{
		alert("약관에 동의해주세요.");
	}
}

</script>
</body>
</html>