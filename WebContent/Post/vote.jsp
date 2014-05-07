<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connect.*" %>
<%@ page import="model.*" %>
<%
	int userID = DataController.getUserID((String)session.getAttribute("username"));
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add vote</title>
</head>
<body>
	<%
		int itemID = -1;
		String type = request.getParameter("action");
		Action act = null;
		int postID = -1;
		if(type.equals("pvup")){
			act = Action.PVOTEUP;
			postID = Integer.parseInt(request.getParameter("postid"));
			itemID = postID;
		}
		else if(type.equals("pvdown")){
			act = Action.PVOTEDOWN;
			postID = Integer.parseInt(request.getParameter("postid"));
			itemID = postID;
		}
		else if(type.equals("cvup")){
			act = Action.CVOTEUP;
			postID = ThreadController.getComment(Integer.parseInt(request.getParameter("commentid"))).getPid();
			itemID = Integer.parseInt(request.getParameter("commentid"));
		}
		else if(type.equals("cvdown")){
			act = Action.CVOTEDOWN;
			postID = ThreadController.getComment(Integer.parseInt(request.getParameter("commentid"))).getPid();
			itemID = Integer.parseInt(request.getParameter("commentid"));
		}
		
		
		ThreadController.vote(itemID, act, userID);
		
		response.sendRedirect("../Post/post.jsp?postid="+postID);
	%>
</body>
</html>