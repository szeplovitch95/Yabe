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
		ApplicationDAO daoDelete = new ApplicationDAO();
	
		String auctionNumber = ""+ request.getParameter("auctionNumberDelete");

		
		//Call Answer Question
		daoDelete.GRdelete("auction", auctionNumber);
		response.sendRedirect("allAuctions.jsp"); 

	%>
</body>
</html>