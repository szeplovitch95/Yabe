<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" action="insertSeller.jsp" method="post">
		<fieldset>
			<legend>Seller Information</legend>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-lg-2">Bank
					Name:</label>
				<div class="col-md-5 col-lg-5 col-sm-5">
					<input class="form-control" type="text" name="bankName"
						placeholder="Bank Name" required autofocus />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-lg-2">Bank
					Account Number:</label>
				<div class="col-md-5 col-lg-5 col-sm-5">
					<input class="form-control" type="text" name="bankAccountNumber"
						placeholder="Bank Account Number" required />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-2 col-sm-2 col-lg-2">Bank
					Routing Number:</label>
				<div class="col-md-5 col-lg-5 col-sm-5">
					<input class="form-control" type="text" name="bankRoutingNumber"
						placeholder="Bank Routing Number" required />
				</div>
			</div>
		</fieldset>
		<div class="form-group">
			<div
				class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
				<button class="btn btn-primary" type="submit">Save</button>
			</div>
		</div>
	</form>
</body>
</html>