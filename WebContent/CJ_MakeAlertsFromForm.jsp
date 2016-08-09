<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Make Alerts From Form</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
		String AuctionID = request.getParameter("AuctionID");
		out.print("value is " + AuctionID);
	%>
</body>
</html>