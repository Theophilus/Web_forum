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
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>Message Center</title>
</head>
<body>
<%= HeaderGenerator.getHeader(DataController.getUserType(userID)) %>
<div id="userContent">
	<div class="threadBody">
		<br>
			<div class="threadTopic"><h1 class="topicLabel">Messages</h1></div>
			<%
				LinkedList<Message> messages = MessageController.getMessagesByReceipient(userID);
				ListIterator<Message> iterator = messages.listIterator();
				Message currentMessage = null;
				String author = "";
				if(!iterator.hasNext()){
					out.print("No messages!");
				}
				while(iterator.hasNext()){
					currentMessage = iterator.next();
					author = DataController.getUsername(currentMessage.getSender_id());
					out.print("<div class=\"comment\"><b>"+author+"</b></div>");
				}
			%>
			<br><a href="../Message/newmessage.html"><button type="button">Compose New Message</button></a>
	</div>
</div>
<%= HeaderGenerator.getFooter() %>
</body>
</html>