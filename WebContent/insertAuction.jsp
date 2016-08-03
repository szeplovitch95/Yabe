<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*, java.sql.ResultSet"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ApplicationDAO dao = new ApplicationDAO();
   Auction auction = new Auction();
   String item = request.getParameter("itemName");
   
   ResultSet rs = dao.getSellerItems(1, false);
   
   while(rs.next()) {
	   if(rs.getString("ItemName").equals(item)) {
		   auction.setItemID(rs.getInt("ItemID"));
	   }
   }
   
   //TODO add sessions
   auction.setCreatedBy(1);
   auction.setStatus("New");
   auction.setInitialPrice(Integer.parseInt(request.getParameter("initialPrice")));
   auction.setStartDate(auction.stringToDate(request.getParameter("openDate")));
   auction.setCloseDate(auction.stringToDate(request.getParameter("closeDate")));
   auction.setTotalBids(0);
   
 


   //TODO form validation 
   dao.insertAuction(auction);
   response.sendRedirect("sellerAuctionList.jsp");
%>
</body>
</html>