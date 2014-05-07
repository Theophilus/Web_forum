<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>Advertiser List</title>
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
		<li><a href="#">Advertisement</a></li>
		<li><a href="#">Search</a></li>
		<li><a href="#">User Guide</a></li>
		</ul>
	</div>
	<div>
		<center>
		List of our Current Advertisers!
		</center>
	</div>
	<table border="2">
	<tr>
		<td>Customer ID</td>
		<td>Content</td>
	</tr>
	<%
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement ps = null;
	try
	{
		//Create a connection string
		String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
		//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	    Class.forName("com.mysql.jdbc.Driver");
	
		//Create a connection to your DB
	    conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
		
	    stmt =conn.createStatement();
		String query="SELECT *  FROM advertisement";
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{

		%>
    		<tr>
   	 			<td><%=rs.getInt("ad_id") %></td>
    			<td><%=rs.getString("content") %></td>
			</tr>
        <%

		}
	%>
    </table>
    <%
    	rs.close();
    	stmt.close();
    	conn.rollback();
    	
    	conn.close();
    }
	catch(Exception e)
	{
	    e.printStackTrace();
    }
	%>
