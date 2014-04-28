<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="Scripts/script.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
	try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/projtest";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
		
		  	//Get parameters from the user registration page
		    String username = request.getParameter("username");
		    String passwd = request.getParameter("password");
		    
		    //check for null values
		    if( username ==" " || passwd ==" " || username =="" || passwd ==""){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("index.html");  
			  	}
	    	//Create a SQL statement
		    Statement stmt = conn.createStatement();
	    	
	    	//check if usernsme or email exists
		    String userCheck= "SELECT * FROM account WHERE username = ? AND password  = ?";
		    PreparedStatement ps = conn.prepareStatement(userCheck);
		    ps.setString(1,username);
		    ps.setString(2,passwd);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
		  	//Close the connection.
			    session.setAttribute( "username", username );
		  		String userType=result.getString("accountType");
		  		if(userType.equalsIgnoreCase("admin")){
		  			conn.close();
		  			response.sendRedirect("Admin/adminHome.jsp");  
		  		}
		  		if(userType.equalsIgnoreCase("user")){
		  			conn.close();
		  			response.sendRedirect("User/userHome.jsp");  
		  		}
		  		if(userType.equalsIgnoreCase("customer")){
		  			conn.close();
		  			response.sendRedirect("Customer/customerHome.jsp");  
		  		}
		  		if(userType.equalsIgnoreCase("moderator")){
		  			conn.close();
		  			response.sendRedirect("Mederator/moderatorHome.jsp");  
		  		}
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		response.sendRedirect("index.html");
		  	}
	    	
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
	<p id="test2"></p>
</body>
</html>