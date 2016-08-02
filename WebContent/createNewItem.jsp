<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*, java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<%@include file="navbar.jsp" %>
  <div>
	<h2 style="margin-left:35%;">Create New Item:</h2>	
  </div>
<form class="form-horizontal" action="insertItem.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Name:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="itemName" placeholder="Item Name" required autofocus/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Category:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
			<%
				ApplicationDAO dao = new ApplicationDAO();
				ResultSet rs = dao.getCategories();
			%>	
				<select class="form-control" id="itemCategory">
				<%
					while(rs.next()) {
				%>
					<option><%= rs.getString("categoryName") %></option>
				<%
					}
				%>
				</select> 
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Description:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<textarea class="form-control" name="itemDescription" required></textarea>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Color:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="color" placeholder="Color" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Quantity On Hand:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="number" name="qtyOnHand" required/>			
			</div>
		</div>
 		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Weight:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="number" name="weight"  placeholder="Item Weight" required/>			
			</div>
		</div>
		<div class="form-group">
		 <div class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
			<button class="btn btn-primary" type="submit">Create Item</button>		
    	</div>		
		</div>
</form>