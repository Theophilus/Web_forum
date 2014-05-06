<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editing post</title>
</head>
<body>
	<%
		String username = (String)session.getAttribute("username");
		String topic = request.getParameter("topic");
		String search = request.getParameter("searchwords");
		String content = request.getParameter("content");
		int editorID = DataController.getUserID(username);
		int oldPostID = Integer.parseInt(request.getParameter("postid"));
		
		Post newPost = Post.newPost(editorID, topic, search, content);
		Post oldPost = ThreadController.getQuestion(oldPostID);
		
		new ThreadController().editPost(oldPost, newPost);
		
		response.sendRedirect("../Post/post.jsp?postid="+oldPostID);
	%>
</body>
</html>