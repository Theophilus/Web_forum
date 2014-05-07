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
		<li><a href="userHome.jsp">Home</a></li>
		<li><a href="userProfile.jsp">Profile</a></li>
		<li class="selected"><a href="userMessages.jsp">Messages</a></li>
		<li><a href="userForum.jsp">Forum</a></li>
		<li><a href="userAds.jsp">Adverts</a></li>
		<li><a href="userSearch.jsp">Search</a></li>
		<li><a href="userGuide.jsp">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
		<div id = "new">
		<br><br>
			<a href="newmessage.html"><button >Compose Message</button></a>
		</div>
		<div id ="recieved">
		<h4>Inbox</h4>
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
		    String getPosts= "SELECT * FROM message WHERE receiver_id =?";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    int id = (Integer)session.getAttribute("uid");
		    ps.setInt(1,id);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
			
		  	if( result.next() != false){
				do{

					  //check if usernsme or email exists
					    String getSender= "SELECT username FROM account WHERE account_id =?";
					    PreparedStatement ps2 = conn.prepareStatement(getSender);
					    //int id = (Integer)session.getAttribute("uid");
					    ps2.setInt(1, result.getInt("sender_id"));
					  	//Run the query against the DB
					    ResultSet result2 = ps2.executeQuery();
					  	result2.next();
					  	out.print("<p> Sender :"+ result2.getString("username") + "</p>");
					out.print("<p> Date : "+ result.getDate("date_sent") + "</p>");
					out.print("<p> Time : "+ result.getTime("time_sent") + "</p>");
					out.print("<p> Subject : "+ result.getString("subject") + "</p>");
					out.print("<p> Content : "+ result.getString("content")+ "</p>");
					out.print("<hr>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("Your imbox is empty!!!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		</div>
		<div id ="recieved">
		<h4>Outbox</h4>
		<% 
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
		    int id = (Integer)session.getAttribute("uid");
		    
	    	//check if usernsme or email exists
		    String getPosts= "SELECT * FROM message WHERE sender_id =?";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setInt(1,id);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					
					//check if usernsme or email exists
				    String getSender= "SELECT username FROM account WHERE account_id =?";
				    PreparedStatement ps2 = conn.prepareStatement(getSender);
				    //int id = (Integer)session.getAttribute("uid");
				    ps2.setInt(1, result.getInt("receiver_id"));
				  	//Run the query against the DB
				    ResultSet result2 = ps2.executeQuery();
				  	result2.next();
				  	out.print("<p> Sender :"+ result2.getString("username") + "</p>");
					out.print("<p> Date : "+ result.getDate("date_sent") + "</p>");
					out.print("<p> Time : "+ result.getTime("time_sent") + "</p>");
					out.print("<p> Subject : "+ result.getString("subject") + "</p>");
					out.print("<p> Content : "+ result.getString("content")+ "</p>");
					out.print("<hr>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("Your outbox is empty !!!");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
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
					 if(count == 3){
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
		  		out.print("You have not yet placed an order!");
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