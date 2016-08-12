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
		
		String userType = (String)request.getSession().getAttribute("userType"); 
		int questionColSpan = 1;
		boolean buttons = false;
		if (userType.equals("CustomerRep")){
			buttons = true;
			questionColSpan = 2;	
		}
		
	%>
	<div class="container">
		<h2>YABE Questions</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#AllQuestions">All
					Questions</a></li>
			<li><a data-toggle="tab" href="#Answered">Answered Questions</a></li>
			<li><a data-toggle="tab" href="#UnAnswered">UnAnswered
					Questions</a></li>
			<li><a data-toggle="tab" href="#AskQuestion">Post a Question</a></li>
			<li><a data-toggle="tab" href="#SearchQuestions">Search Questions</a></li>
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
								<th colspan="2">Question</th>
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
								
								<%if(buttons){ %>
								
								<td>
									<form name="questionDelete"  method="POST"  action="deleteQuestion.jsp">
										<input type="hidden" name="questionNumberDelete" value="<%=rsAllQuestions.getInt("Question_Number")%>"/>
										<button class="btn btn-primary" type="submit" >Delete</button>
									</form>
								</td>
								
								
								<%} %>
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
								<th colspan="2">Answer</th>
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
								
								<%if(buttons){ 
								
									int questionNum = rsAnswered.getInt("Question_Number");
								%>
								
								<td>
									<form name="answerDelete"  method="POST"  action="deleteAnswer.jsp">
										<input type="hidden" name="questionAnswerDelete" value="<%=questionNum%>"/>
										<button class="btn btn-primary" type="submit" >Delete</button>
									</form>
									
									
									
									<form name="editAnswer"  method="POST"  action="editAnswer.jsp">
										<input type="hidden" name="questionAnswerEdit" value="<%=questionNum%>"/>
										<button class="btn btn-primary" type="submit" >Edit</button>
									</form>
									
									
									
								</td>
								
								
								<%} %>
								
								
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
								<th colspan="2">Question</th>
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



								<% if (buttons){ %>
								
								<script type="text/javascript">
									function showBox(questionNumber){			
										document.getElementById("answerBox"+questionNumber).setAttribute('style', 'visibility:visible;margin-bottom:10px !important;');
									}
								</script>
								<td>
									<% int value = rsUnAnswered.getInt("Question_Number");  %>
									<button class="btn btn-primary" onClick="showBox(<%= value %>);" >Answer</button>
								</td>

								<tr id="answerBox<%= value %>" style="visibility:hidden; margin-bottom:10px !important;">
									<td colspan='5'>
										<form type="hidden" name="answerQuestion<%= value %>"  method="POST"  action="answerQuestion.jsp">
											<input type="hidden" name="questionNumber" value="<%= value %>"/>
											<div class="input-group">
										      <input name="questionSubmit" maxlength="149" type="text" class="form-control" placeholder="Answer Question <%= value %>" />
										      <span class="input-group-btn">
										        <button class="btn btn-secondary" type="submit" >Submit Answer</button>
										      </span>
										    </div>
										</form>
									</td>
								</tr>
							
							<% } %>
						</tr>
						<%
						}
					  %>
				    </tbody>
				</table>

				</div>
			</div>
			
			<div id="AskQuestion" class="tab-pane fade">
  				<h3>Ask a Question About Yabe</h3>
					<div class="container">
					
						<form name="askQuestion"  method="POST"  action="CJ_QuestionSubmitted.jsp">
							<div class="input-group">
						      <input name="question" maxlength="149" type="text" class="form-control" placeholder="Write your Question Here" />
						      <span class="input-group-btn">
						        <button class="btn btn-secondary" type="submit" >Submit Question</button>
						      </span>
						    </div>
						</form>
	
						
					</div>
			</div>
					
			
			<div id="SearchQuestions" class="tab-pane fade">
  				<h3>Search Questions</h3>
					<div class="container">
					
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
					</div>
			</div>
			
		</div>
		
	</div>
</body>
</html>
