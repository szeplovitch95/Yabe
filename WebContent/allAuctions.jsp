<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<%@include file="navbar.jsp"%>

<div>
	<h2 style="margin-left:5%;">Auctions:</h2>
</div>

<%
	ApplicationDAO dao = new ApplicationDAO(); 
	ResultSet rs = dao.GRgetAll("auctions");
	String itemName = "";
	
	String userType = (String)request.getSession().getAttribute("userType"); 
	int questionColSpan = 1;
	boolean buttons = false;
	if (userType.equals("CustomerRep")){
		buttons = true;
		questionColSpan = 2;	
	}
	
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
			
			<%if(buttons){%>
				<th>Delete Auction</th>
			
			<%} %>
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) {
			String itemName1 = dao.getAuctionItemName(rs.getInt("ItemID")); 
			int currentPrice = dao.getMaxBidPrice(rs.getInt("AuctionID"));
			int totalBids = dao.getTotalBids(rs.getInt("AuctionID"));
		%>
		<tr>
			<td><%=rs.getInt("AuctionID")%></td>
			<td><%=itemName1%></td>
			<td><%=rs.getDate("StartDate")%></td>
			<td>$<%=rs.getInt("InitialPrice")%></td> 
			<td>$<%=currentPrice%></td>
			<td><%=totalBids%></td>
			<td><%=rs.getDate("CloseDate")%></td>
			<td><%=rs.getString("Status")%></td>
			<td>
				<a href="singleAuction.jsp?<%=rs.getInt("AuctionID")%>">View</a>
			</td>
			
			<%if(buttons){%>
				<td>
					<form name="auctionDelete"  method="POST"  action="deleteAuction.jsp">
						<input type="hidden" name="auctionNumberDelete" value="<%=rs.getInt("AuctionID")%>"/>
						<button class="btn btn-primary" type="submit" >Delete</button>
					</form>
				</td>

			<%} %>
			
			
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</html>