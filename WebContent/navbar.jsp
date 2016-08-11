<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/navigation.js"></script>
</head>
<header>


<%
String username = (String)session.getAttribute("userType");
%>

	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Yabe</a>
			</div>
			<ul class="nav navbar-nav">
				<li id="home"><a href="homePage.jsp">Home</a></li>
				
				<%if(username.equals("CustomerRep")) { %>
					<li id="bids"><a href="allBids.jsp">All Bids</a></li>
					<li id="auctions"><a href="allAuctions.jsp">All Auctions</a></li>
					<li id="users"><a href="allUsers.jsp">All Users</a></li>
					
				<%}else{ %>
					<li id="buy"><a href="buy.jsp">Buy</a></li>
					<li id="sell"><a href="sell.jsp">Sell</a></li>
				<%} %>
				
				<li id="watchList"><a href="watchList.jsp">Watch List</a></li>
				<li id="searchUsersAuctions"><a href="searchUsersAuctions.jsp">Search Users Auctions</a></li>
				<li id="questionPage"><a href="questionPage.jsp">Yabe Questions</a></li>
				<%
				if(username.equals("admin")) {
				%>
					<li id="earnings"><a href="earnings.jsp">Earnings</a></li>
					<li><a href="registration.jsp">Create Customer Rep</a></li>
				<%	
				}else if(username.equals("CustomerRep")){
				%>
				
				
				
				<%} %>
				
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">${sessionScope.username}</a></li>
				<li><a href="logout.jsp">Sign out</a></li>
			</ul>
		</div>
	</nav>
</header>