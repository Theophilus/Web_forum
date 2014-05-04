<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	model.Thread currentThread = ThreadController.getThread((Integer)session.getAttribute("threadID"));
	int userID = DataController.getUserID((String)session.getAttribute("username"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title><%= currentThread.getTopic() %></title>
</head>
<body>
	<div class="threadBody"><br>
		<div class="threadTopic"><h1 class="topicLabel"><%= currentThread.getTopic() %></h1></div>
		<div class="question" id="askerInfo">
				<h4 class="askerName"><%= session.getAttribute("username") %></h4>
				<br>
				<div class="userIcon">
					<img src="../images/kappa.png" width="50" height="50">
				</div>
				<div class="question" id="questionBody"><%= currentThread.getQuestion().getContent() %>
					<%
						if(userID == currentThread.getAuthorID()){
							out.print("\n<div class=\"threadEditing\"><a href=\"editthread.jsp\">Edit</a>   <a href=\"deletethread.jsp\">Delete</a></div>");
						}
					%>
				</div>
				<%
					ListIterator<Comment> iterator = currentThread.getComments().listIterator();
					Comment currentComment;
					String commenterUsername = null;
					String commentTopic = null;
					String commentBody = null;
					String commentText = "";
					while(iterator.hasNext()){
						commentText = "";
						currentComment = iterator.next();
						commenterUsername = DataController.getUsername(currentComment.getAuthorID());
						commentTopic = currentComment.getTopic();
						commentBody = currentComment.getContent();
						commentText = "<div class=\"comment\"><b>"+commenterUsername+"</b> ["+commentTopic+"]: "+commentBody+"</div>";
						if(userID == currentComment.getAuthorID()){
							commentText += "\n<div class=\"threadEditing\"><a href=\"editcomment.jsp\">Edit</a>   <a href=\"deletecomment.jsp\">Delete</a></div>";
						}
						out.print(commentText);
					}
				%>
			</div>	
	</div>
</body>
</html>