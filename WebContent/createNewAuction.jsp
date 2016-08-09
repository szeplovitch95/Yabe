<head>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<%@include file="navbar.jsp" %>
  <div>
	<h2 style="margin-left:35%;">Create New Auction:</h2>	
  </div>
<form class="form-horizontal" action="insertAuction.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Pick an Item:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="itemName" placeholder="Item Name" required autofocus/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Open Date:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="date" name="openDate" placeholder="Open Date:" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Close Date:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="date" name="closeDate" required/>			
			</div>
		</div>
 		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Initial Price:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="number" name="initialPrice"  placeholder="Initial Price" required/>			
			</div>
		</div>
		<div class="form-group">
		<button class="btn btn-primary" type="submit">Create Auction</button>
		</div>
</form>