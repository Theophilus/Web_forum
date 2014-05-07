<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="Scripts/script.js"></script>
<title>Customer</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		<%  %>
	</div>
	<div id="customerMenu">
		<ul>
		<li><a href="cusHome.jsp">Home</a></li>
		<li><a href="cusProfile.jsp">Profile</a></li>
		<li><a href="cusOrders.jsp">Order History</a></li>
		<li class="selected"><a href="cusPlaceAd.jsp">Place Add</a></li>
		</ul>
		
	</div>
	
	<div id="customerContent">
		<%
		if(session.getAttribute("topic") == "ad error"){
			out.print("<p style=color:red;> please complete all fields<p>");
		}
		%>
		<br><br>
		<p style=color:red;> * fields are required </p>
		<FORM METHOD=POST ACTION="checkPage.jsp">
		<table >
		<tr>
		<td>Topic:*</td>
		</tr>
		<tr>			
		<td><INPUT TYPE=TEXT NAME=topic SIZE=40> </td>
		</tr>
		<tr>
		<td>Search words(separated by space):*</td>
		</tr>
		<tr>			
		<td><INPUT TYPE=TEXT NAME=searchword SIZE=100></td>
		</tr>
		<tr>
		<td>Url:*</td>
		</tr>
		<tr>		
		<td><INPUT TYPE=TEXT NAME=url SIZE=100></td>
		</tr>
		<tr>
		<td>Duration (in weeks or months):*	</td>	
		</tr>
		<tr>
		<td>
		<select id="num" name= "number">
  			<option value="1">1</option>
  			<option value="2">2</option>
  			<option value="3">3</option>
  			<option value="4">4</option>
  			<option value="5">5</option>
  			<option value="6">6</option>
  			<option value="7">8</option>
  			<option value="9">9</option>
  			<option value="10">10</option>
  			<option value="11">11</option>
  			<option value="12">12</option>
		</select>
		<select name="weekmonth" >
  			<option value="Week">Weeks</option>
  			<option value="Month">months</option>
		</select>
		</td>
		</tr>
		<tr>
		<td>Content:*	</td>
		</tr>
		<tr>		
		<td><textarea rows="10" cols="70" name="content"></textarea></td>
		</tr>
		
		</table>
		<br>
		<a href="cusHome.jsp"><button type="button">Cancel</button></a>
		<INPUT value="Buy" TYPE=SUBMIT>
		
		</FORM>
	
	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>