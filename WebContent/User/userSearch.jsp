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
		<div id="sOptions">
		<h4>Search Option</h4>
		<% session.setAttribute("origin", "../User/userSearch.jsp"); %>
		<FORM METHOD=POST ACTION="../Search/runSearch.jsp">
				
		<select name= "stype">
  			<option value="user">User</option>
  			<option value="ad">Ad</option>
  			<option value="messages">Message</option>
  			<option value="post">Post</option>
		</select>
					
		<INPUT TYPE=TEXT NAME=keyword SIZE=70>
		<INPUT value="Search" TYPE=SUBMIT>
		</FORM>
		</div>
		
		<div id="sResults">
		<h4>Results</h4>
		<% 
		try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String stype = (String)session.getAttribute("stype");
		    String kword = (String) session.getAttribute("keyword");
		    //out.print("keyword: "+kword);
		    if(kword.equalsIgnoreCase("")){
		    	return;
		    }
		    String createSearch="";
		    if(stype.equalsIgnoreCase("user")){
		    	createSearch= "SELECT content, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    }
		    if(stype.equalsIgnoreCase("ad")){
		    	createSearch= "SELECT content, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    }
		    if(stype.equalsIgnoreCase("messages")){
		    	createSearch= "SELECT content, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    }
		    if(stype.equalsIgnoreCase("post")){
		    	createSearch= "SELECT content, num_of_comments FROM post GROUP BY num_of_comments DESC LIMIT 0,9;";
		    }
		    
		    PreparedStatement ps = conn.prepareStatement(createSearch);
		   
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
		  			
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("no results found for search.");
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

	</div>
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>