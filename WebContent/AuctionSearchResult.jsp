<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Current Auctions Result Page</title>
</head>
<body>

	<h1>Here are the results of the search!</h1>
	<%  ApplicationDAO dao = new ApplicationDAO();
		LinkedList<Item> listOfItems = dao.getAllItems();
		out.println("<table border=\"1\">");
        out.println("<tr>");
        
		  for (int i = 0; i < listOfItems.size(); i++) {
			  
			  String color = listOfItems.get(i).getColor();
			 // out.println("</td>");
			  out.println("<td>" + color + "</td>");
			  String description = listOfItems.get(i).getDescription();
		//	  out.println("</td>");
	           // System.out.println("color  " + color + "  description  " + description);
	        }
		  out.println("</tr>");
	        out.println("</table>");
	%>	

	<a href="AuctionSearchPage.jsp">Want More? Try Another Search</a>

</body>
</html>