<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yabe - Log in or Sign up</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<h1 style="margin-left: 35%">Welcome to Yabe!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<form class="form-horizontal" name="login" action="login.jsp" method="post" style="margin-left: 7%;">
		<div class="form-group">
			<label class="control-label col-md-1 col-lg-1">Username:</label>
			<div class="col-md-5 col-lg-5">
				<input class="form-control" type="text" name="username" maxlength="30" required autofocus placeholder="Username"/>			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-1 col-lg-1">Password:</label>
			<div class="col-md-5 col-lg-5">
				<input class="form-control" type="password" name="password" maxlength="20" required placeholder="Password"/>			
			</div>
		</div>	
		<div class="form-group">
    	 <div class="col-md-offset-1 col-md-10">
      		<button type="submit" class="btn btn-default">Sign in</button>
    	 	<a href="registration.jsp">
				<button class="btn btn-primary" type="button">Sign Up</button>
			</a>
    	</div>
    	</div>
	</form>
</body>
</html>