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
	<h1><%=token%></h1>
</body>
<script>
	closeWindow();
	function closeWindow({
		//reserve-> input 값을넣어요 
		self.close();
	})
</script>
</html>
