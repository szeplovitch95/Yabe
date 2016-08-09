<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yabe - Buy</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<h1 style="text-align: center">Buy Items</h1>
		
		
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#AvailableAuctions">Available Auctions</a></li>
			<li><a data-toggle="tab" href="#BuyerBids">Your Bids</a></li>
		</ul>
		
		<div class="tab-content">
			<div id="AvailableAuctions" class="tab-pane fade in active">
				<div class="container">
					<%@include file="availableAuctions.jsp"%>				
				</div>
			</div>
			<div id="BuyerBids" class="tab-pane fade">
				<div class="container">
					<%@include file="buyerBids.jsp"%>			
				</div>
			</div>
		</div>
	</div>
	<div id="activePage" class="hidden">buy</div>
</body>
</html>