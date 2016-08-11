<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8"
	import="com.cs336.pkg.*, java.util.*, java.text.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		String auctionID = request.getQueryString();
		int id = Integer.parseInt(auctionID);
		dao.updateAuctionStatus(id);

		response.sendRedirect("singleAuction.jsp?" + id + "");
	%>
</body>
</html>