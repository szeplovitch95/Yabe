<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Yabe - Alert</title>
</head>
<body>
	<%
		ApplicationDAO daoAlert = new ApplicationDAO();
	
		int id = (Integer)session.getAttribute("userID");
		ResultSet rs = daoAlert.getBuyerAuctions(id);
	%>
	<%@include file="navbar.jsp"%>
<div class="container">
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Auction ID</th>
			<th>Item Name</th>
			<th>Start Price</th>
			<th>Current Price</th>
			<th>Closing Date</th>
			<th>Status</th>
			<th>Highest Bid or No?</th>
			<th>View Auction</th>	
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) {
			String itemName1 = daoAlert.getAuctionItemName(rs.getInt("ItemID")); 
			int currentPrice = daoAlert.getMaxBidPrice(rs.getInt("AuctionID"));
			int totalBids = daoAlert.getTotalBids(rs.getInt("AuctionID"));
			int winnerId = daoAlert.getAuctionWinner(currentPrice, rs.getInt("AuctionID"));
			String highestBidder  = "";
			
			if(winnerId == id) {
				highestBidder = "Yes";
			} else {
				highestBidder = "No";
			}

			
		%>
		<tr>
			<td><%=rs.getInt("AuctionID")%></td>
			<td><%=itemName1%></td>
			<td>$<%=rs.getInt("InitialPrice")%></td> 
			<td>$<%=currentPrice%></td>
			<td><%=rs.getDate("CloseDate")%></td>
			<td><%=rs.getString("Status")%></td>
			<td><%=highestBidder %></td>
			<td>
				<a href="singleAuction.jsp?<%=rs.getInt("AuctionID")%>">View</a>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</div>
	<div id="activePage" class="hidden">alert</div>
</body>
</html>