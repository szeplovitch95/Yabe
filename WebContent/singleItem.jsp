<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		String itemID = request.getQueryString();
		session.setAttribute("itemID", Integer.parseInt(itemID));
		
		ResultSet rsItem = dao.getItem(Integer.parseInt(itemID));
		rsItem.next();
		
	%>
	<div class="container">
		<h2 style="margin-left: 35%;"> 
			<%=rsItem.getString("ItemName")%>
		</h2>
		<div class="row">
			<label class="control-label col-md-2">Item ID:</label>
			<div class="col-md-3">
				<%=rsItem.getInt("itemID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Category</label>
			<div class="col-md-3">
				<%=rsItem.getInt("CategoryID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Item Description</label>
			<div class="col-md-3">
				<%=rsItem.getString("ItemDescription")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Color:</label>
			<div class="col-md-3">
				<%=rsItem.getString("Color")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Quantity On Hand:</label>
			<div class="col-md-3">
				<%=rsItem.getInt("QuantityOnHand")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Weight:</label>
			<div class="col-md-3">
				<%=rsItem.getInt("Weight")%> Pounds
			</div>
		</div>
	</div>
</body>
</html>