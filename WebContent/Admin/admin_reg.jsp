<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="../Scripts/script.js"></script>
<title></title>
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
		    String email = request.getParameter("email");
		    
	    	//Create a SQL statement
		    Statement stmt = conn.createStatement();
	    	
	    	//check if usernsme or email exists
		    String userCheck= "SELECT username FROM account WHERE username = ?";
		    PreparedStatement ps = conn.prepareStatement(userCheck);
		    ps.setString(1,username);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		    
		    
		  	if(result.next() != false){
		  		conn.close(); %>
		  		
		  		
		  		<% response.sendRedirect("../Registration/user.html");
		  		return;
		  	}
	    	
	    	//Populate SQL statement with for count of users.
		    String countQuery = "SELECT COUNT(*) as cnt FROM account";
	    	
	    	//Run the query against the DB
		    result = stmt.executeQuery(countQuery);
	    	
	    	//Start parsing out the result of the query.
		    result.next();
	    	
		    //get user count
		    int userCount = result.getInt("cnt");
		    userCount = userCount +1;
		    
		    //Make an insert statement for the Sells table:
		    String insert = "INSERT INTO account(account_id, username, email, password,accountType)" +
	                  "VALUES (?, ?, ?, ?,?)";
		    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
			ps = conn.prepareStatement(insert);
			
		    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setInt(1, userCount);
		    ps.setString(2, username);
			ps.setString(3, email);
			ps.setString(4, passwd);
			ps.setString(5, "user");
			
			//Run the query against the DB
			ps.executeUpdate();
			
			//Close the connection.
		    conn.close();
		    response.sendRedirect("createAdmin.html");
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
<p id="test"></p>
</body>
</html>