<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  ApplicationDAO dao = new ApplicationDAO();
	EndUser endUser = new EndUser();
	endUser.setFirstName(request.getParameter("firstName"));
	endUser.setLastName(request.getParameter("lastName"));
	endUser.setGender(request.getParameter("gender").equals("male") ? "Male" : "Female");
	endUser.setUsername(request.getParameter("username"));
	endUser.setPassword(request.getParameter("password"));
	String rePassword = request.getParameter("rePassword");
	endUser.setEmail(request.getParameter("emailAddress"));	
	endUser.setPhoneNum(request.getParameter("phoneNum")); 
	endUser.setUserType("");
	endUser.getEmail().equals("");	
	
	if(!endUser.getUsername().equals("") && !endUser.getFirstName().equals("")&& !endUser.getLastName().equals("") &&
	   !endUser.getPassword().equals("") && !rePassword.equals("") && !endUser.getEmail().equals("") &&
	   !endUser.getPhoneNum().equals("")) {
		if(endUser.getPassword().equals(rePassword)) {
			dao.insertEndUser(endUser);
			response.sendRedirect("index.jsp");	
		} 
		else {
			response.sendRedirect("registration.jsp");
		}
	}
	else {
		response.sendRedirect("error.jsp");
	}
%>			
</body>
</html>