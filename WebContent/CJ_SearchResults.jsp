<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"
	import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SearchResults</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		String category =  request.getParameter("category");
		String color = request.getParameter("color");
		String status = request.getParameter("status");
		String priceMin = request.getParameter("price-min");
		String priceMax = request.getParameter("price-max");
		String weightMin = request.getParameter("weight-min");
		String weightMax = request.getParameter("weight-max");
		String bidMin = request.getParameter("bid-min");
		String bidMax = request.getParameter("bid-max");
		String sortBy = request.getParameter("sort-by");
		String orderBy = request.getParameter("order-by"); 
		String minDate = request.getParameter("minDate");
		String maxDate = request.getParameter("maxDate");
		
	/*	out.print(" cat id ." + category + 
				  ". color ." + color + 
				  ". status ." + status + 
				  ". princeMin ." + priceMin +
				  ". PriceMax ." + priceMax +
				  ". WeightMin ." + weightMin + 
				  ". WeightMax ." + weightMax + 
				  ". Sortby." + sortBy + 
				  ". orderby." + orderBy); */

		ApplicationDAO dao = new ApplicationDAO();
		ResultSet rs = dao.SearchResults(category, color, status, priceMin, priceMax, weightMin, weightMax, bidMin, bidMax, sortBy, orderBy, minDate, maxDate);
%>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Item Name</th>
				<th>Category Name</th>
				<th>Color</th>
				<th>Weight</th>
				<th>Status</th>
				<th>InitialPrice</th>
				<th>Closing Price (0 is still Open)</th>
				<th>Make Alert</th>
			</tr>
		</thead>
		<tbody>
			<%
    		while(rs.next()) {
    			System.out.println(rs.getString("ItemName"));
    		%>
			<tr>
				<td><%= rs.getString("ItemName") %></td>
				<td><%= rs.getString("CategoryName") %></td>
				<td><%= rs.getString("Color") %></td>
				<td><%= rs.getInt("Weight") %></td>
				<td><%= rs.getString("Status") %></td>
				<td><%= rs.getInt("InitialPrice") %></td>
				<td><%= rs.getInt("ClosingPrice") %></td>
				<td>
					<form action="CJ_MakeAlertsFromForm.jsp" style="margin-left: 7%;">
						<button name="AuctionID" type="submit" id="AuctionID"
							value="<% out.print(rs.getInt("AuctionID"));%>">Create
							Alert</button>
					</form>
				</td>
			</tr>
			<%
	}
  %>
		</tbody>
	</table>
</body>
</html>