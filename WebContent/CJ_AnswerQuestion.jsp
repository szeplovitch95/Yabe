<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Insert title here</title>
</head>
<body>

	<%
		String QuestionID = request.getParameter("QuestionID");
		//out.print("question ID is " + QuestionID);

		ApplicationDAO dao = new ApplicationDAO();
		String question = dao.getQuestionFromQuestionID(QuestionID);
		int userID = dao.getUserIDFromQuestionID(QuestionID);
		out.print(question);
	%>


	<form id="answer_form" action="CJ_AnswerSubmitted.jsp" method="post">

		<div class="form-group">
			<label for="question">Type Answer Here:</label><br />
			<textarea id="question" class="form-control" name="answer" rows="7"
				cols="30"></textarea>
			<br />
		</div>

		<div class="form-group">
			<input type="hidden" id="QuestionID" class="form-control"
				name="QuestionID" value="<%out.print(QuestionID);%>">
		</div>

		<div class="form-group">
			<input type="hidden" id="UserID" class="form-control" name="UserID"
				value="<%out.print(userID);%>">
		</div>

		<input id="submit_button" type="submit" value="Send Answer" />
	</form>

</body>
</html>