<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String token = (String)request.getAttribute("token");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=token %></h1>
	<input type="hidden" id="childToken" value="<%=token%>">
</body>
<script>
	closeWindow();
	function closeWindow(){
		//서블릿에서 가져온 토큰값을 부모창의 hidden input에 전달한다
		const token = document.getElementById("childToken").value; 
		window.opener.document.getElementById("token").value = token;
		//window.close();
	}
</script>
</html>
