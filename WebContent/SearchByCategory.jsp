<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SelectDropDownByCategory</title>
</head>
<body>
<select>
<option value="" disabled selected>Select Category</option>
<% 	    ApplicationDAO dao = new ApplicationDAO();
		LinkedList<Category> listOfCategories = dao.getAllCategories();
		
		 for (int i = 0; i < listOfCategories.size(); i++) {
			
			 String categoryname = listOfCategories.get(i).getCategoryName();
			 int categoryID = listOfCategories.get(i).getCategoryID();
			 out.print(" <option value=\"category\">"+ categoryname + categoryID+ "</option>");
			
		 }
		 
		%>
		</select>


</body>
</html>