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
				//out.print("<select name = \" Category \">");
				//out.print("<option value=\"" + "" + "\">" + "Any Category" + " </option>");
				while (rs.next()) {
					int categoryID = rs.getInt("CategoryID");
					String categoryname = rs.getString("CategoryName");					
				out.print("<input type=\"radio\" name=\"category\" value=\"" + categoryID + "\" checked/>"
						+ categoryname );//+ "</br>");
					//out.print("<option value=\"" + categoryID + "\">"
							//+ categoryname + " </option>");
				}
				out.print(
						"<input type=\"radio\" name=\"category\" value=\"" + "" + "\" checked/>" + "Any Category" + "</br>");
			%>
		</div>
		
		<div class="form-group">
		<label class="control-label col-md-2 col-sm-2 col-lg-2">Choose Color:</label>
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
				String status =  rs.getString("Status");
				out.print("<input type=\"radio\" name=\"status\" value=\"" + status + "\" checked/>"
						+ status );//+ "</br>");
			}
			out.print(
					"<input type=\"radio\" name=\"status\" value=\"" + "" + "\" checked/>" + "Any Status" + "</br>");
			
			
			
			rs = dao.getMaxWeight();
			int i = 0;
			int maxweight = 100;
			while(rs.next()){
				if(i == 0)
				{ maxweight =  rs.getInt("Weight");}
				
					i++;
			
			}
			
			rs = dao.getMaxPrice();
			int maxprice = 100;
			i = 0;
			while(rs.next()){
				if(i == 0)
				{ maxprice=  rs.getInt("InitialPrice");}
				
					i++;
			
			}
			
			%>
		</div>

 <p>Price Range</p>
  <div data-role="main" class="form-group">
      <div data-role="rangeslider">
        <label for="price-min">Price:</label>
        <input type="range" name="price-min" id="price-min" value="<%out.print(maxprice*.10);%>" min="0" max="<%out.print(maxprice);%>">
        <label for="price-max">Price:</label>
        <input type="range" name="price-max" id="price-max" value="<%out.print(maxprice*.90);%>" min="0" max="<%out.print(maxprice);%>">
      </div>
	
	  <p>Weight Range</p>
  </div>
 
     <div data-role="main" class="form-group">
      <div data-role="rangeslider">
        <label for="weight-min">Price:</label>
        <input type="range" name="weight-min" id="weight-min" value="<%out.print(maxweight*.10);%>" min="0" max="<%out.print(maxweight);%>">
        <label for="weight-max">Price:</label>
        <input type="range" name="weight-max" id="weight-max" value="<%out.print(maxweight*.90);%>" min="0" max="<%out.print(maxweight);%>">
      </div>



		<div class="form-group">
			<button class="btn btn-primary" type="submit">Search Items</button>
	</form>

</body>
</html>