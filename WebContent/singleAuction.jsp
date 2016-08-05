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
		
	%>
	<div class="container">
		<h2 style="margin-left: 35%;"><%=itemName %></h2>
	
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