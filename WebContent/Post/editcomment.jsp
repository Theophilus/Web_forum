<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="model.*" %>
<%@ page import="connect.*" %>
<%
	int commentID = Integer.parseInt(request.getParameter("commentid"));
	Comment comment = ThreadController.getComment(commentID);
	int userID = (Integer)session.getAttribute("uid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>New Comment</title>
</head>
<body>
<%= HeaderGenerator.getHeader(DataController.getUserType(userID)) %>
<div id="userContent">
	<div class="questionLabel" id="qlabel">
		<p>Topic Description: </p>
		<p><br>Type your comment here: </p>
	</div>
	<div class="questionForm">
		<form class="questiondata" method="post" action="/Web_forum/Post/submitcommentedit.jsp?commentid=<%= commentID %>">
			<p><input type="text" name="topic" value="<%= comment.getTopic()%>"></p>
			<p><br><textarea rows="5" cols="100" name="content"><%= comment.getContent() %></textarea></p>
			<br><input value="Submit" type="submit" style="float:left;">	
		</form>
		<form action="../Post/post.jsp?postid=<%= comment.getPid() %>"><input type="submit" value="Cancel" style="float:left"/></form>
	</div>
</div>
<%= HeaderGenerator.getFooter() %>
</body>
</html>