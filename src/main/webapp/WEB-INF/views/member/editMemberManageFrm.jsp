<%@page import="java.util.ArrayList"%>
<%@page import="com.ngb.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Member m = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script type="text/javascript">

function updateMember(){
	const memberNo = $("#memberNo").val();
	const memberName = $("#memberName").val();
	const memberId = $("#memberId").val();
	const memberPw = $("#memberPw").val();
	const memberPhone = $("#memberPhone").val();
	const memberMail = $("#memberMail").val();
	const memberLevel = $("#memberLevel").val();
	$.ajax({
		url : "/updateMember.do",
		type : "get",
		data : {
			memberNo:memberNo,
			memberName:memberName,
			memberId:memberId,
			memberPw:memberPw,
			memberPhone:memberPhone,
			memberMail:memberMail,
			memberLevel:memberLevel
		},
		success : function(data){
			if(data==1){
				alert("수정이 완료되었습니다.");
				location = "/manageMember.do"				
			}else{
				alert("수정 중 오류가 발생하였습니다\n아이디중복 등을 확인하세요.");
				location = "/manageMember.do"
			}
		},
		error :function(){
			alert("수정 중 오류가 발생하였습니다.(error)");
			location = "/manageMember.do"
		}
	});
}

function deleteMember(){
	const memberNo = $("#memberNo").val();
	const memberName = $("#memberName").val();
	const memberId = $("#memberId").val();
	const memberMail = $("#memberMail").val();
	
	if(confirm("정말로 탙퇴하시겠습니까?")){
		$.ajax({
			url : "/deleteMember.do",
			type : "get",
			data:{
				memberNo:memberNo,
				memberName:memberName,
				memberId:memberId,
				memberMail:memberMail
			},
			success : function(data){
				if(data==1){
					alert("탈퇴가 완료되었습니다.");
					location = "/manageMember.do"
				}else{
					alert("탈퇴 중 오류가 발생하였습니다.");
					location = "/"
				}
			},
			error : function(){
				alert("탈퇴 중 오류가 발생하였습니다.(error)");
				location = "/"
			}	
		})
	}else{
		
	}
	
}
</script>
</head>
<link rel="stylesheet" href="/css/memberManage.css">
<body>
	<%@include file ="/WEB-INF/views/common/managerTemplate.jsp" %>
	<div class="content-wrap">
	    
			<table class="tbl1 manageMemTbl">
		        <tr>
		        	<th>회원번호</th>
		        	<th>이름</th>
		            <th>아이디</th>
		            <th>비밀번호</th>
		            <th>전화번호</th>
		            <th>이메일</th>
		            <th>등급</th>
		            <th>가입일</th>	
		        </tr>
		        <tr>
		        	<td class="readonlyTd">
		        		<input type = "text" id="memberNo" name = "memberNo" value = <%=m.getMemberNo()%> style="background-color:#dcdcdc" readonly>
		        	</td>
		        	<td>
		        		<input type = "text" id="memberName" name = "memberName" value = <%=m.getMemberName()%>>
		        	</td>
		        	<td>
		        		<input type = "text" id="memberId" name = "memberId" value = <%=m.getMemberId()%>>
		        	</td>
		        	<td>
		        		<input type = "text" id="memberPw" name = "memberPw" value = <%=m.getMemberPw()%>>
		        	</td>
		        	<td>
		        		<input type = "text" id="memberPhone" name = "memberPhone" value = <%=m.getMemberPhone()%>>
		        	</td>
		        	<td>
		        		<input type = "text" id="memberMail" name = "memberMail" value = <%=m.getMemberMail()%>>
		        	</td>
		        	<td>
		        		<select id="memberLevel" name="memberLevel">
		        		<%if(m.getMemberLevel()==1) {%>
			        		<option value =1>일반회원</option>
			        		<option value =0>관리자</option>
		        		<%}else {%>
			        		<option value =0>관리자</option>
			        		<option value =1>일반회원</option>
		        		<%} %>
		        		</select>
		        	</td>
		        	<td>
		        		<input type = "date" name = "enrollDate" value = <%=m.getEnrollDate()%> style="background-color:#dcdcdc" disabled>
		        	</td>
		        </tr>
		        <tr id="manageBtnWrap">
		        	<td colspan="4" style="border-right:none; border-bottom: none;">
						<button onclick="updateMember()"
								style="width:100px;
								height:50px;
								background-color: #fff;
								box-shadow: 1px 1px gray;
								cursor: pointer;
								font-size:20px;">수정완료</button>    	
		        	</td>
		        	<td colspan="4" style="border-left:none; border-bottom: none;">
							<button onclick="deleteMember()" id="delMemBtn" style="width:100px;
								height:50px;
								background-color: #fff;
								box-shadow: 1px 1px gray;
								cursor: pointer;
								font-size:20px;">회원탈퇴</button>   	
		        	</td>
				</tr>
			</table>
		
	</div>
</body>
</html>