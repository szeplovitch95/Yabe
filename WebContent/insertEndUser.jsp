<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();

		// get all information about end user and assign values to its object
		EndUser endUser = new EndUser();
		endUser.setFirstName(request.getParameter("firstName"));
		endUser.setLastName(request.getParameter("lastName"));
		endUser.setGender(request.getParameter("gender").equals("male") ? "Male" : "Female");
		endUser.setUsername(request.getParameter("username"));
		
		int id = dao.getEndUserID(endUser.getUsername());
		
		if(id == 0) {
			response.sendRedirect("error.jsp");
			return;
		}
		
		endUser.setPassword(request.getParameter("password"));
		String rePassword = request.getParameter("rePassword");
		endUser.setEmail(request.getParameter("emailAddress"));
		endUser.setPhoneNum(request.getParameter("phoneNum"));
		endUser.setUserType("Buyer");
		endUser.getEmail().equals("");

		// get all information about buyer and assign values to its object
		Buyer buyer = new Buyer();
		buyer.setCcType(request.getParameter("card-type"));
		buyer.setCardHolderName(request.getParameter("card-holder-name"));
		buyer.setCcNumber(request.getParameter("card-number"));
		String exprDate = request.getParameter("expiry-month") + request.getParameter("expiry-year");
		buyer.setExpirationDate(buyer.stringToDate("2016-01-11"));
		buyer.setcVV(request.getParameter("cvv"));
		buyer.setShippingStreet(request.getParameter("shipping-street"));
		buyer.setShippingCity(request.getParameter("shipping-city"));
		buyer.setShippingState(request.getParameter("shipping-state"));
		buyer.setShippingZipCode(request.getParameter("zip-code"));
		
		if (!endUser.getUsername().equals("") && !endUser.getFirstName().equals("")
				&& !endUser.getLastName().equals("") && !endUser.getPassword().equals("") && !rePassword.equals("")
				&& !endUser.getEmail().equals("") && !endUser.getPhoneNum().equals("")) {
			if (endUser.getPassword().equals(rePassword)) {
				dao.insertEndUser(endUser);
				dao.insertBuyer(buyer, dao.getEndUserID(endUser.getUsername()));
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