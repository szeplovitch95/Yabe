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
	%>
	<div class="container">
		<h2 style="margin-left: 35%;"> 
			<%=request.getParameter("itemName")%>
		</h2>
		<div class="row">
			<label class="control-label col-md-2">Item ID:</label>
			<div class="col-md-3">
				<%=request.getParameter("itemID")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Category</label>
			<div class="col-md-3">
				<%=request.getParameter("Category")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Item Description</label>
			<div class="col-md-3">
				<%=request.getParameter("itemDescription")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Color:</label>
			<div class="col-md-3">
				<%=request.getParameter("itemColor")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Quantity On Hand:</label>
			<div class="col-md-3">
				<%=request.getParameter("qtyOnHand")%>
			</div>
		</div>
		<div class="row">
			<label class="control-label col-md-2">Weight:</label>
			<div class="col-md-3">
				<%=request.getParameter("weight")%>
			</div>
		</div>
	</div>
</body>
</html>