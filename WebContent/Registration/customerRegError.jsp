<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
		<title>Customer Registration</title>
	</head>
	<body>
		<div id="container" >
		<br><br><br>
		<p style=color:red;><%= session.getAttribute("username")%> already exists in system.</p>
		<p style=color:red;> * fields are required </p>
		<FORM METHOD=POST ACTION="customer_reg.jsp">
		<table align="center">
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
		<tr>
		<td>Company:	</td>		
		<td><INPUT TYPE=TEXT NAME=company SIZE=40></td>
		</tr>
		<tr>
		<td>Address:*</td>			
		<td><INPUT TYPE=TEXT NAME=address SIZE=40></td>
		</tr>
		<tr>
		<td>Address 2:	</td>		
		<td><INPUT TYPE=TEXT NAME=address2 SIZE=40></td>
		</tr>
		<tr>
		<td>City:*</td> <td><INPUT TYPE=TEXT NAME=city SIZE=20></td>
		</tr>
		<tr>
		<td>State:*</td> 
		<td><INPUT TYPE=TEXT NAME=state SIZE=15></td>
		</tr>
		<tr>
		<td>Telephone:</td>			
		<td><INPUT TYPE=TEXT NAME=phone SIZE=15></td>
		</tr>
		</table>
		<br>
		<a href="../index.jsp"><button type="button">Cancel</button></a>
		<INPUT TYPE=SUBMIT>
		
		</FORM>
		
		</div>
		<div id="footer">
		<p> &#169; webhackers</p>

	</div>
	</body>
</html>