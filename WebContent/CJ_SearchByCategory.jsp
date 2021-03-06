<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title></title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<form class="form-horizontal" action="CJ_SearchResults.jsp"
		method="post" style="margin-left: 7%;">
		<fieldset>
			<legend>Search by Category, Color, and Status</legend>
			<div class="form-group">
				<%
					ApplicationDAO dao = new ApplicationDAO();
					ResultSet rs = dao.getCategoryAndID();
				%>
				<label class="control-label col-sm-2 col-md-2 col-lg-2">Category:</label>
				<div class="col-md-2 col-lg-2 col-sm-2">
					<select class="form-control" style="width: 80%" name="category">
						<option value="">Any Category</option>
						</option>
						<%
							while (rs.next()) {
								int categoryID = rs.getInt("CategoryID");
								String categoryname = rs.getString("CategoryName");
						%>
						<option value="<%out.print(categoryID);%>">

							<%=categoryname%>
						</option>
						<%
							}
						%>
					</select>
				</div>
				<%
					//out.print("<input type=\"radio\" name=\"category\" value=\"" + "" + "\" checked/>" + "Any Category" + "</br>");
				%>
				<%
					rs = dao.getItemsColor();
				%>
				<label class="control-label col-sm-2 col-md-2 col-lg-2">Color:</label>
				<div class="col-md-2 col-lg-2 col-sm-2">
					<select class="form-control" style="width: 80%" name="color">
						<option value="">Any Color</option>
						<%
							while (rs.next()) {
								String color = rs.getString("Color");
						%>
						<option value="<%out.print(color);%>">
							<%=color%>
						</option>
						<%
							}
						%>
					</select>
				</div>

				<%
					//	out.print("<input type=\"radio\" name=\"color\" value=\"" + "" + "\" checked/>" + "Any Color" + "</br>");
				%>
				<%
					rs = dao.getDistinctStatus();
				%>
				<label class="control-label col-sm-2 col-md-2 col-lg-2">Status:</label>
				<div class="col-md-2 col-lg-2 col-sm-2">
					<select class="form-control" style="width: 80%" name="status">
						<option value="">Any Status</option>
						<%
							while (rs.next()) {
								String status = rs.getString("Status");
						%>
						<option value="<%out.print(status);%>">
							<%=status%>
						</option>
						<%
							}
						%>
					</select>
				</div>
				<%
					// out.print( "<input type=\"radio\" name=\"status\" value=\"" + "" + "\" checked/>" + "Any Status" + "</br>");
					//out.print("<option value=\"" + ""+ "\">" + "Any Status "+ "</option>");
				%>
			</div>
		</fieldset>

		<%
			rs = dao.getMaxWeight();
			int i = 0;
			int maxweight = 100;
			while (rs.next()) {
				if (i == 0) {
					maxweight = rs.getInt("Weight");
				}
				i++;
			}

			rs = dao.getMaxPrice();
			int maxprice = 100;
			i = 0;
			while (rs.next()) {
				if (i == 0) {
					maxprice = rs.getInt("InitialPrice");
				}
				i++;
			}

			int maxBid = dao.CJgetMaxBid();

			String minDate = dao.CJgetMinDate();

			String maxDate = dao.CJgetMaxDate();
		%>
		<fieldset>
			<legend>Search by Prices & Weight</legend>
			<div class="form-group">
				<label for="price-min"
					class="control-label col-sm-2 col-md-2 col-lg-2">Initial
					Price:</label>
				<div class="col-lg-5 col-md-5 col-sm-5">
					<input type="number" name="price-min"
						class="col-sm-2 col-lg-2 col-md-2 form-control" style="width: 20%"
						min="0" value="0" /> <span class="col-sm-1 col-lg-1 col-md-1">
						to </span> <input type="number" name="price-max"
						class="col-sm-2 col-lg-2 col-md-2 form-control" style="width: 20%"
						min="0" max="<%out.print(maxprice);%>"
						value="<%out.print(maxprice);%>" />
				</div>
			</div>
			<div class="form-group">
				<label for="weight-min"
					class="control-label col-sm-2 col-md-2 col-lg-2">Weight:</label>
				<div class="col-lg-5 col-md-5 col-sm-5">
					<input type="number" name="weight-min"
						class="col-sm-2 col-lg-2 col-md-2 form-control" style="width: 20%"
						value="0" min="0" /> <span class="col-sm-1 col-lg-1 col-md-1">
						to </span> <input type="number" name="weight-max"
						class="col-sm-2 col-lg-2 col-md-2 form-control" style="width: 20%"
						min="0" max="<%out.print(maxweight);%>"
						value="<%out.print(maxweight);%>" />
				</div>
			</div>
			<div class="form-group">
				<label for="bid-min"
					class="control-label col-sm-2 col-md-2 col-lg-2">Current
					Bid Price:</label>
				<div class="col-lg-5 col-md-5 col-sm-5">
					<input type="number" name="bid-min"
						class="col-sm-2 col-lg-2 col-md-2 form-control" style="width: 20%"
						value="0" min="0" /> <span class="col-sm-1 col-lg-1 col-md-1">
						to </span> <input type="number" name="bid-max"
						class="col-sm-3 col-lg-3 col-md-3 form-control" style="width: 20%"
						min="0" max="<%out.print(maxBid);%>"
						value="<%out.print(maxBid);%>" />
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>Date Range</legend>
			<div class="form-group">
				<label for="bid-min"
					class="control-label col-sm-2 col-md-2 col-lg-2">Minimum
					Start Date :</label>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<input type="date" name="minDate" class="form-control"
						value="<%out.print(minDate);%>" min="<%out.print(minDate);%>"
						max="<%out.print(maxDate);%>" />
				</div>
				<label for="bid-min"
					class="control-label col-sm-2 col-md-2 col-lg-2">Maximum
					Start Date :</label>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<input type="date" name="maxDate" class="form-control"
						value="<%out.print(maxDate);%>" min="<%out.print(minDate);%>"
						max="<%out.print(maxDate);%>" />
				</div>
			</div>
		</fieldset>

		<fieldset>
			<legend>Sort By & Order By</legend>
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
				<label class="col-sm-2 col-md-2 col-lg-2 control-label"
					for="order-by">Order By :</label>
				<div class="col-md-3 col-lg-3 col-sm-3">
					<select class="form-control" name="order-by">
						<option value=" asc ">Ascending</option>
						<option value=" desc ">Descending</option>
					</select>
				</div>

			</div>
			<div class="form-group">
				<div
					class="col-md-offset-8 col-sm-offset-8 col-lg-offset-8 col-md-10 col-sm-10 col-lg-10">
					<button class="btn btn-primary" type="submit">Search</button>
				</div>
			</div>
		</fieldset>

	</form>
</body>
</html>