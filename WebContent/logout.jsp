<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
	HttpSession session1 = request.getSession();
	session1.invalidate();
%>


	<div class="container">
		<h1 style="text-align:center;">You have successfully logged out! </h1>
		<a href="index.jsp" style="float:right">Click to return to Yabe login page</a>
	</div>
</body>
</html>