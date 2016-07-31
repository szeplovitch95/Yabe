<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="row">
	  <div class="col-md-2"></div>
	  <div class="col-md-4">
		  <h2 style="margin-left:35%;">Registration:</h2>	
	  </div>
	  <div class="col-md-6">
	    <a href="index.jsp" class="pull-right">
			<button type="button" class="btn btn-primary">Home</button>
		</a>
	  </div>
	</div>
	
	<form class="form-horizontal" action="insertEndUser.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-md-2">First Name:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="firstName" placeholder="First Name" required autofocus/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Last Name:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="lastName" placeholder="Last Name" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Gender</label>			
			<div class="radio-inline col-md-3">
				<input type="radio" name="gender" value="male" checked/> Male
			</div>
			<div class="radio-inline col-md-3">			
				<input type="radio" name="gender" value="female"/> Female	
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Username:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="username" placeholder="Username" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Password:</label>
			<div class="col-md-5">
				<input class="form-control" type="password" name="password" maxlength="20" placeholder="Password" required/>			
			</div>
		</div>
 		<div class="form-group">
			<label class="control-label col-md-2">Confirm Password</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="rePassword" maxlength="20" placeholder="Confirm Password" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Email:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="emailAddress" placeholder="Email Address" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2">Phone Number:</label>
			<div class="col-md-5">
				<input class="form-control" type="text" name="phoneNum" placeholder="Phone Number" maxlength="15" pattern="\d{3}[\-]\d{3}[\-]\d{4}" required/>			
			</div>
		</div>
		<div class="form-group">
		 <div class="col-md-offset-1 col-md-10">
			<button class="btn btn-primary" type="submit">Sign Up</button>		
    	</div>		
		</div>
	</form>
</body>
</html>