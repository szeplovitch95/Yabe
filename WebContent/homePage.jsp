<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<title>Yabe - Home</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/singleAuction.js"></script>
</head>
<%
	String userType = (String)session.getAttribute("userType");

	if(userType.equals("admin")) {
		// add logic
	}
	else if(userType.equals("customerRep")) {
		// add logic 
	}
	else {
		// add logic - buyer or seller is the same thing
	}
%>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<h1 style="text-align: center">Home Page</h1>
	</div>
	<div id="activePage" class="hidden">home</div>
</body>
</html>