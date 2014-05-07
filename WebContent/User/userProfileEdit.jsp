<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

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
		<li><a href="userHome.jsp">Home</a></li>
		<li class="selected"><a href="userProfile.jsp">Profile</a></li>
		<li><a href="userMessages.jsp">Messages</a></li>
		<li><a href="userForum.jsp">Forum</a></li>
		<li><a href="userAds.jsp">Adverts</a></li>
		<li><a href="userSearch.jsp">Search</a></li>
		<li><a href="userGuide.jsp">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
		<div id="profile">
		<br><br><br>
		<div id="container" >
		<br><br><br><br>
		<FORM METHOD=POST ACTION="../Registration/user_reg.jsp">
		<table align="center">
		<tr>
		<td>Username:</td>			
		<td><INPUT TYPE=TEXT NAME=username value=<%out.print((String)session.getAttribute("username")); %> SIZE=40> </td>
		</tr>
		<tr>
		<td>Password:</td>			
		<td><INPUT TYPE=TEXT value= <%out.print((String)session.getAttribute("pass")); %> NAME=password SIZE=40> </td>
		</tr>
		<tr>
		<td>e-mail :</td>		
		<td><INPUT TYPE=TEXT NAME=email value=<%out.print((String)session.getAttribute("email")); %> SIZE=40></td>
		</tr>
		</table>
		<br><br>
		<a href="userProfile.jsp"><button type="button">Cancel</button></a> <INPUT value="Save" TYPE=SUBMIT>
		</FORM>
		
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