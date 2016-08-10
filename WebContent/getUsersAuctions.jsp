<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
	ApplicationDAO dao = new ApplicationDAO();
	String userType = request.getParameter("userType");
	System.out.println(userType);
	String userFullName = "";
	if(userType.equals("Buyer")) {
		userFullName = request.getParameter("buyerChosen");
	}
	else {
		userFullName = request.getParameter("sellerChosen");
	}
	
	String name = userFullName.substring(0, userFullName.lastIndexOf(' '));
	int userID = dao.getEndUserIDWithFirstName(name);
	ResultSet rs; 
	
	if(userType.equals("Buyer")) {
		rs = dao.getBuyerAuctions(userID);		
	}
	else {
		rs = dao.getSellerAuctions(userID);
	}
	
	
%>

<%@include file="searchUsersAuctions.jsp"%>
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
		</tr>
		<%
			}
		%>
	</tbody>
</table>



</body>
</html>