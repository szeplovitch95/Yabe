<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<%
	ApplicationDAO dao2 = new ApplicationDAO();
	ResultSet rs1 = dao2.getBuyerBids((Integer)session.getAttribute("userID"));
%>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Bid ID</th>
			<th>Auction ID</th>
			<th>Offer Price</th>
			<th>Offered By</th>
			<th>View Auction</th>	
		</tr>
	</thead>
	<tbody>
		<%
			while (rs1.next()) {
		%>
		<tr>
			<td><%=rs1.getInt("BidID")%></td>
			<td><%=rs1.getInt("AuctionID")%></td>
			<td><%=rs1.getInt("OfferPrice")%></td>
			<td><%=rs1.getInt("OfferedBy")%></td>
			<td>
				<button type="button" class="btn btn-primary view-auction">View</button>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</body>
</html>