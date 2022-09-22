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
	
	.update-btn>button{
	    margin-top: 20px;
	    width:80px;
		height:40px;
		background-color: rgb(230,230,230);
		box-shadow: 0px 1px 1px 1px black;
		border-radius: 50px;
		cursor: pointer;
		font-size:20px;
	    margin-left: 1000px;
	    text-decoration: none;
	    color : black;
	}
	
	.delete-btn{
	    margin-top: 20px;
	    width:80px;
		height:40px;
		background-color: rgb(230,230,230);
		box-shadow: 0px 1px 1px 1px black;
		border-radius: 50px;
		cursor: pointer;
		font-size:20px;
	    margin-left: 15px;
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
        <table class="tbl tbl-hover notice-tbl">
            <tr>
                <th class="tr-1">테마코드</th>
                <td>
    				<%=t.getThemaCode() %>
                </td>
                <th class="tr-1">테마</th>
                <td>
					<%=t.getCategory() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">이미지 미리보기</th>
					<td>
						<img src="/upload/thema/<%=t.getThemaFilepath() %>">
					</td>
            </tr>
            <tr>
	            <th class="tr-1">테마명</th>
	            <td>
	                 <%=t.getThemaName() %>
	            </td>
	            <th class="tr-1">시간제한</th>
	            <td>
	                 <%=t.getThemaTime() %>
	            </td>
	         </tr>
            <tr>
                <th class="tr-1">잠금장치</th>
                <td>
					<%=t.getDevicePer() %>
                </td>
                <th class="tr-1">자물쇠</th>
                <td>
					<%=t.getLockPer()%>
                </td>
            </tr>
            <tr>
                <th class="tr-1">최소인원</th>
                <td>
					<%=t.getPeopleMin() %>
                </td>
                <th class="tr-1">최대인원</th>
                <td>
					<%=t.getPeopleMax() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">난이도</th>
                <td>
					<%=t.getThemaLevel() %>
                </td>
                <th class="tr-1">가격(1인당)</th>
                <td>
					<%=t.getThemaPrice() %>
                </td>
            </tr>
            <tr>
                <th class="tr-1">설명</th>
                <td colspan="3">
                    <%=t.getThemaContentBr() %>
                </td>
            </tr>
        </table>
        
        <button class="delete-btn" onclick="noticeDelete('<%=t.getThemaCode() %>');">삭제</button>
        <a class="update-btn" href="/updateThemaForm.do?themaCode=<%=t.getThemaCode()%>"><button>수정</button></a>
    </div>
    
    <script>

		
		function noticeDelete(themaCode){
			console.log(themaCode);
			if(confirm("테마를 삭제하시겠습니까?")){
				location.href="/deleteThema.do?themaCode="+themaCode;
			}
		}
		
		
	</script>
</body>

</html>