<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>YABE Questions</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		ResultSet rsAllQuestions = dao.GRgetAllQuestions("all");
		ResultSet rsAnswered = dao.GRgetAllQuestions("answered");
		ResultSet rsUnAnswered = dao.GRgetAllQuestions("unanswered");
	%>
	<div class="container">
		<h2>YABE Questions</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#AllQuestions">All
					Questions</a></li>
			<li><a data-toggle="tab" href="#Answered">Answered Questions</a></li>
			<li><a data-toggle="tab" href="#UnAnswered">UnAnswered
					Questions</a></li>
		</ul>
		<div class="tab-content">
			<div id="AllQuestions" class="tab-pane fade in active">
				<h3>All Questions</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Question Number</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Question</th>
							</tr>
						</thead>
						<tbody>
							<%
								while (rsAllQuestions.next()) {
							%>
							<tr>
								<td><%=rsAllQuestions.getInt("Question_Number")%></td>
								<td><%=rsAllQuestions.getString("FirstName")%></td>
								<td><%=rsAllQuestions.getString("LastName")%></td>
								<td><%=rsAllQuestions.getString("QuestionDescription")%>
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<div id="Answered" class="tab-pane fade">
				<h3>Answered Questions</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Question Number</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Question</th>
								<th>Answer</th>
							</tr>
						</thead>
						<tbody>
							<%
								while (rsAnswered.next()) {
							%>
							<tr>
								<td><%=rsAnswered.getInt("Question_Number")%></td>
								<td><%=rsAnswered.getString("FirstName")%></td>
								<td><%=rsAnswered.getString("LastName")%></td>
								<td><%=rsAnswered.getString("QuestionDescription")%></td>
								<td><%=rsAnswered.getString("Answer")%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
			<div id="UnAnswered" class="tab-pane fade">
				<h3>UnAnswered Questions</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Question Number</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Question</th>
							</tr>
						</thead>
						<tbody>
							<%
								while (rsUnAnswered.next()) {
							%>
							<tr>
								<td><%=rsUnAnswered.getInt("Question_Number")%></td>
								<td><%=rsUnAnswered.getString("FirstName")%></td>
								<td><%=rsUnAnswered.getString("LastName")%></td>
								<td><%=rsUnAnswered.getString("QuestionDescription")%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="activePage" class="hidden">question</div>
	</div>
</body>
</html>
