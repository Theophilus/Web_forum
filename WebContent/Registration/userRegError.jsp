<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
		<title>User Registration</title>
	</head>
	<body>
	
		<div id="container" >
		<br><br><br>
		<p><%= session.getAttribute("username")%> already exists in system.</p>
		<br>
		<FORM METHOD=POST ACTION="user_reg.jsp">
		<table align="center">
		<tr>
		<td>Username:</td>			
		<td><INPUT TYPE=TEXT NAME=username SIZE=40> </td>
		</tr>
		<tr>
		<td>Password:</td>			
		<td><INPUT TYPE=TEXT NAME=password SIZE=40></td>
		</tr>
		<tr>
		<td>e-mail :</td>		
		<td><INPUT TYPE=TEXT NAME=email SIZE=40></td>
		</tr>
		</table>
		<br><br>
		<a href="../index.html"><button type="button">Cancel</button></a> <INPUT value="SignUp" TYPE=SUBMIT>
		</FORM>
		</div>
	</body>
</html>