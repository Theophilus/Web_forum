<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>Statistics</title>
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
		Some Statistics of our Forum!
		</center>
	</div>
	<table>
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
			String queryUsers ="SELECT MAX(account_id)  FROM account";
			String queryThreads = "SELECT MAX(thread_id)  FROM thread";
			String queryAdvertisements ="SELECT MAX(ad_id)  FROM advertisement";
			String queryPosts = "SELECT MAX(post_id)  FROM post";
			
			ResultSet rsUser= null;
			ResultSet rsThreads = null;
			ResultSet rsAdvertisements = null;
			ResultSet rsPosts = null;
			rsUser = stmt.executeQuery(queryUsers);
			
			while(rsUser.next())
			{
			%>
	    		<tr>
	   	 			<td>Number of Accounts: <%=rsUser.getString(1) %></td>
				</tr>
			<% 
			}
			
			rsThreads = stmt.executeQuery(queryThreads);
			while(rsThreads.next())
			{
			%>
		    		<tr>
		   	 			<td>Number of Threads: <%=rsThreads.getString(1) %></td>
					</tr>
	        <%
			}
			
			rsAdvertisements = stmt.executeQuery(queryAdvertisements);
			while(rsAdvertisements.next())
			{
			%> 
		    		<tr>
		   	 			<td>Number of Advertisements: <%=rsAdvertisements.getString(1) %></td>
					</tr>
	        <%
			}
			
			rsPosts = stmt.executeQuery(queryPosts);
			while(rsPosts.next())
			{
			%> 
		    		<tr>
		   	 			<td>Number of Posts: <%=rsPosts.getString(1) %></td>
					</tr>
	        <%
			}
			%>
		</table>
		<% 
	    	rsUser.close();
	    	rsThreads.close();
	    	rsAdvertisements.close();
	    	rsPosts.close();
	    	stmt.close();
	    	conn.close();
	    }
		catch(Exception e)
		{
		    e.printStackTrace();
	    }
		%>