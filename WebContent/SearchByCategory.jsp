<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SelectDropDownByCategory</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>


</head>
<body>

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
					;
					out.print("<input type=\"radio\" name=\"category\" value=\"" + categoryID + "\" checked/>"
							+ categoryname );//+ "</br>");
				}
				out.print(
						"<input type=\"radio\" name=\"category\" value=\"" + 0 + "\" checked/>" + "Any Category" + "</br>");
			%>
		</div>
		
		<div class="form-group">
		<p>Choose Color:</p>
		
			<%
			rs = dao.getItemsColor();
			while (rs.next()) {
				String color = rs.getString("Color");
				out.print("<input type=\"radio\" name=\"color\" value=\"" + color + "\" checked/>"
						+ color);//+ "</br>");
			}
			out.print(
					"<input type=\"radio\" name=\"color\" value=\"" + "" + "\" checked/>" + "Any Color" + "</br>");
			%>

		</div>
		
		
		<div class="form-group">
		<p>Choose Status:</p>
		
			<%
			rs = dao.getDistinctStatus();
			while (rs.next()) {
				String status = rs.getString("Status");
				out.print("<input type=\"radio\" name=\"status\" value=\"" + status + "\" checked/>"
						+ status );//+ "</br>");
			}
			out.print(
					"<input type=\"radio\" name=\"status\" value=\"" + "" + "\" checked/>" + "Any Status" + "</br>");
			%>

		</div>
 
 <p>Price Range</p>
  <div data-role="main" class="form-group">
      <div data-role="rangeslider">
        <label for="price-min">Price:</label>
        <input type="range" name="price-min" id="price-min" value="200" min="0" max="1000">
        <label for="price-max">Price:</label>
        <input type="range" name="price-max" id="price-max" value="800" min="0" max="1000">
      </div>
	
	  <p>Weight Range</p>
  </div>

     <div data-role="main" class="form-group">
      <div data-role="rangeslider">
        <label for="weight-min">Price:</label>
        <input type="range" name="price-min" id="weight-min" value="200" min="0" max="1000">
        <label for="weight-max">Price:</label>
        <input type="range" name="price-max" id="weight-max" value="800" min="0" max="1000">
      </div>



		<div class="form-group">
			<div
				class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
				<button class="btn btn-primary" type="submit">Search Items
					of Category</button>
			</div>
	</form>

</body>
</html>