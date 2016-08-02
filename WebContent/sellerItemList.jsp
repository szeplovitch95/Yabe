<%@page import="java.sql.ResultSet"%>
<%@ page language="java" 
    pageEncoding="UTF-8" import="com.cs336.pkg.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>


	
  <div>
	<h2 style="margin-left:35%;">Items:</h2>	
  </div>
  
	<a href="createNewItem.jsp">
			<button type="button" class="btn btn-primary">Create Item</button>
	</a>
	
<% 
	ApplicationDAO dao = new ApplicationDAO();
	ResultSet rs = dao.getSellerItems(1);
	 
%>
<table class="table table-bordered">
    <thead>
      <tr>
        <th>Item ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Color</th>
        <th>Quantity on Hand</th>
        <th>Weight</th>
      </tr>
    </thead>
    <tbody>
    <% while(rs.next()) { %>
    <tr>
		<td>
			<%= rs.getInt("ItemID") %>
		</td>
		<td>
			<%= rs.getString("ItemName") %>
		</td>
		<td>
			<%= rs.getString("ItemDescription") %>
		</td>
		<td>
			<%= rs.getString("Color") %>
		</td>
		<td>
		<%= rs.getInt("QuantityOnHand") %>
		</td>
		<td>
			<%= rs.getString("Weight") %>
		</td>
	</tr>
	<%
	}
  %>
    </tbody>
  </table>
  
	
	

