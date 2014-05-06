<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	Post currentPost = ThreadController.getQuestion((Integer)session.getAttribute("postID"));
	int userID = DataController.getUserID((String)session.getAttribute("username"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title><%= currentPost.getTopic() %></title>
</head>
<body>
<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="userMenu">
		<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Profile</a></li>
		<li><a href="#">Messages</a></li>
		<li><a href="#">Forum</a></li>
		<li><a href="#">Adverts</a></li>
		<li><a href="#">Search</a></li>
		<li><a href="#">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
	<div class="threadBody"><br>
		<div class="threadTopic"><h1 class="topicLabel"><%= currentPost.getTopic() %></h1></div>
		<div class="question" id="askerInfo">
				<h4 class="askerName"><%= session.getAttribute("username") %></h4>
				<br>
				<div class="userIcon">
					<img src="../images/kappa.png" width="50" height="50">
				</div>
				<div class="question" id="questionBody"><%= currentPost.getContent() %>
					<%
						if(userID == currentPost.getAuthorID()){
							out.print("\n<div class=\"threadEditing\"><a href=\"editthread.jsp\">Edit</a>   <a href=\"deletethread.jsp\">Delete</a></div>");
						}
					%>
				</div>
				<%
					ListIterator<Comment> iterator = currentPost.getComments().listIterator();
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
	</div>
	<div id="userAdvert">


	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>
</body>
</html>