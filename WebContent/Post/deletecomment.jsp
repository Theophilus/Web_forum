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
	Comment comment = ThreadController.getComment(commentID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleting comment data</title>
</head>
<body>
	<%
		new ThreadController().deleteComment(comment, userID);
		response.sendRedirect("../Post/post.jsp?postid="+comment.getPid());
	%>
</body>
</html>