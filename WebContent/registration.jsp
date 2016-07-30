<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>
	<h1>Please register below:</h1>
	<form action="insertEndUser.jsp" method="post">
		<div>
			<label>First Name:</label>
			<input type="text" name="firstName" placeholder="First Name" required autofocus/>
		</div>
		<div>
			<label>Last Name:</label>
			<input type="text" name="lastName" placeholder="Last Name" required />
		</div> 
		<div>
			<label>Gender:</label>
			<input type="radio" name="gender" value="male" checked/> Male
			<input type="radio" name="gender" value="female"/> Female
		</div> 
		<div>
			<label>Username:</label>
			<input type="text" name="username" maxlength="30" placeholder="Username" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{1,20}$" required />
		</div>
		<div>
			<label>Password:</label>
			<input type="password" name="password" title="Password must be no more than 20 characters." maxlength="20" placeholder="Password" required />
		</div>
		<div>
			<label>Confirm Password:</label>
			<input type="password" name="rePassword" maxlength="20" placeholder="Confirm Password" required />
		</div>
		<div>
			<label>Email:</label>
			<input type="email" name="emailAddress" placeholder="Email Address" required />
		</div>
		<div>
			<label>Phone Number:</label>
			<input type="text" name="phoneNum" placeholder="Phone Number" maxlength="15" pattern="\d{3}[\-]\d{3}[\-]\d{4}" required />
		</div>
		<button type="submit" >Sign up</button>		
	</form>
	<a href="index.jsp"> Home </a>
</body>
</html>