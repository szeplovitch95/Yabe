<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Yabe - Sell</title>
</head>
<body>
	<%
		ApplicationDAO sellDAO = new ApplicationDAO();
		boolean isNewSeller = sellDAO.sellerExists((Integer)session.getAttribute("userID"));
	%>
	<%@include file="navbar.jsp"%>
	<div class="container">
		<%
			if (!isNewSeller) {
		%>
		<%@include file="newSeller.jsp"%>
		<%
			} else {
		%>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#AuctionList">Auctions</a></li>
			<li><a data-toggle="tab" href="#ItemList">Items</a></li>
		</ul>
		<div class="tab-content">
			<div id="AuctionList" class="tab-pane fade in active">
				<div class="container"> 
					<%@include file="sellerAuctionList.jsp"%>				 
				</div>
			</div>
			<div id="ItemList" class="tab-pane fade">
				<div class="container">
					<%@include file="sellerItemList.jsp"%>				
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<div id="activePage" class="hidden">sell</div>
</body>
</html>