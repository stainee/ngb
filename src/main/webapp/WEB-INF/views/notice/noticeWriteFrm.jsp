<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나가방</title>
<link rel="icon" href="/img/logo2.png">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/css/noticeWriteFrm.css">
	
	<div class="page-content">
		<div class="page-title">
			<h2>NOTICE</h2>
		</div>
		<!-- 첨부파일사용이 가능하게 할시 이 두개는 필수다:  method="post" enctype="multipart/form-data" -->
		<form action="/noticeWrite.do" method="post"
			enctype="multipart/form-data">
			<table class="tbl" id="noticeWrite">
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="noticeTitle"
						class="input-form"></td>
				</tr>

				<tr>
					<th>작성자</th>
					<td><%=m.getMemberId()%> <input type="hidden"
						name="noticeWriter" value="<%=m.getMemberId()%>"></td>
				</tr>

				<tr>
					<td colspan="4" style="text-align: left;"><textarea
							id="noticeContent" name="noticeContent" class="input-form"></textarea>
					</td>
				</tr>

				<tr>
					<td colspan="4">
						<button type="submit">공지사항 작성</button>
					</td>
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
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>