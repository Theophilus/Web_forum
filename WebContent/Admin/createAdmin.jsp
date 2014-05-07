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
		<li><a href="adminSearch.jsp">Search</a></li>
		<li><a href="createAdmin.jsp">Create Admin</a></li>
		<li><a href="createMod.jsp">Create Moderator</a></li>
		<li><a href="sales.jsp">Sales</a></li>
		
		</ul>
		
	</div>
	
	<div id="adminContent">
		<%session.setAttribute("regtype","new"); %>
		<br><br>
		<p style=color:red;> * fields are required </p>
		<FORM METHOD=POST ACTION="admin_reg.jsp">
		<table>
		<tr>
		<td>Username:*</td>			
		<td><INPUT TYPE=TEXT NAME=username SIZE=40> </td>
		</tr>
		<tr>
		<td>Password:*</td>			
		<td><INPUT TYPE=TEXT NAME=password SIZE=40></td>
		</tr>
		<tr>
		<td>e-mail :*</td>		
		<td><INPUT TYPE=TEXT NAME=email SIZE=40></td>
		</tr>
		<tr>
		<td>First Name:*	</td>	
		<td><INPUT TYPE=TEXT NAME=fname SIZE=40></td>
		</tr>
		<tr>
		<td>Last Name:*	</td>	
		<td><INPUT TYPE=TEXT NAME=lname SIZE=40></td>
		</tr>
		</table>
		<br>
		<a href="adminHome.jsp"><button type="button">Cancel</button></a>
		<INPUT value="Create" TYPE=SUBMIT>
		
		</FORM>
	</div>
	
	
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>