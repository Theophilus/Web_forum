<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>
<%
	int commentID = Integer.parseInt(request.getParameter("commentid"));
	int userID = DataController.getUserID((String)session.getAttribute("username"));
	Comment oldComment = ThreadController.getComment(commentID);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit edit comment data</title>
</head>
<body>
	<%
		String topic = request.getParameter("topic");
		String content = request.getParameter("content");
		Comment newComment = Comment.newComment(userID, oldComment.getAuthorID(), topic, content);
		new ThreadController().editComment(oldComment, newComment, userID);
		
		response.sendRedirect("../Post/post.jsp?postid="+oldComment.getPid());
	%>
</body>
</html>