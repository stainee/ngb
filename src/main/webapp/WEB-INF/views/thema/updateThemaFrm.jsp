<%@page import="com.ngb.thema.model.vo.Thema"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Thema t = (Thema)request.getAttribute("t");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "/css/notosans.css">
<link rel = "stylesheet" href = "/css/updateThemaFrm.css">


</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>
	
	<div class="content-wrap">
	
    <div class="title-wrap">테마 수정</div>
    
    <div class="table-wrap">
    	<form action="/themaUpdate.do" method="post" enctype="multipart/form-data">
	        <table class="tbl tbl-hover notice-tbl">
	            <tr>
	                <th class="tr-1">테마코드</th>
	                <td>
	                    <%=t.getThemaCode() %>
	                     <input type="hidden" name="thamaCode" class="input-form" value="<%=t.getThemaCode() %>">
	                </td>
	                <th class="tr-1">테마 카테고리</th>
	                <td><input type="text" name="category" class="input-form" value="<%=t.getCategory() %>"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">테마명</th>
	                 <td><input type="text" name="themaName" class="input-form" value="<%=t.getThemaName() %>"></td>
	                 <th class="tr-1">시간제한</th>
	                 <td><input type="text" name="themaTime" class="input-form" value="<%=t.getThemaTime() %>"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">첨부파일</th>
	                <td>
	                <input type="hidden" name="status" value="stay">
	                <%if(t.getThemaFilepath() != null) {%>
                  <%--첨부파일 있을 때--%>
                     <img src="/img/file.png" width="16px" class="delFile">
                     <span class="delFile"><%=t.getThemaFilepath() %></span>
                     <button type="button" class="btn bc1 delFile">삭제</button>
                     <input type="file" name="upfile" style="display:none;" onchange="loadImg(this);" >
                     <input type="hidden" name="oldFilepath" value="<%=t.getThemaFilepath() %>">
                  <%}else{ %>
                  <%--첨부파일 없을 때--%>
                     <input type="file" name="upfile" accept=".jpg,.png,.jpeg" onchange="loadImg(this);">
                  <%} %>
	            </tr>
	            <tr>
	                <th class="tr-1">이미지 미리보기</th>
					<td colspan="3">
						<div id="img-viewer">
							<img id="img-view" width="500px" src="/upload/thema/<%=t.getThemaFilepath() %>">
						</div>
					</td>
	            </tr>
	            <tr>
	                <th class="tr-1">잠금장치</th>
	                <td><input type="text" name="devicePer" class="input-form" value="<%=t.getDevicePer() %>"></td>
	                <th class="tr-1">자물쇠</th>
	                <td><input type="text" name="lockPer" class="input-form" value="<%=t.getLockPer()%>"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">최소인원</th>
	                <td><input type="text" name="peopleMin" class="input-form" value="<%=t.getPeopleMin() %>"></td>
	                <th class="tr-1">최대인원</th>
	                <td><input type="text" name="peopleMax" class="input-form" value="<%=t.getPeopleMax() %>"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">난이도</th>
	                <td><input type="text" name="themaLevel" class="input-form" value="<%=t.getThemaLevel() %>"></td>
	                <th class="tr-1">가격(1인당)</th>
	                <td><input type="text" name="themaPrice" class="input-form" value="<%=t.getThemaPrice() %>"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">설명</th>
	                <td colspan="3"><textarea name="themaContent" class="textarea-form"><%=t.getThemaContent() %></textarea></td>
	            </tr>
	        </table>
	        <button class="update-btn" type="submit">수정완료</button>
        
        </form>
    </div>
    </div>
    
	<script>
		function loadImg(f){
			//첨부파일이 여러개일 수 있으므로 항상 배열 처리
			console.log(f.files);//input에서 file을 선택하면 해당 파일이 들어있는 배열
			if(f.files.length !=0 && f.files[0] != 0){
				const reader = new FileReader(); //파일 정보를 읽어올 수 있는 객체
				reader.readAsDataURL(f.files[0]); //선택한 파일 정보 읽어옴
				//파일리더가 파일을 다 읽어오면 동작할 함수 작성
				reader.onload = function(e){
					$("#img-view").attr("src",e.target.result);
				}
			}else{
				//이미지 교체되면 src 비움
				$("#img-view").attr("src","");
			}
		}
		
		$("button.delFile").on("click",function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val("delete");
			$("#img-view").attr("src","");
		});
		
		
		//----------------------------------------- 정규 표현식 --------------------------------------------------
		
		
		//시간제한 
		$("input[name=themaTime]").on("keyup",function(event){
			
			const themaTime = $("input[name=themaTime]");
			const themaTimeValue = themaTime.val();
			const themaTimeReg =  /^[0-9]+$/;
			if(themaTimeReg.test(themaTimeValue)){
				themaTime.css("outline","none");
				themaTime.css("color","black");
			
			}else{
				themaTime.css("outline","1px solid red");
				themaTime.css("color","red");
				themaTime.val("숫자로 입력해주세요");	
			}
		});
		
		$("input[name=themaTime]").on("click",function(event){
			const themaTime = $("input[name=themaTime]");
			const themaTimeValue = themaTime.val();
			const themaTimeReg =  /^[0-9]+$/;
			if(themaTimeReg.test(themaTimeValue)){
			
			}else{
				themaTime.val("");
				themaTime.css("outline","none");
				themaTime.css("color","black");
				
			}
		});
		
		
		//잠금장치 
		$("input[name=devicePer]").on("keyup",function(event){
			const devicePer = $("input[name=devicePer]");
			const devicePerValue = devicePer.val();
			const devicePerReg =  /^[0-9]+$/;
			if(devicePerReg.test(devicePerValue)){
				devicePer.css("outline","none");
				devicePer.css("color","black");
			}else{
				devicePer.css("outline","1px solid red");
				devicePer.css("color","red");
				devicePer.val("숫자로 입력해주세요");	
			}
		});
	
		$("input[name=devicePer]").on("click",function(event){
			const devicePer = $("input[name=devicePer]");
			const devicePerValue = devicePer.val();
			const devicePerReg =  /^[0-9]+$/;
			if(devicePerReg.test(devicePerValue)){
			
			}else{
				devicePer.val("");
				devicePer.css("outline","none");
				devicePer.css("color","black");
			}
		});
		
		//자물쇠 
		$("input[name=lockPer]").on("keyup",function(event){
			const lockPer = $("input[name=lockPer]");
			const lockPerValue = lockPer.val();
			const lockPerReg =  /^[0-9]+$/;
			if(lockPerReg.test(lockPerValue)){
				lockPer.css("outline","none");
				lockPer.css("color","black");
			}else{
				lockPer.css("outline","1px solid red");
				lockPer.css("color","red");
				lockPer.val("숫자로 입력해주세요");	
			}
		});
		
		$("input[name=lockPer]").on("click",function(event){
			const lockPer = $("input[name=lockPer]");
			const lockPerValue = lockPer.val();
			const lockPerReg =  /^[0-9]+$/;
			if(lockPerReg.test(lockPerValue)){
			
			}else{
				lockPer.val("");
				lockPer.css("outline","none");
				lockPer.css("color","black");
			}
		});
		
		//최소인원 
		$("input[name=peopleMin]").on("keyup",function(event){
			const peopleMin = $("input[name=peopleMin]");
			const peopleMinValue = peopleMin.val();
			const peopleMinReg =  /^[0-9]+$/;
			if(peopleMinReg.test(peopleMinValue)){
				peopleMin.css("outline","none");
				peopleMin.css("color","black");
			}else{
				peopleMin.css("outline","1px solid red");
				peopleMin.css("color","red");
				peopleMin.val("숫자로 입력해주세요");	
			}
		});
		
		$("input[name=peopleMin]").on("click",function(event){
			const peopleMin = $("input[name=peopleMin]");
			const peopleMinValue = peopleMin.val();
			const peopleMinReg =  /^[0-9]+$/;
			if(peopleMinReg.test(peopleMinValue)){
			
			}else{
				peopleMin.val("");
				peopleMin.css("outline","none");
				peopleMin.css("color","black");
			}
		});
		
		//최대인원 
		$("input[name=peopleMax]").on("keyup",function(event){
			const peopleMax = $("input[name=peopleMax]");
			const peopleMaxValue = peopleMax.val();
			const peopleMaxReg =  /^[0-9]+$/;
			if(peopleMaxReg.test(peopleMaxValue)){
				peopleMax.css("outline","none");
				peopleMax.css("color","black");
			}else{
				peopleMax.css("outline","1px solid red");
				peopleMax.css("color","red");
				peopleMax.val("숫자로 입력해주세요");	
			}
		});
		
		$("input[name=peopleMax]").on("click",function(event){
			const peopleMax = $("input[name=peopleMax]");
			const peopleMaxValue = peopleMax.val();
			const peopleMaxReg =  /^[0-9]+$/;
			if(peopleMaxReg.test(peopleMaxValue)){
			
			}else{
				peopleMax.val("");
				peopleMax.css("outline","none");
				peopleMax.css("color","black");
			}
		});
		
		//난이도 
		$("input[name=themaLevel]").on("keyup",function(event){
			const themaLevel = $("input[name=themaLevel]");
			const themaLevelValue = themaLevel.val();
			const themaLevelReg =  /^[1-5]{1}$/;
			if(themaLevelReg.test(themaLevelValue)){
				console.log("사용 가능");
				themaLevel.css("outline","none");
				themaLevel.css("color","black");
			}else{
				console.log("사용 불가");
				themaLevel.css("outline","1px solid red");
				themaLevel.css("color","red");
				themaLevel.val("숫자 1~5 사이 입력해주세요");	
			}
		});
		
		$("input[name=themaLevel]").on("click",function(event){
			const themaLevel = $("input[name=themaLevel]");
			const themaLevelValue = themaLevel.val();
			const themaLevelReg =  /^[0-9]+$/;
			if(themaLevelReg.test(themaLevelValue)){
			
			}else{
				themaLevel.val("");
				themaLevel.css("outline","none");
				themaLevel.css("color","black");
			}
		});
		
		//가격 
		$("input[name=themaPrice]").on("keyup",function(event){
			const themaPrice = $("input[name=themaPrice]");
			const themaPriceValue = themaPrice.val();
			const themaPriceReg =  /^[0-9]+$/;
			if(themaPriceReg.test(themaPriceValue)){
				themaPrice.css("outline","none");
				themaPrice.css("color","black");
			}else{
				themaPrice.css("outline","1px solid red");
				themaPrice.css("color","red");
				themaPrice.val("숫자로 입력해주세요");	
			}
		});
		
		$("input[name=themaPrice]").on("click",function(event){
			const themaPrice = $("input[name=themaPrice]");
			const themaPriceValue = themaPrice.val();
			const themaPriceReg =  /^[0-9]+$/;
			if(themaPriceReg.test(themaPriceValue)){
			
			}else{
				themaPrice.val("");
				themaPrice.css("outline","none");
				themaPrice.css("color","black");
			}
		});
		

		
	</script>
</body>
</html>