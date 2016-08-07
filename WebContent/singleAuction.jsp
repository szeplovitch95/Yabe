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
		int id = Integer.parseInt(request.getParameter("itemID"));
		
		ResultSet rs = dao.getAuctionItemName(id);
		
		rs.next();
		String itemName = rs.getString("ItemName");
		String aid = request.getParameter("auctionID");
		System.out.println(aid);
		
	%>
	<div class="container">
	  <div class="row">
	  	<h2 class="col-sm-offset-4 col-md-offset-4 col-lg-offset-4 col-sm-6 col-md-6 col-lg-6"><%=itemName %></h2>
	  	<form action="newBid.jsp" method="post">
			<button type="submit" class="btn btn-primary">New Bid</button>
			<input type="hidden" name="auctionId" value="<%=aid%>" />	  		
	  	</form>
	  </div>
		<div class="row">
			<label class="control-label col-md-2">Auction ID:</label>
			<div class="col-md-3">
				<%=request.getParameter("auctionID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Item ID:</label>
			<div class="col-md-3">
				<%=request.getParameter("itemID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Start Date:</label>
			<div class="col-md-3">
				<%=request.getParameter("startDate")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Initial Price:</label>
			<div class="col-md-3">
				<%=request.getParameter("initialPrice")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Total Bids:</label>
			<div class="col-md-3">
				<%=request.getParameter("totalBids")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Close Date:</label>
			<div class="col-md-3">
				<%=request.getParameter("closeDate")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Status:</label>
			<div class="col-md-3">
				<%=request.getParameter("status")%>
			</div>
		</div>
	</div>
</body>
</html>