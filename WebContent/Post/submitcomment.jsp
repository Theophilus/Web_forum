<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>

<%
	int postID = Integer.parseInt(request.getParameter("postid"));
	int userID = DataController.getUserID((String)session.getAttribute("username"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submitting comment data</title>
</head>
<body>
	<%
		String username = (String)session.getAttribute("username");
		String topic = request.getParameter("topic");
		String content = request.getParameter("content");
		
		Comment comment = Comment.newComment(userID, postID, topic, content);
		ThreadController.postComment(comment);
		
		response.sendRedirect("../Post/post.jsp?postid="+postID);
	%>
</body>
</html>