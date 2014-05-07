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
		
		    String regType= (String)session.getAttribute("regtype");
		    String dest= (String) session.getAttribute("origin");
		    int uid= (Integer) session.getAttribute("uid");
			
		  //Get parameters from the user registration page
		    String username = request.getParameter("username");
		    String passwd = request.getParameter("password");
		    String email = request.getParameter("email");
		    String company = request.getParameter("company");
		    String fname = request.getParameter("fname");
		    String lname = request.getParameter("lname");
		    String addr = request.getParameter("address");
		    String addr2= request.getParameter("address2");
		    String city = request.getParameter("city");
		    String state = request.getParameter("state");
		    String zip = request.getParameter("zip");
		    String tel = request.getParameter("phone");
		    
		    
			if(regType.equalsIgnoreCase("update")){
				String update = "UPDATE account SET username=?, email=?, password=? WHERE account_id=?";
			    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
				/*PreparedStatement ps = conn.prepareStatement(update);
				
			    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			    ps.setString(1, username);
				ps.setString(2, email);
				ps.setString(3, passwd);
				ps.setInt(4, uid);
				ps.executeUpdate();
				session.setAttribute("regtype", "");
				session.setAttribute("username", username);
				session.setAttribute("regtype", "update");*/
			}
			else{
		  
	    	//Create a SQL statement
		    Statement stmt = conn.createStatement();
		    
		    if( email ==" " || fname ==" " || email ==null || fname ==null){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("customer.jsp");  
			  	}
		    if( lname ==" " || addr ==" " || addr ==null || lname ==null){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("customer.jsp");  
			  	}
		    if( city ==" " || state ==" " || city ==null || state == null){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("customer.jsp");  
			  	}
		    if( username ==" " || passwd ==" " || username == null || passwd == null){
			  	//Close the connection.
				    conn.close();
			  		response.sendRedirect("customer.jsp");  
			  	}
	    	//check if usernsme or email exists
		    String userCheck= "SELECT username FROM account WHERE username = ?";
		    PreparedStatement ps = conn.prepareStatement(userCheck);
		    ps.setString(1,username);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		    
		    
		  	if(result.next() != false){
		  		conn.close();
		  		session.setAttribute("username", username);
		  		response.sendRedirect("customerRegError.jsp");
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
			ps.setString(5, "customer");
			
			//Run the query against the DB
			ps.executeUpdate();
			insert = "INSERT INTO customerAccount(customer_id, tel, company, Fname, Lname, address, num_of_ads)" +
	                  "VALUES (?, ?, ?, ?,?,?,?)";
			ps = conn.prepareStatement(insert);
			ps.setInt(1, userCount);
		    ps.setString(2, tel);
			ps.setString(3, company);
			ps.setString(4, fname);
			ps.setString(5, lname);
			ps.setString(6, addr+" "+addr2+","+city+","+state+" "+zip);
			ps.setInt(7, 0);
			ps.executeUpdate();
			//Close the connection.
		    conn.close();
		    response.sendRedirect("../index.jsp");
		    
			}
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>

</body>
</html>