
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SearchResults</title>
</head>
<body>

	<%
		GetItemInfo getinfo = new GetItemInfo();
		//LinkedList<Item> listOfCategories = getinfo.getAllItems();
		String itemid =  request.getParameter("category");
		int id = Integer.parseInt(itemid);
		ApplicationDAO dao1 = new ApplicationDAO();
		ResultSet rs = dao1.getItemsWhereCategory(id); 
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

</body>
</html>