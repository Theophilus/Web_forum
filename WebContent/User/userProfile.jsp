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
		<div id="profile">
		<br><br><br>
		<% 
	try {
			String accID="";
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
	    	
	    	//check if usernsme or email exists
		    String getPosts= "SELECT account_id, email FROM account WHERE username =?";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setString(1,username);
		   
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					
					accID=result.getString("account_id");
					out.print("<p> Account # :\t\t"+ accID + "</p>");
					out.print("<p> User Name :\t\t"+ username + "</p>");
					out.print("<p> Email Address :\t"+ result.getString("email")+ "</p>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
			    out.print("There data in the system is inconsistent");
			    return;
		  	}
		  	String getData= "SELECT * FROM userAccount WHERE user_id =?";
		    ps = conn.prepareStatement(getData);
		    ps.setString(1,accID);
		    
		    result = ps.executeQuery();
			   
		  	if( result.next() != false){
				do{
					
					out.print("<p> User Rating :\t\t"+result.getString("rating") + "</p>");
					out.print("<p> Number of Posts : "+result.getString("num_of_post") + "</p>");
					out.print("<p> Number of Comments : "+result.getString("num_of_comments") + "</p>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There data in the system is inconsistent");
		  	}
		    
		    
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		
		</div>
		
		<div id="edit button">
		<br>
		<button >Edit</button>
		</div>
	</div>
	<div id="userAdvert">


	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>