<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>Customer</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="customerMenu">
		<ul>
		<li><a href="cusHome.jsp">Home</a></li>
		<li class="selected"><a href="cusProfile.jsp">Profile</a></li>
		<li><a href="cusOrders.jsp">Order History</a></li>
		<li><a href="cusPlaceAd.jsp">Place Add</a></li>
		</ul>
		
	</div>
	
	<div id="customerContent">
	
		<br>
		<%
		session.setAttribute("regtype", "new");
		%>
		<br><br>
		<p style= color:red;align:center;> * fields are required </p>
		<FORM METHOD=POST ACTION="customer_reg.jsp">
		<table>
		<tr>
		<td>Username:*</td>			
		<td><INPUT TYPE=TEXT NAME=username SIZE=40 value <%out.print(); %>> </td>
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
		<td>Zip Code:*</td> 
		<td><INPUT TYPE=TEXT NAME=zip SIZE=15></td>
		</tr>
		<tr>
		<td>Telephone:</td>			
		<td><INPUT TYPE=TEXT NAME=phone SIZE=15></td>
		</tr>
		</table>
		<br>
		<a href="cusProfile.jsp"><button type="button">Cancel</button></a>
		<INPUT value="Save" TYPE=SUBMIT>
		
		</FORM>
		
		</div>
		
	
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>