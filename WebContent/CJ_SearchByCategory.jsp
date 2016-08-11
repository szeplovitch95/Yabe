<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title></title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<form class="form-horizontal" action="CJ_SearchResults.jsp"
		method="post" style="margin-left: 7%;">
		<div class="form-group">
			<%
				ApplicationDAO dao = new ApplicationDAO();
				ResultSet rs = dao.getCategoryAndID();
			%>
			<label class="control-label col-md-1 col-sm-1 col-lg-1">Category:</label>
			<div class="col-md-2 col-lg-2 col-sm-2">
				<select class="form-control" name="category">
				<option value = "">Any Category</option>
					</option>
					<%
						while (rs.next()) {
							int categoryID = rs.getInt("CategoryID");
							String categoryname = rs.getString("CategoryName");
					%>
					<option value = "<% out.print(categoryID );%>">
						
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
			<label class="control-label col-md-1 col-sm-1 col-lg-1">Color:</label>
			<div class="col-md-2 col-lg-2 col-sm-2">
				<select class="form-control" name="color">
					<%
						while (rs.next()) {
							String color = rs.getString("Color");
					%>
					<option>
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
			<label class="control-label col-md-1 col-sm-1 col-lg-1">Status:</label>
			<div class="col-md-2 col-lg-2 col-sm-2">
				<select class="form-control" name="status">
					<%
						while (rs.next()) {
							String status = rs.getString("Status");
					%>
					<option>
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
	<% 		
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
		<div class="form-group">
			<label for="price-min" class="control-label col-sm-1 col-md-1 col-lg-1">Price:</label>
			<div class="col-lg-5 col-md-5 col-sm-5">
				<input type="number" name="price-min" class="col-sm-2 col-lg-2 col-md-2" min="0" value="0"/>
				<span class="col-sm-1 col-lg-1 col-md-1"> to </span> 
				<input type="number" name="price-max" class="col-sm-2 col-lg-2 col-md-2" min="0" value="<%out.print(maxprice); %>"/>
			</div>
			<label for="weight-min" class="control-label col-sm-1 col-md-1 col-lg-1">Weight:</label>
			<div class="col-lg-5 col-md-5 col-sm-5">
				<input type="number" name="weight-min" class="col-sm-2 col-lg-2 col-md-2" value="0" min="0"/>
				<span class="col-sm-1 col-lg-1 col-md-1"> to </span> 
				<input type="number" name="weight-max" class="col-sm-2 col-lg-2 col-md-2" min="0" value="<%out.print(maxweight); %>" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-1 col-md-1 col-lg-1 control-label" for="sort-by">Sort
				By :</label>
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
			<label class="col-sm-1 col-md-1 col-lg-1 control-label"
				for="order-by">Order By :</label>
			<div class="col-md-3 col-lg-3 col-sm-3">
				<select class="form-control" name="order-by">
					<option value=" asc ">Ascending</option>
					<option value=" desc ">Descending</option>
				</select>
			</div>
			<button class="btn btn-primary" type="submit">Search Items</button>
		</div>
	</form>
</body>
</html>