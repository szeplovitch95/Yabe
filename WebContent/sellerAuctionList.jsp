<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/singleAuction.js"></script>
</head>
<div>
	<h2 style="margin-left: 35%;">Auctions:</h2>
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
			<th>View Auction</th>	
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) {
		%>
		
		
		<tr>
			<td><%=rs.getInt("AuctionID")%></td>
			<td><%=rs.getInt("ItemID")%></td>
			<td><%=rs.getDate("StartDate")%></td>
			<td><%=rs.getInt("InitialPrice")%></td>
			<td><%=rs.getInt("Total_Bids")%></td>
			<td><%=rs.getDate("CloseDate")%></td>
			<td><%=rs.getString("Status")%></td>
			<td>
				<form method="post" action="singleAuction.jsp">
				<input type="hidden" name="auctionID" value="<%=rs.getInt("AuctionID")%>">
				<input type="hidden" name="itemID" value="<%=rs.getInt("ItemID")%>">
				<input type="hidden" name="startDate" value="<%=rs.getDate("StartDate")%>">
				<input type="hidden" name="initialPrice" value="<%=rs.getInt("InitialPrice")%>">
				<input type="hidden" name="totalBids" value="<%=rs.getInt("Total_Bids")%>">
				<input type="hidden" name="closeDate" value="<%=rs.getDate("CloseDate")%>">
				<input type="hidden" name="status" value="<%=rs.getString("Status")%>">
				<button type="submit" class="btn btn-primary view-auction">View</button>
				</form>
				</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<div class="auctionInfo">
	<label>Name:</label>
</div>
</html>