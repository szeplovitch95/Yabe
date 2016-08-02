<%@page import="java.sql.ResultSet"%>
<%@ page language="java" 
    pageEncoding="UTF-8" import="com.cs336.pkg.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
  <div>
	<h2 style="margin-left:35%;">Auctions:</h2>	
  </div>
	<a href="createNewAuction.jsp">
			<button type="button" class="btn btn-primary">Create Auction</button>
	</a>
<% 
	ApplicationDAO dao = new ApplicationDAO();
	ResultSet rs = dao.getSellerAuctions(1);
%>
<table class="table table-bordered table-hover">
    <thead>
      <tr>
        <th>Auction ID</th>
        <th>Item Name</th>
        <th>Creation Date</th>
        <th>Start Price</th>
        <th>Total Bids</th>
        <th>Closing Date</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
    <% while(rs.next()) { %>
    <tr>
		<td>
			<%= rs.getInt("AuctionID") %>
		</td>
		<td>
			<%= rs.getDate("StartDate") %>
		</td>
		<td>
			<%= rs.getInt("InitialPrice") %>
		</td>
		<td>
			<%= rs.getInt("ItemID") %>
		</td>
		<td>
		<%= rs.getInt("Total_Bids") %>
		</td>
		<td>
			<%= rs.getDate("CloseDate") %>
		</td>
		<td>
			<%= rs.getString("Status") %>
		</td>
	</tr>
	<%
	}
  %>
    </tbody>
</table>