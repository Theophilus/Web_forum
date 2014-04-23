<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<li><a href="adminHome.jsp" >Home</a></li>
		<li><a href="#2" onclick="changeTo(profile)">Profile</a></li>
		<li><a href="#3" onclick="changeTo(messages)">Messages</a></li>
		<li><a href="#4" onclick="changeTo(forum)">Forum</a></li>
		<li><a href="#5" onclick="changeTo(search)">Search</a></li>
		<li><a href="#6" onclick="changeTo(admin)">Create Admin</a></li>
		<li><a href="#7" onclick="changeTo(moderator)">Create Moderator</a></li>
		<li><a href="#8" onclick="changeTo(customer)">Create Customer</a></li>
		<li><a href="#9" onclick="changeTo(user)">Create User</a></li>
		<li><a href="#10" onclick="changeTo(sales)">Sales</a></li>
		
		</ul>
		
	</div>
	
	<div id="adminContent">
	
		<br><br><br>
	<p> Admin Login successful !!</p>
	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>