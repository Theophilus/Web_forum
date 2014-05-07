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
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
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
		  
		    String regType= (String)session.getAttribute("regtype");
		    String dest= (String) session.getAttribute("origin");
		    int uid=0;
		    if( session.getAttribute("uid") != null){
		     uid= (Integer) session.getAttribute("uid");
		    }
			if(regType == null){
				if( username == null || passwd == null|| email==null){
				  	//Close the connection.
					    conn.close();
				  		response.sendRedirect("customer.html");  
				  	}
		    if( username ==" " || passwd ==" " || username =="" || passwd ==""){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("customer.html");  
			  	}
		    
	    	//check if usernsme or email exists
		    String userCheck= "SELECT username FROM account WHERE username = ?";
		    PreparedStatement ps = conn.prepareStatement(userCheck);
		    ps.setString(1,username);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		  	if(result.next() != false){
		  		session.setAttribute("username", username);
		  		conn.close();
		  		response.sendRedirect("userRegError.jsp");
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
		    String insert = "INSERT INTO account(account_id, username, email, password,Atype,Adate,Atime)" +
	                  "VALUES (?, ?, ?, ?,?,CURDATE(),CURTIME())";
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
			insert = "INSERT INTO userAccount(user_id, rating, num_of_post, num_of_comments)" +
	                  "VALUES (?, ?, ?, ?)";
			ps = conn.prepareStatement(insert);
			ps.setInt(1, userCount);
		    ps.setInt(2, 0);
			ps.setInt(3, 0);
			ps.setInt(4, 0);
			ps.executeUpdate();
			//Close the connection.
			}
			else if(regType.equalsIgnoreCase("update")){
				String update = "UPDATE account SET username=?, email=?, password=? WHERE account_id=?";
			    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = conn.prepareStatement(update);
				
			    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			    ps.setString(1, username);
				ps.setString(2, email);
				ps.setString(3, passwd);
				ps.setInt(4, uid);
				ps.executeUpdate();
				session.setAttribute("regtype", "");
				session.setAttribute("username", username);
				session.setAttribute("regtype", "update");
			}
			
		    conn.close();
		    response.sendRedirect(""+dest);
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
</body>
</html>