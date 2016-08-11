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
	<h2 style="margin-left:5%;">All Users:</h2>
</div>

<%
	ApplicationDAO dao = new ApplicationDAO(); 
	ResultSet rs = dao.GRgetAll("users");
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
			<th>EndUser ID</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>User Name</th>
			<th>Password</th>
			<th>Email</th>
			<th>Phone</th>
			<th>User Type</th>	
			
			
			<%if(buttons){%>
				<th>Delete Auction</th>
			
			<%} %>
		</tr>
	</thead>
	<tbody>
		<%
			while (rs.next()) {
		%>
		<tr>
		
			<td><%=rs.getInt("EndUserID")%></td>
			<td><%=rs.getString("FirstName")%></td>
			<td><%=rs.getString("LastName")%></td>
			<td><%=rs.getString("Gender")%></td>
			<td><%=rs.getString("Username")%></td>
			<td><%=rs.getString("Password")%></td>
			<td><%=rs.getString("Email")%></td>
			<td><%=rs.getInt("Phone")%></td> 
			<td><%=rs.getString("UserType")%></td>
			
			<%if(buttons){%>
				<td>
					<form name="userDelete"  method="POST"  action="deleteUser.jsp">
						<input type="hidden" name="userNumberDelete" value="<%=rs.getInt("EndUserID")%>"/>
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