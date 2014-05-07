<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.*" %>

<%
	int postID = Integer.parseInt(request.getParameter("postid"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>New Comment</title>
</head>
<body>
<div class="questionLabel" id="qlabel">
		<p>Topic Description: </p>
		<p><br>Type your comment here: </p>
	</div>
	<div class="questionForm">
		<form class="questiondata" method="post" action="/Web_forum/Post/submitcomment.jsp?postid=<%= postID %>">
			<p><input type="text" name="topic"></p>
			<p><br><textarea rows="5" cols="100" name="content"></textarea></p>
			<p><input value="Submit" type="submit"><a href="../Post/post.jsp?postid=<%= postID %>"><button type="button">Cancel</button></a></p>	
		</form>
	</div>
</body>
</html>