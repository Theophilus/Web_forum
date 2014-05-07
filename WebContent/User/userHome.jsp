<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>user</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="userMenu">
		<ul>
		<li class="selected"><a href="userHome.jsp">Home</a></li>
		<li><a href="userProfile.jsp">Profile</a></li>
		<li><a href="userMessages.jsp">Messages</a></li>
		<li><a href="../Thread/thread.jsp?threadid=1">Forum</a></li>
		<li><a href="userAds.jsp">Adverts</a></li>
		<li><a href="userSearch.jsp">Search</a></li>
		<li><a href="userGuide.jsp">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
		<div id="announcement">
		<p>Welcome <% out.print(session.getAttribute("username")); %> !!</p>
		<h4>Announcements</h4>
		<p>New to this site! <a href="userGuide.html">Click here </a> to learn how to navigate through the site</p>
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
		    ps.setString(1,"user");
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
		  		//out.print("There is no promotion currently!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		
		</div>
		
		<div id="hotTopics">
		<h4>Hot Posts</h4>
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
		    String getPosts= "SELECT content, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		   
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
		  			
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There are no post in the system.");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		</div>
		
		<div id="activeUsers">
		
		
		<div id="newUsers">
		<h4>New Users</h4>
		<% 
		try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
		    
	    	//Create a SQL statement
		    Statement stmt = conn.createStatement();
	    	
	    	//check if usernsme or email exists
		    String getPosts= "SELECT account_id,username FROM account  WHERE NOT(username = ?) AND Atype=?  GROUP BY account_id DESC LIMIT 0,9";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setString(1,username);
		    ps.setString(2,"user");
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
		  		do{
		  			out.print("<p>"+ result.getString("username") + "</p>");
		  			
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There are no new users in the system.");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		</div>
		</div>
	</div>
	</div>
	<div id="userAdvert">
		<% 
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    	int uid = (Integer) session.getAttribute("uid");
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
		    
	    	//check if usernsme or email exists
		    String getPosts= "SELECT * FROM advertisement LIMIT 0,6";
		    
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   	int count =0;
		  	if( result.next() != false){
		  		
				 do{
					 if(count == 0){
					out.print("<br>");
					out.print("<p>" +result.getString("content")  +"</p>");
					out.print("<a href="+ result.getString("link_url") + "\""+">" +"Click here to learn more</a>");
					out.print("<br>");
					out.print("<hr>");
					 }
		  		}while( result.next() != false);
		  		 
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		//out.print("You have not yet placed an order!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>

	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>