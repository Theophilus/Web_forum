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
		<a  href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="customerMenu">
		<ul>
		<li class="selected"><a href="cusHome.jsp">Home</a></li>
		<li><a href="cusProfile.jsp">Profile</a></li>
		<li><a href="cusOrders.jsp">Order History</a></li>
		<li><a href="cusPlaceAd.jsp">Place Add</a></li>
		</ul>
		
	</div>
	
	<div id="customerContent">
	<div id="announcement">
		
		<p>Welcome <% out.print("<b>"+session.getAttribute("username")+"</b>"); %> !!</p>
		<h4>Announcements</h4>
		<% 
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
		    
	    	//check if usernsme or email exists
		    String getPosts= "SELECT content,Adate FROM announcement WHERE audience=? LIMIT 0,9;";
		    
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setString(1,"customer");
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					out.print("<p>"+ result.getString("content") + "</p>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There is no promotion currently!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		
		</div>
		
		<div id="hotTopics">
		<h4>Hot Topics</h4>
		<% 
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
		    
	    	//check if usernsme or email exists
		    String getPosts= "SELECT topic, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		   
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					out.print("<p>"+ result.getString("topic") + "</p>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("Check back soon!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		</div>
		
		
	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>