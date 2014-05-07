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
		<li ><a href="userAds.jsp" >Adverts</a></li>
		<li class="selected"><a href="userSearch.jsp">Search</a></li>
		<li><a href="userGuide.jsp">User Guide</a></li>
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
		    String uname = (String)session.getAttribute("username");
		    String stype = (String)session.getAttribute("stype");
		    String kword = (String)session.getAttribute("keyword");
		    //out.print("stype: "+ stype);
		    if(kword.equalsIgnoreCase("") || stype.equalsIgnoreCase("") || stype == null || kword==null){
		    	return;
		    }
		    
		    String createSearch="";
		    if(stype.equalsIgnoreCase("user")){
		    	ResultSet result;
		    	if(kword.equalsIgnoreCase("ALL")){
		    		createSearch= "SELECT username FROM account WHERE Atype =?";
		    		PreparedStatement ps = conn.prepareStatement(createSearch);
		    		ps.setString(1,"user");
		    		result = ps.executeQuery();
		    	}
		    	else {
		    		createSearch= "SELECT username FROM account WHERE Atype =? AND username LIKE ? ";
		    		PreparedStatement ps = conn.prepareStatement(createSearch);
			    	ps.setString(1,"user");
			    	ps.setString(2,"%"+kword+"%");
			    	//Run the query against the DB
				    result = ps.executeQuery();
		    	}
		    	
			   
			  	if( result.next() != false){
					do{
						out.print("<p>"+ result.getString("username") + "</p>");
			  		}while( result.next() != false);
			  		
			  	}
			  	else{
			  		
			  	//Close the connection.
				    conn.close(); 
			  		out.print("no results found for search.");
			  	}
		    }
		    else if(stype.equalsIgnoreCase("ad")){
		    	ResultSet result;
				if(kword.equalsIgnoreCase("ALL")){
					createSearch ="SELECT content, link_url FROM advertisement";
					PreparedStatement ps = conn.prepareStatement(createSearch);
					result = ps.executeQuery();
		    	}
		    	else {
		    		createSearch ="SELECT content, link_url FROM advertisement WHERE content LIKE ? OR search_words =?";
		    		PreparedStatement ps = conn.prepareStatement(createSearch);
		    		ps.setString(1,"%"+kword+"%");
		    		ps.setString(2,"%"+kword+"%");
		    		//Run the query against the DB
			    	 result = ps.executeQuery();
		    	}
		    	
			  	if( result.next() != false){
					do{
						out.print("<p>" +result.getString("content")  +"</p>");
						out.print("<a href="+ result.getString("link_url") + "\""+">" +"Click here to learn more</a>");
						out.print("<hr>");
			  		}while( result.next() != false);
			  		
			  	}
			  	else{
			  		
			  	//Close the connection.
				    conn.close(); 
			  		out.print("no results found for search.");
			  	}
		    }
		    else if(stype.equalsIgnoreCase("messages")){
		    	ResultSet result;
				if(kword.equalsIgnoreCase("ALL")){
					createSearch= "SELECT * FROM message,account";
					PreparedStatement ps = conn.prepareStatement(createSearch);
					result = ps.executeQuery();
		    	}
		    	else {
		    		createSearch= "SELECT account_id FROM account WHERE username = ?";
			    		PreparedStatement ps = conn.prepareStatement(createSearch);
				    	ps.setString(1, uname);
				    	result = ps.executeQuery();
				    	result.next();
				    	int uid=result.getInt("account_id");
				    	
		    		createSearch= "SELECT * FROM message,account A WHERE content LIKE ? OR subject =?"
		    			+"AND (sender_id = ? OR receiver_id =?)";
		    		ps = conn.prepareStatement(createSearch);
			    	ps.setString(1,"%"+kword+"%");
			    	ps.setString(2,"%"+kword+"%");
			    	ps.setString(3, uname);
			    	ps.setString(4, uname);
			    	result = ps.executeQuery();
		    	}
		  
			   
			  	if( result.next() != false){
					do{
						out.print("<p> Sender :"+ result.getInt("sender_id") + "</p>");
						out.print("<p> Date : "+ result.getDate("date_sent") + "</p>");
						out.print("<p> Time : "+ result.getTime("time_set") + "</p>");
						out.print("<p> Subject : "+ result.getString("subject") + "</p>");
						out.print("<p> Content : "+ result.getString("content")+ "</p>");
						out.print("<hr>");
			  		}while( result.next() != false);
			  		
			  	}
			  	else{
			  		
			  	//Close the connection.
				    conn.close(); 
			  		out.print("no results found for search.");
			  	}
		    }
		    else if(stype.equalsIgnoreCase("post")){
		    	ResultSet result ;
				if(kword.equalsIgnoreCase("ALL")){
					createSearch ="SELECT * FROM post";
					PreparedStatement ps = conn.prepareStatement(createSearch);
					result = ps.executeQuery();
		    	}
		    	else {
		    		createSearch ="SELECT * FROM post WHERE content LIKE ? OR search_words =?"
		    			+"OR topic = ?";
		    		PreparedStatement ps = conn.prepareStatement(createSearch);
			    	ps.setString(1,"%"+kword+"%");
			    	ps.setString(2,"%"+kword+"%");
			    	ps.setString(3,"%"+kword+"%");
			    	result = ps.executeQuery();
		    	}
				
			  	if( result.next() != false){
					do{
						out.print("<p> Topic : "+ result.getString("topic") + "</p>");
						out.print("<p> Content : "+ result.getString("content")+ "</p>");
						out.print("<p> Timestamp : "+ result.getDate("date_created") +"</p>");
						out.print("<hr>");
			  		}while( result.next() != false);
			  		
			  	}
			  	else{
			  		
			  	//Close the connection.
				    conn.close(); 
			  		out.print("no results found for search.");
			  	}
		    }
		    
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			//out.println("Exception: " + e);
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
					 if(count == 4){
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