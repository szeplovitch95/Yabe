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
<body>
	<%@include file="navbar.jsp"%>
<body>
	<div class="container">
		<div>
			<h2 style="margin-left: 35%;">Create New Bid:</h2>
		</div>
		<form method="post" action="insertBid.jsp">
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-lg-2">Offer
					Price:</label>
				<div class="col-md-5 col-lg-5 col-sm-5">
					<input class="form-control" type="number" name="offerPrice"
						placeholder="Offer Price" required />
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Create Bid</button>
		</form>
	</div>
</body>
</html>