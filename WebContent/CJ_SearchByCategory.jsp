<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SelectDropDownByCategory</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<form class="form-horizontal" action="CJ_SearchResults.jsp"
		method="post" style="margin-left: 7%;">
		
		
		<p>Choose Category:</p>
		
		
		<div class="form-group">
			<%
				ApplicationDAO dao = new ApplicationDAO();
				ResultSet rs = dao.getCategoryAndID();
				while (rs.next()) {
					int categoryID = rs.getInt("CategoryID");
					String categoryname = rs.getString("CategoryName");					
					out.print(" <input type=\"radio\" name=\"category\" value=\"" + categoryID + "\" checked/> "
						+ categoryname );
				}
				out.print(
						"<input type=\"radio\" name=\"category\" value=\"" + "" + "\" checked/>" + "Any Category" + "</br>");
			%>
		</div>
		
		
		
		<p>Choose Color</p>
			
		<div class="form-group">
			<%
			rs = dao.getItemsColor();
			while (rs.next()) {
				String color = rs.getString("Color");
				out.print("<input type=\"radio\" name=\"color\" value=\"" + color + "\" checked/>" + color);//+ "</br>");
			}
			out.print(
					"<input type=\"radio\" name=\"color\" value=\"" + "" + "\" checked/>" + "Any Color" + "</br>");
			%>
		</div>
		
		
		<p>Choose Status:</p>
		
		<div class="form-group">
		
			<%
			rs = dao.getDistinctStatus();
			while (rs.next()) {
				
				String status =  rs.getString("Status");
				//out.print("<option value=\"" + status + "\">" + status + "</option>");
				out.print("<input type=\"radio\" name=\"status\" value=\"" + status + "\" checked/>" + status );//+ "</br>");
						
			}
			out.print( "<input type=\"radio\" name=\"status\" value=\"" + "" + "\" checked/>" + "Any Status" + "</br>");
			//out.print("<option value=\"" + ""+ "\">" + "Any Status "+ "</option>");
			rs = dao.getMaxWeight();
			int i = 0;
			int maxweight = 100;
			while(rs.next()){
				if(i == 0)
					{ 
						maxweight =  rs.getInt("Weight");
					}
				i++;
			}
			
			rs = dao.getMaxPrice();
			int maxprice = 100;
			i = 0;
			while(rs.next()){
				if(i == 0)
				{ 
					maxprice=  rs.getInt("InitialPrice");
				}
				i++;
			}
			%>
		</div>
		
		
		
		<p>Price Range</p>
		
		<div data-role="main" class="form-group">
			<div data-role="rangeslider">
				<label for="price-min">Price:</label> <input type="range"
					name="price-min" id="price-min"
					value="<%out.print(maxprice*.10);%>" min="0"
					max="<%out.print(maxprice);%>"> <label for="price-max">Price:</label>
				<input type="range" name="price-max" id="price-max"
					value="<%out.print(maxprice*.90);%>" min="0"
					max="<%out.print(maxprice);%>">
			</div>
		</div>
		
		
		
		<p>Weight Range</p>
		
		<div data-role="main" class="form-group">
			<div data-role="rangeslider">
				<label for="weight-min">Price:</label> <input type="range"
					name="weight-min" id="weight-min"
					value="<%out.print(maxweight*.10);%>" min="0"
					max="<%out.print(maxweight);%>"> <label for="weight-max">Price:</label>
				<input type="range" name="weight-max" id="weight-max"
					value="<%out.print(maxweight*.90);%>" min="0"
					max="<%out.print(maxweight);%>">
			</div>
			
			
			<div class="form-group">
					<label class="col-sm-2 col-md-2 col-lg-2 control-label"
						for="sort-by">Sort By :</label>
					<div class="col-md-3 col-lg-3 col-sm-3">
						<select class="form-control" name="sort-by">
							<option value="">No Sorting</option>
							<option value=" order by A.InitialPrice ">InitialPrice</option>
							<option value=" order by I.ItemName ">Item Name</option>
							<option value=" order by A.ClosingPrice ">Closing Price</option>
							<option value=" order by A.Status ">Status</option>
							<option value=" order by I.Color ">Color</option>
							<option value=" order by C.CategoryName ">Color</option>
						</select>
					</div>
				</div>
				
				<label class="col-sm-2 col-md-2 col-lg-2 control-label"
						for="order-by">Order By :</label>
					<div class="col-md-3 col-lg-3 col-sm-3">
						<select class="form-control" name="order-by">
							<option value=" asc ">Ascending</option>
							<option value=" desc ">Descending</option>
						</select>
					</div>
					
			<div class="form-group">
				<button class="btn btn-primary" type="submit">Search Items</button>
				
				
				
	</form>
</body>
</html>