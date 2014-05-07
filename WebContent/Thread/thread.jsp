<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<%
	//int threadID = Integer.parseInt(request.getParameter("threadid"));
	int threadID = 1;
	int userID = (Integer)session.getAttribute("uid");
	
	LinkedList<Post> posts = ThreadController.getPosts(threadID);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>Thread</title>
</head>
<body>
<%= HeaderGenerator.getHeader(DataController.getUserType(userID)) %>
<div id="userContent">
	<div class="threadBody"><br>
		<div class="threadTopic"><h1 class="topicLabel">Posts</h1></div>
		<%
			ListIterator<Post> iterator = posts.listIterator();
			Post currentPost = null;
			while(iterator.hasNext()){
				currentPost = iterator.next();
				out.print("<div class=\"comment\"><p><a href=\"../Post/post.jsp?postid="+currentPost.getPostID()+"\">"+currentPost.getTopic()+" ("+currentPost.getCommentCount()+") comments</a></p></div>");
			}
		%>
		<br><a href="../Post/newquestion.html"><button type="button">New Question</button></a>
	</div>
</div>
<%= HeaderGenerator.getFooter() %>
</body>
</html>