<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Make Alerts From Form</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
		int ID = (Integer)session.getAttribute("userID");
		String AuctionID = request.getParameter("AuctionID");
		out.print("value is " + AuctionID);
		
		ApplicationDAO dao = new ApplicationDAO();
		dao.insertAlert(ID, AuctionID);
		
	%>
</body>
</html>