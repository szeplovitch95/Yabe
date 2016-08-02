<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>SelectDropDownByCategory</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>

	<form class="form-horizontal" action="CJ_SearchResults.jsp"
		method="post" style="margin-left: 7%;">

		<p style="margin-left: 35%" >Choose Category:</p>
		<div class="form-group">

			<%
				GetCategoryInfo dao = new GetCategoryInfo();
				LinkedList<Category> listOfCategories = dao.getAllCategories();

				for (int i = 0; i < listOfCategories.size(); i++) {

					String categoryname = listOfCategories.get(i).getCategoryName();
					int categoryID = listOfCategories.get(i).getCategoryID();
					out.print("<input type=\"radio\" name=\"category\" value=\"" + categoryID + "\" checked/>"
							+ categoryname + "</br>");
				}
			%>
		</div>
		<div class="form-group">
			<div
				class="col-md-offset-6 col-sm-offset-6 col-lg-offset-6 col-md-10 col-sm-10 col-lg-10">
				<button class="btn btn-primary" type="submit">Search Items of Category</button>
			</div>
	</form>

</body>
</html>