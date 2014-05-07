<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<%
	int userID = DataController.getUserID((String)session.getAttribute("username"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit new message</title>
</head>
<body>
	<%
		String recipient = request.getParameter("recipient");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		if(content.length() > 255){
			response.sendRedirect("../Message/newmessage.html");
		}
		
		boolean testUser = DataController.userExists(recipient);
		if(testUser){
			int recID = DataController.getUserID(recipient);
			Message message = Message.newMessage(userID, recID, subject, content);
			MessageController.newMessage(message);
			response.sendRedirect("userMessages.jsp");
		}
		else{
			response.sendRedirect("newmessage.html");
		}
	%>
</body>
</html>