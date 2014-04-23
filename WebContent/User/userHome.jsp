<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>user</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="userMenu">
		<ul>
		<li><a href="#">Home</a></li>
		<li><a href="#">Profile</a></li>
		<li><a href="#">Messages</a></li>
		<li><a href="#">Forum</a></li>
		<li><a href="#">Adverts</a></li>
		<li><a href="#">Search</a></li>
		<li><a href="#">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
	<jsp:include page="../Thread/newquestion.html" />
		<br><br><br>
	<p> Login successful !!</p>
	</div>
	<div id="userAdvert">


	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>