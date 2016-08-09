<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
		<%@include file="newBid.jsp" %>
<%
	ApplicationDAO dao1 = new ApplicationDAO();
	int id = (Integer)session.getAttribute("auctionID");		
	if (dao1.validateBid(id, Integer.parseInt(request.getParameter("offerPrice")))) {
		Bid bid = new Bid();
		bid.setAuctionID(id);
		bid.setOfferedBy((Integer) session.getAttribute("userID"));
		bid.setOfferPrice(Integer.parseInt(request.getParameter("offerPrice")));
		dao1.insertBid(bid);
		response.sendRedirect("singleAuction.jsp?" + id);
	} 
	else { %>
		<label class="control-label" style="margin-left: 30%; color: Red;">Current Price is Higher than 
		your offer. Please bid a higher price.</label>
<%
	}
%>
<body>
</body>
</html>