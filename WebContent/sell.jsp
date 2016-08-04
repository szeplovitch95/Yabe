<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Yabe - Sell</title>
</head>
<body>
	<%
		ApplicationDAO sellDAO = new ApplicationDAO();
		HttpSession sessionSeller = request.getSession();
		String username = (String) sessionSeller.getAttribute("username");
		int id = sellDAO.getEndUserID(username);
		boolean isNewSeller = sellDAO.sellerExists(id);
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
		<button id="auctionButton" class="btn btn-default">Auctions</button>
		<button id="itemButton" class="btn btn-default">Items</button>
		<div id="auctionDiv">
			<%@include file="sellerAuctionList.jsp"%>
		</div>
		<div id="itemDiv" class="hidden">
			<%@include file="sellerItemList.jsp"%>
		</div>
		<%
			}
		%>
	</div>
	<div id="activePage" class="hidden">sell</div>
	<script type="text/javascript" src="scripts/sell.js"></script>
</body>
</html>


