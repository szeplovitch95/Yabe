<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yabe - Buy</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<h1 style="text-align: center">Buy Items</h1>
		<button id="availableAuctionsButton" class="btn btn-default">Auctions Available</button>
		<button id="buyerBidsButton" class="btn btn-default">Your Bids</button>
		<div id="availableAuctionsDiv">
			<%@include file="availableAuctions.jsp" %>		
		</div>
		<div id="buyerBids" class="hidden">
			<%@include file="buyerBids.jsp"%>
		</div>
	</div>
	<div id="activePage" class="hidden">buy</div>
		<script type="text/javascript" src="scripts/buy.js"></script>
</body>
</html>