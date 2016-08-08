<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>View Unanswered Questions</title>
</head>
<body>


	<%

		ApplicationDAO dao = new ApplicationDAO();
		ResultSet rs = dao.getUnansweredQuestions();;
		 if(dao.getCountOfUnansweredQuestions()==0){
		    	out.print("NO Unanswered Questions!");
		    }
		    else{
%>

<table class="table table-bordered">
    <thead>
      <tr>
        <th>Question</th>
         <th>Answer Question</th>
        
      </tr>
    </thead>
 
    <tbody>
    <%
   
    	while(rs.next()) { %>
    <tr>
		<td>
			<%= rs.getString("QuestionDescription") %>
		</td>
		<td>
		<form action="CJ_AnswerQuestion.jsp" style="margin-left: 7%;">
		<button name="QuestionID" type="submit" id="QuestionID" value= "<% out.print(rs.getInt("ID"));%>" >Answer This Question</button>
		</form>
		</td>
	</tr>
	
	<%
	}
    }
  %>
    </tbody>
  </table>
  

</body>
</html>