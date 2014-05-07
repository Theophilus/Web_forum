<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Styles/styles.css">
<script type="text/javascript" src="Scripts/script.js"></script>
<title>login</title>
</head>
<body> 
	<div id="container" >
		<h1 class="login_greetings" >Welcome to Webhackers Forum.<br> Where we speak WEB!!!!</h1>
		<p class=login_img> <img src="images/banner.png" alt="banner"> </p>
	 	<br>
	 	<%
	 	String error = (String)session.getAttribute("error");
	 	if(error == null){
	 		
	 	}
	 	else if(error.equalsIgnoreCase("no inputs")){
	 		out.print("<p style=color:red;> Please enter username and password</p>");
	 	}
	 	else if(error.equalsIgnoreCase("no user")){
	 		out.print("<p style=color:red;> Please enter username!</p>");
	 	}
	 	else if(error.equalsIgnoreCase("no pass")){
	 		out.print("<p style=color:red;> Please enter password!</p>");
	 	}
	 	%>
		<FORM class="login_form" METHOD="POST" ACTION="login.jsp">
		<table align="center">
		<tr>
		<td>Username:</td>		
		<td><INPUT TYPE="TEXT" NAME="username" SIZE=30><BR></td>
		</tr>
		<tr>
		<td>Password:</td>
		<td><INPUT TYPE="password" NAME="password" SIZE=30><BR></td>
		</tr>
		</table>
		<a href="Registration/reset.html">Forgot username or password?</a>
		<br><br>
		<a href="Registration/user.jsp"><button type="button">Sign up</button></a> <INPUT value="login" TYPE=SUBMIT>
		</FORM>
		
		<br>
		<p> Want to place ads?<a href="Registration/customer.jsp"> <b>Click here.</b></a></p>
		<br> <br> <br>
		<p> &#169; webhackers</p>
	</div>

</body>
</html>