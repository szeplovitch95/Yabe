<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<div>
	<h2 style="margin-left: 35%;">Items:</h2>
</div>
<a href="createNewItem.jsp">
	<button type="button" class="btn btn-primary">Create Item</button>
</a>
<%
	ApplicationDAO dao1 = new ApplicationDAO();
	ResultSet rs2 = dao1.getSellerItems(2, true);
%>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Item ID</th>
			<th>Category</th>
			<th>Name</th>
			<th>Description</th>
			<th>Color</th>
			<th>Quantity on Hand</th>
			<th>Weight</th>
			<th>View Item</th>
		</tr>
	</thead>
	<tbody>
		<%
			while (rs2.next()) {
		%>
		<tr>
			<td><%=rs2.getInt("ItemID")%></td>
			<td><%=rs2.getString("CategoryName")%></td>
			<td><%=rs2.getString("ItemName")%></td>
			<td><%=rs2.getString("ItemDescription")%></td>
			<td><%=rs2.getString("Color")%></td>
			<td><%=rs2.getInt("QuantityOnHand")%></td>
			<td><%=rs2.getString("Weight")%></td>
			<td>
				<form method="post" action="singleItem.jsp">
				<input type="hidden" name="itemID" value="<%=rs2.getInt("ItemID")%>">
				<input type="hidden" name="Category" value="<%=rs2.getString("CategoryName")%>">
				<input type="hidden" name="itemName" value="<%=rs2.getString("ItemName")%>">
				<input type="hidden" name="itemDescription" value="<%=rs2.getString("ItemDescription")%>">
				<input type="hidden" name="itemColor" value="<%=rs2.getString("Color")%>">
				<input type="hidden" name="qtyOnHand" value="<%=rs2.getInt("QuantityOnHand")%>">
				<input type="hidden" name="weight" value="<%=rs2.getString("Weight")%>">
				<button type="submit" class="btn btn-primary">View</button>
				</form>
			</td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</html>



