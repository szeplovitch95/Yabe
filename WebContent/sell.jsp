<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="navbar.jsp" %>
	<div class="container">
		<h1 style="text-align:center">Sell Items</h1>
	</div>
		<div id="activePage" class="hidden">sell</div>
		
		<a href="createNewAuction.jsp">
			<button type="button" class="btn btn-primary">Create Auction</button>
		</a>

<%@include file="sellerAuctionList.jsp" %>

</body>
</html>