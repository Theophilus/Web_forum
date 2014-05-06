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
		<li><a href="userMessages.jsp">Messages</a></li>
		<li><a href="userForum.jsp">Forum</a></li>
		<li><a href="userAds.jsp">Adverts</a></li>
		<li><a href="userSearch.jsp">Search</a></li>
		<li><a href="userGuide.html">User Guide</a></li>
		</ul>
		
	</div>
	
	<div id="userContent">
		
			<% /*
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
		    
	    	//check if usernsme or email exists
		    String getPosts= "SELECT * FROM post WHERE GROUP BY num_of_likes LIMIT 0,20";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					out.print("<br>");
					out.print("<p> Post :<br>"+ result.getInt("sender_id") + "</p>");
					out.print("<p> Timestamp : "+ result.getDate("date_sent") + " " +result.getTime("time_set") +"</p>");
					out.print("<p> Author : "+ result.getTime("") + "</p>");
					out.print("<p> Subject : "+ result.getString("subject") + "</p>");
					out.print("<p> Content : "+ result.getString("content")+ "</p>");
					
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
		}*/
	%>
	</div>
	<div id="userAdvert">


	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>