<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<body>

	<h1>Here are the results of the search!</h1>
	<%  ApplicationDAO dao = new ApplicationDAO();
		LinkedList<Item> listOfItems = dao.getAllItems();
		out.println("<table border=\"1\">");
        
        out.println("<tr> <th>ItemName</th><th>ItemDecription</th><th>Color</th><th>Weight</th><th>Quantity</th> </tr>");
             
		  for (int i = 0; i < listOfItems.size(); i++) {
			  out.println("<tr>");
			  String item = listOfItems.get(i).getName();
			  String description = listOfItems.get(i).getDescription();
			  String color = listOfItems.get(i).getColor();
			  String weight = listOfItems.get(i).getWeight();
			  int quantity =  listOfItems.get(i).getQuantityOnHand();
			  out.println("<td>" + item + "</td>");
			  out.println("<td>" + description + "</td>");
			  out.println("<td>" + color + "</td>");
			  out.println("<td>" + weight + "</td>");
			  out.println("<td>" + quantity + "</td>");
			  out.println("</tr>");
	        }
	        out.println("</table>");
	%>	

	<a href="AuctionSearchPage.jsp">Want More? Try Another Search</a>
	

</body>
</html> 