<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
		<title>User Registration</title>
	</head>
	<body>
	<%
	session.setAttribute("regtype", "new");
	session.setAttribute("origin", "../");
	%>
		<div id="container" >
		<br><br><br><br>
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
		<a href="../index.jsp"><button type="button">Cancel</button></a> <INPUT value="Sign Up" TYPE=SUBMIT>
		</FORM>
		</div>
		<div id="footer">
		<p> &#169; webhackers</p>

	</div>
	</body>
</html>