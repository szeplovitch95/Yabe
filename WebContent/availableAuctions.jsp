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
<body>

<%
	ApplicationDAO dao = new ApplicationDAO();
	ResultSet rs = dao.getAllAuctions();
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
				<button type="button" class="btn btn-primary view-auction">View</button>
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
</body>
</html>