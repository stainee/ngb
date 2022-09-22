<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="stylesheet" href="/css/main.css">

</head>
<body>
<<<<<<< HEAD

	<h2>Hello NGBs!</h2>
	<a href="reserveManage.do">manage</a>
	<a href="reserveFrm.do">reserve</a>
	<a href="editReserveFrm.do">editReserve</a>
	<a href="findReserveFrm.do">findReserve</a>
	<a href="manageMember.do">memberManage</a>
	<a href="loginFrm.do">회원작업</a>
=======
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="sub-menu">
		<div class="box-wrap">
			<div class="box left">
				<div>
					<a href="#">MYSTERY></a>
				</div>
			</div>
			<div class="box right">
				<div>
					<a href="#">SF></a>
				</div>
			</div>
		</div>
		<br><br><br><br>
		<div class="box-wrap">
			<div class="box left">
				<div>
					<a href="#">IT></a>
				</div>
			</div>
			<div class="box right">
				<div>
					<a href="#">THRILLER></a>
				</div>
			</div>
		</div>
		<div class="title">NA-GA-BA-NG</div>
	</div>
	<div class="middle-wrap">
		<div class="middle-btn-wrap">
			<a href = "#" class = "a-reserve">예약하기</a>
			<a href = "#location" class = "a-location">오시는길</a>
		</div>
		<div>
			<div class="notice-wrap">
				<div class="notie-content">
					 <table class="tbl tbl-hover notice-tbl">
					        <tr class="tr-1">
					            <th style="width:10%;">번호</th>
					            <th style="width:45%;">제목</th>
					            <th style="width:15%;">작성자</th>
					            <th style="width:20%;">작성일</th>
					        </tr>
					        <tr class="tr-3">
					            <td>1</td>
					            <td>
					                <a href="#"><p>공지사항입니다.</p></a>
					            </td>
					            <td>나가방장</td>
					            <td>2022.09.15</td>
					        </tr>
					        <tr class="tr-3">
					            <td>1</td>
					            <td>
					                <a href="#"><p>공지사항입니다.</p></a>
					            </td>
					            <td>나가방장</td>
					            <td>2022.09.15</td>
					        </tr>
					        <tr class="tr-3">
					            <td>1</td>
					            <td>
					                <a href="#"><p>공지사항입니다.</p></a>
					            </td>
					            <td>나가방장</td>
					            <td>2022.09.15</td>
					        </tr>
					        <tr class="tr-3">
					            <td>1</td>
					            <td>
					                <a href="#"><p>공지사항입니다.</p></a>
					            </td>
					            <td>나가방장</td>
					            <td>2022.09.15</td>
					        </tr>
					        <tr class="tr-3">
					            <td>1</td>
					            <td>
					                <a href="#"><p>공지사항입니다.</p></a>
					            </td>
					            <td>나가방장</td>
					            <td>2022.09.15</td>
					        </tr>
					    </table>
	            </div>
			</div>
		</div>
		<div>
			<p>안녕하세요</p>
			<p>나가방 대표 안상영입니다.</p>
			<p></p>
		</div>
	</div>
	<div class = "location" id = "location">
		<a href = "reserveManage.do" style = "color:red">manage</a>
		<a href = "reserveFrm.do" style = "color:blue">reserve</a>
		<a href = "editReserveFrm.do" style = "color:green">editReserve</a>
		<a href = "findReserveFrm.do" style = "color:purple">findReserve</a>
		<a href = "manageMember.do" style = "color:blue">memberManage</a>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
>>>>>>> branch 'master' of https://github.com/stainee/ngb.git
</body>
</html>