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
	<%@include file="navbar.jsp"%>
	<%	
		ApplicationDAO dao = new ApplicationDAO();
		String auctionID = request.getQueryString();
		int id = Integer.parseInt(auctionID);
		ResultSet rs = dao.getAuctionItemName(id);
		rs.next();
		String title = rs.getString("ItemName");
		
		
		session.setAttribute("auctionID", Integer.parseInt(auctionID));
	
		ResultSet rs2 = dao.getAuction(Integer.parseInt(auctionID));
		ResultSet rs4 = dao.getAuctionBids(Integer.parseInt(auctionID));
		rs2.next();
	%>
	<div class="container">
	  <div class="row">
	 	<h2 style="margin-left:35%;"><%=title %></h2>
	  	<a style="float:right;" href="newBid.jsp">
			<button type="submit" class="btn btn-primary">New Bid</button>  		
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
				<%=rs2.getInt("ItemID")%>
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
				<%=rs2.getInt("InitialPrice")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Total Bids:</label>
			<div class="col-md-3">
				<%=rs2.getInt("Total_Bids")%>
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
				<%=rs2.getString("Status")%>
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
		%>
		<tr>
			<td><%=rs4.getInt("BidID")%></td>
			<td><%=rs4.getInt("OfferPrice")%></td>
			<td><%=rs4.getInt("OfferedBy")%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
	</div>
</body>
</html>