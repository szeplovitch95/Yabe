<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Search Results</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
	String search  = request.getParameter("questionQuery");
	ApplicationDAO dao = new ApplicationDAO();
	dao.removeStopWords(search);
	ResultSet rs = dao.SearchFromArrayList();
%>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Question</th>
				<th>Answer</th>
			</tr>
		</thead>
		<tbody>
			<%
    	while(rs.next()) { %>
			<tr>
				<td><%= rs.getString("QuestionDescription") %></td>
				<td><%= rs.getString("Answer") %></td>
			</tr>
			<%
	}
  %>
		</tbody>
	</table>
	<h2>No Luck? ASK US!</h2>
	<form id="contact_form" action="CJ_QuestionSubmitted.jsp" method="post">
		<div class="form-group">
			<label for="name">User name:</label><br /> <input id="name"
				class="form-control" name="name" type="text" size="30" /><br />
		</div>
		<div class="form-group">
			<label for="password">Password:</label><br /> <input id="password"
				class="form-control" name="password" type="password" size="30" /><br />
		</div>
		<div class="form-group">
			<label for="question">Question:</label><br />
			<textarea id="question" class="form-control" name="question" rows="7"
				cols="30"></textarea>
			<br />
		</div>
		<input id="submit_button" type="submit" value="Send Question" />
	</form>
</body>
</html>