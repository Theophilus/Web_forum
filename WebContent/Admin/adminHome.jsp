<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="../Scripts/script.js"></script>

<title>Admin</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="adminMenu">
		<ul>
		<li><a href="adminHome.jsp">Home</a></li>
		<li><a href="adminProfile.jsp">Profile</a></li>
		<li><a href="adminMessages.jsp">Messages</a></li>
		<li><a href="adminForum.jsp">Forum</a></li>
		<li><a href="adminSearch.jsp">Search</a></li>
		<li><a href="createAdmin.html">Create Admin</a></li>
		<li><a href="createMod.html">Create Moderator</a></li>
		<li><a href="createCust.html">Create Customer</a></li>
		<li><a href="createUsr.html">Create User</a></li>
		<li><a href="sales.jsp">Sales</a></li>
		
		</ul>
		
	</div>
	
	<div id="adminContent">
		<br>
	<% out.println("The user of this page is: "+session.getAttribute("username")); %>
	</div>
	
	
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>