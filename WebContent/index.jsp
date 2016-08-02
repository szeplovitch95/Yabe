<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yabe- Log in or Sign up</title>
</head>
<body>
<<<<<<< HEAD
	<h1>Welcome to Yabe! Hope you are having a great day!</h1>
	
	<a href="LinkToAllPagesAndFunctions.jsp">LinkToAllPages Page</a>
	
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<form name="login" action="login.jsp" method="post">
		<div>
			<label>Username:</label>
			<input type="text" name="username" maxlength="30" required autofocus placeholder="Username"/>
=======
	<div class="container">

	<h1 style="margin-left: 35%">Welcome to Yabe!</h1>
	<hr/>
	<form class="form-horizontal" name="login" action="login.jsp" method="post" style="margin-left: 7%;">
		<div class="form-group">
			<label class="control-label col-md-1 col-lg-1 col-sm-1">Username:</label>
			<div class="col-md-5 col-lg-5 col-sm-5">
				<input class="form-control" type="text" name="username" maxlength="30" required autofocus placeholder="Username"/>			
			</div>
>>>>>>> master
		</div>
		<div>
			<label>Password:</label>
			<input type="password" name="password" maxlength="20" required placeholder="Password"/>
		</div>		
		<div>
			<button type="submit">Log In</button>
			<a href="registration.jsp">
				<button type="button">Sign Up</button>
			</a>
		</div>
	</form>
	</div>
</body>
</html>