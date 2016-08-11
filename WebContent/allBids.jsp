<%@page import="java.sql.ResultSet"%>
<%@ page language="java" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<%@include file="navbar.jsp"%>

<div>
	<h2 style="margin-left:5%;">Bids:</h2>
</div>

<%
	ApplicationDAO dao = new ApplicationDAO(); 
	ResultSet rs = dao.GRgetAll("bids");
	String itemName = "";
	
	String userType = (String)request.getSession().getAttribute("userType"); 
	int questionColSpan = 1;
	boolean buttons = false;
	if (userType.equals("CustomerRep")){
		buttons = true;
		questionColSpan = 2;	
	}
	
%>
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>Bid ID</th>
			<th>Auction ID</th>
			<th>Creation Date</th>
			<th>Offer Price</th>
			<th>Cancelled</th>
			<th>Bid Placed By</th>
			<th>Cancelled By</th>
			
			<%if(buttons){%>
				<th>Delete Bid</th>
			
			<%} %>
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) { 
		%>
		<tr>
			<td><%=rs.getInt("BidID")%></td>
			<td><%=rs.getInt("AuctionID")%></td>
			<td><%=rs.getDate("BidDateTime")%></td>
			<td><%=rs.getInt("OfferPrice")%></td>
			<td><%=rs.getInt("Cancelled")%></td>
			<td><%=rs.getInt("OfferedBy")%></td>
			<td><%=rs.getInt("CancelledBy")%></td>

	
			<%if(buttons){%>
				<td>
					<form name="bidDelete"  method="POST"  action="deleteBid.jsp">
						<input type="hidden" name="bidNumberDelete" value="<%=rs.getInt("bidID")%>"/>
						<button class="btn btn-primary" type="submit" >Delete</button>
					</form>
				</td>

			<%} %>
			
			
		</tr>
		<%
			}
		%>
	</tbody>
</table>
</html>