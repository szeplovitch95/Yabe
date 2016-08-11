<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<%
	ApplicationDAO dao2 = new ApplicationDAO();	
	System.out.println((Integer)session.getAttribute("userID"));
	ResultSet rs11 = dao2.getBuyerBids((Integer)session.getAttribute("userID"));
%>
	<h2 style="text-align: center">History of your Bids:</h2>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<th>Bid ID</th>
				<th>Auction ID</th>
				<th>Offer Price</th>
				<th>View Auction</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs11.next()) {
		%>
			<tr>
				<td><%=rs11.getInt("BidID")%></td>
				<td><%=rs11.getInt("AuctionID")%></td>
				<td>$<%=rs11.getInt("OfferPrice")%></td>
				<td><a href="singleAuction.jsp?<%=rs11.getInt("AuctionID")%>">View</a>
				</td>
			</tr>
			<%
			}
		%>
		</tbody>
	</table>
</body>
</html>