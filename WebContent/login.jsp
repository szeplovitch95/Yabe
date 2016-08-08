<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.cs336.pkg.*"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Yabe - Login</title>
</head>
<body>

	<%@ include file="index.jsp"%>
	<%
		ApplicationDAO dao = new ApplicationDAO();
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session1 = request.getSession();
		System.out.print(session1);
		session1.setAttribute("username", username);
		String usernameLogin = (String)session1.getAttribute("username");
		System.out.println(usernameLogin);
		int id = dao.getEndUserID(usernameLogin);
		session1.setAttribute("userID", id);
		session1.setAttribute("auctionID", 0);
		session1.setAttribute("itemID", 0);
		
		if (!username.equals("") && !password.equals("")) {
			if (dao.userLogin(username, password)) {
				response.sendRedirect("homePage.jsp");
			} 
			else { %>
				<label class="control-label" style="margin-left: 30%; color: Red;">Username
				or password error. Please try again.</label>
		<%
			}
		}
		%>
</body>
</html>