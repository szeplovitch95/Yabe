<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Answer Submitted</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
 	String id = request.getParameter("QuestionID");
 	String answer =  request.getParameter("answer");
 	String userID =  request.getParameter("UserID");
 	out.print("answer is  :  " + answer );
 	out.print("question id is : " + id);
 	out.print("user id is : " + userID);
 	
 	ApplicationDAO dao = new ApplicationDAO();
	dao.insertAnswer(userID, id, answer );
 %>


	<form id="answer_form" action="CJ_ViewUnansweredQuestions.jsp"
		method="post">
		<button name="QuestionID" type="submit" id="QuestionID">View
			More Unanswered Questions</button>
	</form>
</body>
</html>