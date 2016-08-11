<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Yabe - Search Users Auctions</title>
<script type="text/javascript" src="scripts/searchingUsers.js"></script>
</head>
<body>
	<%
		ApplicationDAO dao123 = new ApplicationDAO();  
		ResultSet listOfBuyers = dao123.getAllBuyers();
		ResultSet listOfSellers = dao123.getAllSellers();
	%>
<%@include file="navbar.jsp"%>

<div class="container">
<h2 style="margin-left: 20%">Search a Specific Buyer or Seller Auctions History</h2>
	<form method="GET" action="getUsersAuctions.jsp" class="form-horizontal">
		<div class="form-group">
			<label class="control-label col-sm-2 col-lg-2 col-md-2">Pick a User Type:</label>
			<div class="col-sm-2 col-md-2 col-lg-2">
				<select class="form-control" name="userType" id="userType">
					<option selected>Buyer</option>
					<option>Seller</option>
				</select>
			</div>
			<div id="buyerDiv">
				<label class="control-label col-sm-2 col-lg-2 col-md-2">Pick a Buyer:</label>
				<div class="col-sm-2 col-md-2 col-lg-2">
					<select class="form-control" name="buyerChosen">
					<% while(listOfBuyers.next()) { %>
						<option><%=listOfBuyers.getString("FullName")%></option>
						<%}%>
					</select>
				</div>
			</div>
			<div id="sellerDiv" class="hidden">
				<label class="control-label col-sm-2 col-lg-2 col-md-2">Pick a Seller:</label>
				<div class="col-sm-2 col-md-2 col-lg-2">
					<select class="form-control" name="sellerChosen">
					<% while(listOfSellers.next()) { %>
						<option><%=listOfSellers.getString("FullName")%></option>
						<%}%>
					</select>
				</div>
			</div>
			<div class="col-sm-2 col-lg-2 col-md-2">
				<button type="submit" class="btn btn-primary">Search</button>
			</div>
		</div>
	</form>
</div>
<div id="activePage" class="hidden">searchUsersAuctions</div>
</body>
</html>