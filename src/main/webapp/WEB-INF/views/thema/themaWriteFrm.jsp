<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.reserve-btn{
	    margin-top: 20px;
	    width:80px;
		height:40px;
		background-color: rgb(230,230,230);
		box-shadow: 0px 1px 1px 1px black;
		border-radius: 50px;
		cursor: pointer;
		font-size:20px;
	    margin-left: 1150px;
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
    	<form action="/themaWrite.do" method="post" enctype="multipart/form-data">
	        <table class="tbl tbl-hover notice-tbl">
	            <tr>
	                <th class="tr-1">테마코드</th>
	                <td>
	                    <input type="text" name="themaCode" class="input-form">
	                </td>
	                <th class="tr-1">테마</th>
	                <td><input type="text" name="category" class="input-form"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">첨부파일</th>
	                <td><input type="file" name="themaFilepath"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">이미지 미리보기</th>
	                <td></td>
	            </tr>
	            <tr>
	                <th class="tr-1">잠금장치</th>
	                <td><input type="text" name="devicePer" class="input-form"></td>
	                <th class="tr-1">자물쇠</th>
	                <td><input type="text" name="lockPer" class="input-form"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">최소인원</th>
	                <td><input type="text" name="peopleMin" class="input-form"></td>
	                <th class="tr-1">최대인원</th>
	                <td><input type="text" name="peopleMax" class="input-form"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">난이도</th>
	                <td><input type="text" name="themaLevel" class="input-form"></td>
	                <th class="tr-1">가격(1인당)</th>
	                <td><input type="text" name="themaPrice" class="input-form"></td>
	            </tr>
	            <tr>
	                <th class="tr-1">설명</th>
	                <td colspan="3"><input type="text" name="themaContent" class="textarea-form"></td>
	            </tr>
	        </table>
	        <button class="reserve-btn" type="submit">등록</button>
        
        </form>
    </div>
	
</body>
</html>