<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Search Questions</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<h1>Search Currently Asked Questions!</h1>
	<form id="contact_form" action="CJ_SearchThroughAnsweredQuestions.jsp"
		method="post">
		<div class="form-group">
			<label for="question">Put In Search Query:</label><br />
			<textarea id="questionQuery" class="form-control"
				name="questionQuery" rows="7" cols="30"></textarea>
			<br />
		</div>
		<input id="submit_button" type="submit" value="Search Questions" />
	</form>
</body>
</html>