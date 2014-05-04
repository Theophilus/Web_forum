<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<link rel="stylesheet" type="text/css" href="../Styles/threadstyles.css">
<title>TEST THREAD</title>
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
		<div class="threadBody">
		<br>
			<div class="threadTopic"><h1 class="topicLabel">this is a topic</h1></div>
			<div class="question" id="askerInfo">
				<h4 class="askerName">askingUName</h4>
				<br>
				<div class="userIcon">
					<img src="../images/kappa.png" width="50" height="50">
				</div>
			</div>
			<div class="question" id="questionBody">
				this is the question body
				<div class="threadEditing"><a href="editthread.jsp">Edit</a>   <a href="deletethread.jsp">Delete</a></div>
			</div>
			
			<div class="comment">
				<b>commenter's name</b> [comment's topic]: comment body
			</div>
			<div class="comment">
				<b>commenter's name</b> [comment's topic]: this is a longer comment that will hopefully wrap around to the next line!  perhaps we can get it to wrap again just for testing purposes!!!!   satdtgwsgywhr<div class="threadEditing"><a href="editcomment.jsp">Edit</a>   <a href="deletecomment.jsp">Delete</a></div>
			</div>
		</div>
	</div>
	<div id="userAdvert">


	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>