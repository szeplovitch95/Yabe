
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Submit Question With Success</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String question = request.getParameter("question");
		ApplicationDAO dao = new ApplicationDAO();

		if (dao.userLogin(name, password)) {
			int ID = dao.getUserID(name, password);
			out.print("<h1> Success!");
			out.print("need to make function where user can view their questions");
			dao.insertQuestion(ID, question);
		} else {
			out.print("<h1> SORRY INCORRECT USERNAME OR PASSWORD TRY AGAIN");
			out.print("<form id=\"contact_form\" action=\"CJ_PostQuestion.jsp\" method=\"post\" >");
			out.print("	<input id=\"submit_button\" type=\"submit\" value=\"Try Again\" /> </form>");
		}
	%>
</body>
</html>