<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<script src="/summernote/summernote-lite.js"></script>
	<script src="/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/summernote/summernote-lite.css">
	<div class="page-content">
		<div class="page-title">공지사항 작성(에디터사용)</div>
		<!-- 첨부파일사용이 가능하게 할시 이 두개는 필수다:  method="post" enctype="multipart/form-data" -->
		<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
			<table class="tbl" id="noticeWrite">
				<tr class="tr-1">
					<th class="td-3">제목</th>
					<td colspan="3">
						<input type="text" name="noticeTitle" class="input-form">
					</td>
				</tr>
				
				<tr class="tr-1">
					<th class="td-3">작성자</th>
					<td>
						<%=m.getMemberId() %>
						<input type="hidden" name="noticeWriter" value="<%=m.getMemberId() %>">
					</td>
					
					<th class="td-3">첨부파일</th>
					<td><input type="file" name="upfile"></td>
				</tr>
				
				<tr class="tr-1">
					<td colspan="4" style="text-align:left;">
						<textarea id="noticeContent" name="noticeContent" class="input-form"></textarea>					
					</td>
				</tr>
				
				<tr class="tr-1">
					<td colspan="4">
						<button type="submit" class="btn bc1 bs4">공지사항 작성</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>