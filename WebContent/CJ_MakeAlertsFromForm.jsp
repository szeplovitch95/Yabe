<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Make Alerts From Form</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
		int ID = (Integer)session.getAttribute("userID");
		String AuctionID = request.getParameter("AuctionID");
		out.print("Auction id : " + AuctionID );
		ApplicationDAO dao = new ApplicationDAO();
		if(dao.shouldInsertAlert(ID, AuctionID))
		{ 
			dao.insertAlert(ID, AuctionID);
			out.print("<h2>Alert Submitted</h2>");
		 } 
		else{
			out.print("<h2>Alert Already Submitted</h2>");
		}
		
		
	%>
	
	
		
	<%
		ResultSet rs = dao.getAlertsFromUserID(ID);
	
	%>
	
	
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>Item</th>
				<th>Category</th>
				<th>Description</th>
				<th>Status</th>
				<th>Start Date</th>
				<th>Close Date</th>
				<th>Initial Price</th>
				<th>Closing Price</th>
				<th>Delete Alert</th>
			</tr>
		</thead>
		<tbody>
			<%
    	while(rs.next()) { %>
			<tr>
				<td><%= rs.getString("ItemName") %></td>
				<td><%= rs.getString("CategoryName") %></td>
				<td><%= rs.getString("ItemDescription") %></td>
				<td><%= rs.getString("Status") %></td>
				<td><%= rs.getString("StartDate") %></td>
				<td><%= rs.getString("CloseDate") %></td>
				<td><%= rs.getString("InitialPrice") %></td>
				<td><%= rs.getString("ClosingPrice") %></td>
				<td>
					<form action="CJ_DeleteAlert.jsp" style="margin-left: 7%;">
						<button name="AuctionID" type="submit" id="AuctionID"
							value="<% out.print(AuctionID);%>">Delete</button>
					</form>
				</td>
			</tr>
			<%
		}
  %>
  
		</tbody>
	</table>
	  <form action="CJ_SearchByCategory.jsp" style="margin-left: 7%;">
						<button name="QuestionID" type="submit" id="QuestionID">Create More Alerts</button>
					</form>
</body>
</html>