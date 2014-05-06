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
<title>Submit new question data</title>
</head>
<body>
	<%
		session.setAttribute("username", "lowill");
		String username = (String)session.getAttribute("username");
		String topic = request.getParameter("topic");
		String search = request.getParameter("searchwords");
		String content = request.getParameter("content");
		
		int userID = DataController.getUserID(username);
		
		Post post = Post.newPost(userID, topic, search, content);
		int newPostID = ThreadController.postQuestion(post, userID);
		
		if(newPostID == -1){
			response.sendRedirect("../Thread/newquestion.html");
		}
		else{
			session.setAttribute("postID", newPostID);
			response.sendRedirect("../Post/post.jsp");
		}
		
	%>
</body>
</html>