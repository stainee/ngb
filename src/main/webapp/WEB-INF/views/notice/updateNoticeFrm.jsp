<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ngb.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
<link rel="stylesheet" href="/css/noticeUpdateFrm.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	
	<div class="page-content">
		<div class="page-title">
		<h2>NOTICE</h2>
		</div>
		<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo() %>">
					<input type="text" name="noticeTitle" class="input-form" value="<%=n.getNoticeTitle()%>">
				</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>
			<tr>
				
				<td colspan="4" style="text-align: left;">
					<textarea name="noticeContent" id="noticeContent"><%=n.getNoticeContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="4">
					<button type="submit">수정완료</button>
				</th>
			</tr>
		</table>
		</form>
	</div>
	<script>
		$("#noticeContent").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this);
				}
			}
		});
		function uploadImage(file, editor) {
			const form = new FormData();
			form.append("file", file);
			$.ajax({
				url : "/uploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data) {
					$(editor).summernote("insertImage", data);
				}
			});
		}
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>