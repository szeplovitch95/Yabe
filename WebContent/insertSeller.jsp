<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		Seller seller = new Seller();
		seller.setBankName(request.getParameter("bankName"));
		seller.setBankAccountNumber(request.getParameter("bankAccountNumber"));
		seller.setBankRoutingNumber(request.getParameter("bankRoutingNumber"));
		dao.insertSeller(seller, (Integer)session.getAttribute("userID"));
		response.sendRedirect("sell.jsp");
	%>
</body>
</html>