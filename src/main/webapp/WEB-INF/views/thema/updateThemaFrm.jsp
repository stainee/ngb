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
<style>
	.tap-wrap{
	    margin-top: 30px;
	    margin-left: 270px;
	    padding: 0;
	}
	
	
	.tab-time{
	    margin-left: 20px;
	}
	
	.btn2{
		width:100px;
		height:50px;
		background-color: rgb(255,193,7);
		box-shadow: 1px 1px 1px 1px black;
		cursor: pointer;
		font-size:20px;
	}
	
	.btn2:active{
		width:100px;
		height:50px;
		background-color: rgb(255,193,7);
		border:1px solid black;
		box-shadow: none;
	}
	.input-form {
	    width: 100%;
	    height: 40px;
	    display: block;
	    background-color: #fff;
	    outline: none;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	.input-form {
	    width: 100%;
	    height: 40px;
	    display: block;
	    background-color: #fff;
	    outline: none;
	    border: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	.input-form:focus {
	    box-shadow: 0 0 0 0.1rem #eee;
	}
	
	.textarea-form {
	    width: 100%;
	    resize: none;
	    min-height: 300px;
	    outline: none;
	    border: 1px solid #ccc;
	}
	
	.tbl .tr-1 {
	    background-color: rgba(57, 62, 70, 0.1);
	}
	
	.table-wrap{
	    margin-top: 20px;
	    margin-left: 250px;
	}
	
	
	.tbl{
	    margin-left: 20px;
	    width: 1200px;
	    border-spacing: 0px;
	    border-collapse: collapse;
	}
	.tbl th,.tbl td {
	    padding: 1rem;
	    text-align: center;
	}
	.tbl td>a {
	    text-decoration: none;
	    color : black;
	}
	
	.notice-tbl a:hover{
	    text-decoration : underline;
	}
	.notice-tbl tr{
	    border-bottom : 1px solid #ccc;
	}
	.notice-tbl tr>td:nth-child(2){
	    text-align : left;
	}
	
	.tbl .tr-1 {
	   background-color: rgba(57, 62, 70, 0.1);
	}
	
	.update-btn{
	    margin-top: 20px;
	    width:100px;
		height:40px;
		background-color: rgb(230,230,230);
		box-shadow: 0px 1px 1px 1px black;
		border-radius: 50px;
		cursor: pointer;
		font-size:20px;
	    margin-left: 1100px;
	}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/managerTemplate.jsp" %>


    <div class="tap-wrap">
        <button class="btn2 tab-thema">테마관리</button>
        <button class="btn2 tab-time">시간관리</button>
    </div>

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
							<img id="img-view" width="500px">
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
		});
		
	</script>
</body>
</html>