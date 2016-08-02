<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
<<<<<<< HEAD
	<h1>Please register below:</h1>
	<form action="insertEndUser.jsp" method="post">
		<div>
			<label>First Name:</label> <input type="text" name="firstName"
				placeholder="First Name" required autofocus />
		</div>
		<div>
			<label>Last Name:</label> <input type="text" name="lastName"
				placeholder="Last Name" required />
		</div>
		<div>
			<label>Gender:</label> <input type="radio" name="gender" value="male"
				checked /> Male <input type="radio" name="gender" value="female" />
			Female
		</div>
		<div>
			<label>Username:</label> <input type="text" name="username"
				maxlength="30" placeholder="Username"
				pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required />
		</div>
		<div>
			<label>Password:</label> <input type="password" name="password"
				title="Password must be no more than 20 characters." maxlength="20"
				placeholder="Password" required />
		</div>
		<div>
			<label>Confirm Password:</label> <input type="password"
				name="rePassword" maxlength="20" placeholder="Confirm Password"
				required />
		</div>
		<div>
			<label>Email:</label> <input type="email" name="emailAddress"
				placeholder="Email Address" required />
		</div>
		<div>
			<label>Phone Number:</label> <input type="text" name="phoneNum"
				placeholder="Phone Number" maxlength="15"
				pattern="\d{3}[\-]\d{3}[\-]\d{4}" required />
		</div>

		<div>
			<label>User Type:</label> 
			<select>
				<option value="" disabled selected>Select Type</option>
				<option value="buyer">I am a Buyer</option>
				<option value="seller">I am a Seller</option>
			</select>
		</div>
		<button type="submit">Sign up</button>
=======
	<div class="row">
	  <div class="col-md-2 col-sm-2 col-lg-2"></div>
	  <div class="col-md-4 col-sm-4 col-lg-4">
		  <h2 style="margin-left:35%;">Registration:</h2>	
	  </div>
	  <div class="col-md-6 col-sm-6 col-lg-6">
	    <a href="index.jsp" class="pull-right">
			<button type="button" class="btn btn-primary">Back to Login Page</button>
		</a>
	  </div>
	</div>
	
	<form class="form-horizontal" action="insertEndUser.jsp" method="post">
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">First Name:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="firstName" placeholder="First Name" required autofocus/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Last Name:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="lastName" placeholder="Last Name" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Gender</label>			
			<div class="radio-inline col-md-3 col-lg-3 col-sm-3" style="padding-left: 35px;">
				<input type="radio" name="gender" value="male" checked/> Male
			</div>
			<div class="radio-inline col-md-3 col-lg-3 col-sm-3" style="padding-left: 35px;">			
				<input type="radio" name="gender" value="female"/> Female	
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Username:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="username" placeholder="Username" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Password:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="password" name="password" maxlength="20" placeholder="Password" required/>			
			</div>
		</div>
 		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Confirm Password</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="password" name="rePassword" maxlength="20" placeholder="Confirm Password" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Email:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="emailAddress" placeholder="Email Address" required/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-2 col-sm-2 col-lg-2">Phone Number:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="phoneNum" placeholder="Format: 999-999-9999" maxlength="15" pattern="\d{3}[\-]\d{3}[\-]\d{4}" required/>			
			</div>
		</div>
		<div class="form-group">
		 <div class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
			<button class="btn btn-primary" type="submit">Sign Up</button>		
    	</div>		
		</div>
>>>>>>> master
	</form>
	<a href="index.jsp"> Home </a>
</body>
</html>