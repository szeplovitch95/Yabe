<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*, java.util.*, java.text.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		String auctionID = request.getQueryString();
		int id = Integer.parseInt(auctionID);
		session.setAttribute("auctionID", Integer.parseInt(auctionID));
		
		String auctionStatus = dao.getAuctionStatus(id);
		
		
		
		ResultSet rs2 = dao.getAuction(Integer.parseInt(auctionID));
		int currentPrice = dao.getMaxBidPrice(Integer.parseInt(auctionID)); 		
		int winnerID = dao.getAuctionWinner(currentPrice, id);
		String winnerName = dao.getFullName(winnerID);
		int totalBids = dao.getTotalBids(Integer.parseInt(auctionID));
		ResultSet rs4 = dao.getAuctionBids(Integer.parseInt(auctionID));
		rs2.next();	
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String sDate= sdf.format(date);
		
		if(sDate.equals(dao.dateToString(rs2.getDate("CloseDate")))) {
			auctionStatus = "Closed";
		}

	%>
	<div class="container">
		<div class="row">
			<a style="float: right;" href="newBid.jsp">
				<%
					if(rs2.getString("Status").equals("Closed") || rs2.getInt("CreatedBy") == (Integer)session.getAttribute("userID")) { %>
						<button type="button" class="btn btn-primary" disabled>New Bid</button> <% 
					} else { %>
						<button type="submit" class="btn btn-primary">New Bid</button> <% 						
					}
				%>
			</a>
		</div>
		<div class="row" style="margin-top:10px;">
			<a style="float:right;" href="manuallyEndAuction.jsp?<%=id%>">
				<button type="button" class="btn btn-primary">End Auction</button>
			</a>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Auction ID:</label>
			<div class="col-md-3">
				<%=rs2.getInt("AuctionID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Item ID:</label>
			<div class="col-md-3">
				<%=rs2.getInt("ItemID") %>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Start Date:</label>
			<div class="col-md-3">
				<%=rs2.getDate("StartDate")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Initial Price:</label>
			<div class="col-md-3">
				$<%=rs2.getInt("InitialPrice")%>
			</div>
		</div>
				<div class="row">
			<label class="control-label col-md-2">Current Price:</label>
			<div class="col-md-3">
				$<%=currentPrice%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Total Bids:</label>
			<div class="col-md-3">
				<%=totalBids%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Close Date:</label>
			<div class="col-md-3">
				<%=rs2.getDate("CloseDate")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Status:</label>
			<div class="col-md-3">
				<%=auctionStatus%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Winner:</label>
			<div class="col-md-3">
				<%=winnerName%>
			</div>
		</div>
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<th>Bid ID</th>
					<th>Offer Price</th>
					<th>Offered By</th>
				</tr>
			</thead>
			<tbody>
				<%
					while (rs4.next()) {
					String fullName = dao.getFullName(rs4.getInt("OfferedBy"));
				%>
				<tr>
					<td><%=rs4.getInt("BidID")%></td>
					<td>$<%=rs4.getInt("OfferPrice")%></td>
					<td><%=fullName%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>