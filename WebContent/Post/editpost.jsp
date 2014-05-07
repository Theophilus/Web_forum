<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<%
	Post currentPost = ThreadController.getQuestion(Integer.parseInt(request.getParameter("postid")));
	int userID = (Integer)session.getAttribute("uid");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>Edit post data</title>
</head>
<body>
<%= HeaderGenerator.getHeader(DataController.getUserType(userID)) %>
<div id="userContent">
	<div class="questionLabel" id="qlabel">
		<p>Topic Description: </p>
		<p>Search Words: </p>
		<p><br>Type your question here: </p>
	</div>
	<div class="questionForm">
		<form class="questiondata" method="post" action="/Web_forum/Post/submitedit.jsp?postid=<%= currentPost.getPostID()%>">
			<p><input type="text" name="topic" value="<%= currentPost.getTopic() %>"></p>
			<p><input type="text" name="searchwords" value="<%= currentPost.getSearchWords() %>"></p>
			<p><br><textarea rows="10" cols="100" name="content"><%= currentPost.getContent() %></textarea></p>
			<br><input value="Submit" type="submit" style="float:left;">
			<% System.out.println(currentPost.getPostID()); %>
		</form>
		<form action="../Post/post.jsp?postid=<%= currentPost.getPostID() %>"><input type="submit" value="Cancel" style="float:left"/></form>
	</div>
</div>
<%= HeaderGenerator.getFooter() %>
</body>
</html>