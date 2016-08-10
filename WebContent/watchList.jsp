<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Yabe - Watch List</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<h1 style="text-align: center;">Watch List</h1>
	</div>
	<div id="activePage" class="hidden">watchList</div>
	
	
	<%int ID = (Integer) session.getAttribute("userID");
		ApplicationDAO dao = new ApplicationDAO();
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
							value="<% out.print(rs.getInt("AuctionID"));%>">Delete</button>
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