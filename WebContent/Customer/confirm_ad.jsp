<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="../Scripts/script.js"></script>
<title></title>
</head>
<body>
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
		
		out.print("<br><br>"+"Topic: "+session.getAttribute("savedTopic")+"<br><br>");
		out.print("Search words: "+session.getAttribute("savedSW")+"<br><br>");
		out.print("Url: "+session.getAttribute("savedUrl")+"<br><br>");
		out.print("Duration: "+session.getAttribute("savednum")+" "+session.getAttribute("savedwm")+"<br><br>");
		out.print("Price: $"+session.getAttribute("newprice")+"<br><br>");
		out.print("Content: "+session.getAttribute("savedContent")+"<br><br>");
		out.print("<br><br><a href="+"\""+"place_ad.jsp"+"\">"+"<button>confirm and buy</button></a>");
		
	%>
	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>
</body>
</html>