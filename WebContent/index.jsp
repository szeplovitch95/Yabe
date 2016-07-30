<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yabe- Log in or Sign up</title>
</head>
<body>
	<h1>Welcome to Yabe!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<form name="login" action="login.jsp" method="post">
		<div>
			<label>Username:</label>
			<input type="text" name="username" maxlength="30" required autofocus placeholder="Username"/>
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
</body>
</html>