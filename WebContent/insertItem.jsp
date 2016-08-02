<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*, java.sql.ResultSet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ApplicationDAO dao = new ApplicationDAO();
   Item item = new Item();
   
   //TODO add sessions
   item.setSellerID(1);
   String category = request.getParameter("itemCategory");
   System.out.println(category);

   ResultSet rs = dao.getCategories();
   
   while(rs.next()) {
	   if(rs.getString("CategoryName").equals(category)) {
		   item.setCategoryID(rs.getInt("CategoryID"));
		   System.out.println(item.getCategoryID());
	   }
   }

   item.setName(request.getParameter("itemName"));
   item.setColor(request.getParameter("color"));
   item.setDescription(request.getParameter("itemDescription"));
   item.setQuantityOnHand(Integer.parseInt(request.getParameter("qtyOnHand")));
   item.setWeight(request.getParameter("weight"));
   
   //TODO form validation 
   dao.insertItem(item);
   response.sendRedirect("sell.jsp");
%>
</body>
</html>