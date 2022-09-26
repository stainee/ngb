<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">
		<div class="title-wrap">
			<h2>로그인</h2>
		</div>
        <div class="content-box">
            <form action="/login.do" method="post">
                <table class="tbl">
                    <tr>
                        <th><label for="loginId">아이디</label></th>
                        <td><input class="input-form" type="text" name="loginId" id="loginId" placeholder="아이디입력"></td>
                    </tr>
                    <tr>
                        <th><label for="loginPw">비밀번호</label></th>
                        <td> <input class="input-form" type="password" name="loginPw" id="loginPw"placeholder="비밀번호입력"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><a href="searchMemberFrm.do">아이디/비밀번호 찾기</a></th>
                    </tr>
                    <tr>
	                  	<th colspan="2">
	                  	</th>
                   	</tr>
                    <tr>
                        <th colspan="2"><button type="submit" class="btn3">로그인</button></th>
                    </tr>
                </table>
            </form>
        </div>
    </div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>