<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<div>
	<h2 style="margin-left: 35%;">Auctions:</h2>
</div>
<a href="createNewAuction.jsp">
	<button type="button" class="btn btn-primary">Create Auction</button>
</a>
<%
	ApplicationDAO dao = new ApplicationDAO();
	ResultSet rs = dao.getSellerAuctions((Integer)session.getAttribute("userID"));
	String itemName = "";
%>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Auction ID</th>
			<th>Item Name</th>
			<th>Creation Date</th>
			<th>Start Price</th>
			<th>Current Price</th>
			<th>Total Bids</th>
			<th>Closing Date</th>
			<th>Status</th>
			<th>View Auction</th>	
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) {
			ResultSet rs2 = dao.getAuctionItemName(rs.getInt("ItemID"));
			rs2.next(); 
			int currentPrice = dao.getMaxBidPrice(rs.getInt("AuctionID"));
			int totalBids = dao.getTotalBids(rs.getInt("AuctionID"));
		%>
		<tr>
			<td><%=rs.getInt("AuctionID")%></td>
			<td><%=rs2.getString("ItemName")%></td>
			<td><%=rs.getDate("StartDate")%></td>
			<td>$<%=rs.getInt("InitialPrice")%></td>
			<td>$<%=currentPrice%></td>
			<td><%=totalBids%></td>
			<td><%=rs.getDate("CloseDate")%></td>
			<td><%=rs.getString("Status")%></td>
			<td>
				<a href="singleAuction.jsp?<%=rs.getInt("AuctionID")%>">View</a>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</html>