<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Earnings Report</title>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%  
	ApplicationDAO dao = new ApplicationDAO();
	ResultSet rsTotalEarnings = dao.GRgetEarnings("TotalEarnings");
	ResultSet rsTotalEarningsPerEndUser = dao.GRgetEarnings("PerEndUser");
	ResultSet rsTotalEarningsPerItem = dao.GRgetEarnings("PerItem");
	ResultSet rsTotalEarningsPerCategory = dao.GRgetEarnings("PerCategory");
	ResultSet rsTotalBestSellingItems = dao.GRgetEarnings("BestSellingItems");
	ResultSet rsTotalBestBuyers = dao.GRgetEarnings("BestBuyers");
	ResultSet rsTotalBestSellers = dao.GRgetEarnings("BestSellers");	
%>

	<div class="container">
		<h2>Sales Reports</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#TotalEarnings">Total
					Earnings</a></li>
			<li><a data-toggle="tab" href="#TotalSellerEarnings">Seller
					Earnings</a></li>
			<li><a data-toggle="tab" href="#TotalItemEarnings">Item
					Earnings</a></li>
			<li><a data-toggle="tab" href="#TotalCategoryEarnings">Category
					Earnings</a></li>
			<li><a data-toggle="tab" href="#TotalBestSellingItems">Best
					Selling Items</a></li>
			<li><a data-toggle="tab" href="#TotalBestBuyers">Best Buyers</a></li>
			<li><a data-toggle="tab" href="#TotalBestSellers">Best
					Sellers</a></li>
		</ul>
		<div class="tab-content">
			<div id="TotalEarnings" class="tab-pane fade in active">
				<h3>Total Earnings</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Total Completed Auctions</th>
								<th>Total Earnings From Auctions</th>
							</tr>
						</thead>
						<tbody>
							<% while(rsTotalEarnings.next()) { %>
							<tr>
								<td><%= rsTotalEarnings.getInt("Total_Finished_Auctions") %>
								</td>
								<td><%= "$ "+ rsTotalEarnings.getInt("Total_Earnings") %></td>
							</tr>
							<%
					}
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalSellerEarnings" class="tab-pane fade">
				<h3>Earnings Per Seller</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>EndUser/Seller ID</th>
								<th>First Name</th>
								<th>LastName</th>
								<th>Completed Auctions</th>
								<th>Total Earnings on Completed Auctions</th>
							</tr>
						</thead>
						<tbody>
							<% while(rsTotalEarningsPerEndUser.next()) { %>
							<tr>
								<td><%= rsTotalEarningsPerEndUser.getInt("EndUserID") %></td>
								<td><%= rsTotalEarningsPerEndUser.getString("FirstName") %>
								</td>
								<td><%= rsTotalEarningsPerEndUser.getString("LastName") %>
								</td>
								<td><%= rsTotalEarningsPerEndUser.getInt("Auction_Count") %>
								</td>
								<td><%= "$ "+ rsTotalEarningsPerEndUser.getInt("Total_Earning") %>
								</td>
							</tr>
							<%
					}
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalItemEarnings" class="tab-pane fade">
				<h3>Earnings Per Item</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Item ID</th>
								<th>Item Name</th>
								<th>Total Earnings On Item at Auction</th>
							</tr>
						</thead>
						<tbody>
							<% while(rsTotalEarningsPerItem.next()) { %>
							<tr>
								<td><%= rsTotalEarningsPerItem.getInt("ItemID") %></td>
								<td><%= rsTotalEarningsPerItem.getString("ItemName") %></td>
								<td><%= "$ "+ rsTotalEarningsPerItem.getInt("Total_Earning_Item") %>
								</td>
							</tr>
							<%
					}
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalCategoryEarnings" class="tab-pane fade">
				<h3>Earnings Per Item Category</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Category ID</th>
								<th>Category Name</th>
								<th>Total Earnings On Category Items at Auction</th>
							</tr>
						</thead>
						<tbody>
							<% while(rsTotalEarningsPerCategory.next()) { %>
							<tr>
								<td><%= rsTotalEarningsPerCategory.getInt("Category") %></td>
								<td><%= rsTotalEarningsPerCategory.getString("CategoryName") %>
								</td>
								<td><%= "$ "+ rsTotalEarningsPerCategory.getInt("Total_Earning_ItemCategory") %>
								</td>
							</tr>
							<%
					}
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalBestSellingItems" class="tab-pane fade">
				<h3>Best Selling Items</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Rank</th>
								<th>Item ID</th>
								<th>Item Name</th>
								<th>Total Earnings On Items at Auction</th>
							</tr>
						</thead>
						<tbody>
							<% 
				    int i = 1;								    
				    while(rsTotalBestSellingItems.next()) {
				    	if (i > 5){
				    		break;
				    	}else{				    						    	
				    	%>
							<tr>
								<td><%= i %></td>
								<td><%= rsTotalBestSellingItems.getInt("ItemID") %></td>

								<td><%= rsTotalBestSellingItems.getString("ItemName") %></td>

								<td><%= "$ "+ rsTotalBestSellingItems.getInt("Total_Earning_Item") %>
								</td>
							</tr>
							<%
						i++;
				    	}
				    }
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalBestBuyers" class="tab-pane fade">
				<h3>Best Buyers</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Rank</th>
								<th>EndUser/Buyer ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Auctions Won</th>
								<th>Total Spending</th>
							</tr>
						</thead>
						<tbody>
							<% 
				    int j = 1;				    				    
				    while(rsTotalBestBuyers.next()) {
				    	if (j > 5){
				    		break;
				    	}else{			    					    	
				    	%>
							<tr>
								<td><%= j %></td>
								<td><%= rsTotalBestBuyers.getInt("EndUserID") %></td>
								<td><%= rsTotalBestBuyers.getString("FirstName") %></td>
								<td><%= rsTotalBestBuyers.getString("LastName") %></td>
								<td><%=  rsTotalBestBuyers.getInt("Auction_Count") %></td>
								<td><%= "$ "+ rsTotalBestBuyers.getInt("Total_Spending") %>
								</td>
							</tr>
							<%
						j++;						
				    	}
				    }
				  %>
						</tbody>
					</table>
				</div>
			</div>
			<div id="TotalBestSellers" class="tab-pane fade">
				<h3>Best Sellers</h3>
				<div class="container">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Rank</th>
								<th>EndUser/Seller ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Auctions Sold</th>
								<th>Total Earning</th>
							</tr>
						</thead>
						<tbody>
							<% 
				    int k = 1;				  				
				    while(rsTotalBestSellers.next()) {
				    	if (k > 5){
				    		break;
				    	}else{				    						    	
				    	%>
							<tr>
								<td><%= k %></td>
								<td><%= rsTotalBestSellers.getInt("EndUserID") %></td>
								<td><%= rsTotalBestSellers.getString("FirstName") %></td>
								<td><%= rsTotalBestSellers.getString("LastName") %></td>
								<td><%=  rsTotalBestSellers.getInt("AUCTION_COUNT") %></td>
								<td><%= "$ "+ rsTotalBestSellers.getInt("TOTAL_EARNING") %>
								</td>
							</tr>
							<%
						k++;
				    	}
				    }
				  %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>