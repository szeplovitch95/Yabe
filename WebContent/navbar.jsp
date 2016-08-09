<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="scripts/navigation.js"></script>
</head>
<header>
	<nav class="navbar navbar-default" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Yabe</a>
			</div>
			<ul class="nav navbar-nav">
				<li id="home"><a href="homePage.jsp">Home</a></li>
				<li id="buy"><a href="buy.jsp">Buy</a></li>
				<li id="sell"><a href="sell.jsp">Sell</a></li>
				<li id="watchList"><a href="watchList.jsp">Watch List</a></li>
				<li id="search"><a href="CJ_SearchByCategory.jsp">Search Auctions</a></li>
				<li id="questions"><a href="CJ_SearchQuestions.jsp">Search Questions</a></li>
				<%
				String username = (String)session.getAttribute("username");
				if(username.equals("admin")) {
				%>
					<li id="question"><a href="questionPage.jsp">Questions</a></li>
					<li id="earnings"><a href="earnings.jsp">Earnings</a></li> <%	
				}
				%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">${sessionScope.username}</a></li>
				<li><a href="logout.jsp">Sign out</a></li>
			</ul>
		</div>
	</nav>
</header>