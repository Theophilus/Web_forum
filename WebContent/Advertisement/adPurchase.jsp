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
		
			    //Get parameters from the ad purchase page
			    String link = request.getParameter("link");
		    	String cont = request.getParameter("content");
		    	String searchWords = request.getParameter("search");
		    
	    		//Create a SQL statement
		    	Statement stmt = conn.createStatement();
		    	
		    	//Populate SQL statement with for count of ads.
			    String countQuery = "SELECT COUNT(*) as cnt FROM advertisement";
		    	
		    	//Run the query against the DB
			    ResultSet result = stmt.executeQuery(countQuery);
		    	
		    	//Start parsing out the result of the query.
			    result.next();
		    	
			    //get user count
			    int adCount = result.getInt("cnt");
			    adCount = adCount +1;
	    	
	    		//Create a new advertisement tuple with gathered information
	    		PreparedStatement ps = null;
	    		String name = (String) session.getAttribute("username");
	    		rs=statement.executeQuery("SELECT * FROM students WHERE firstname='" + 
	    			request.getParameter("searchStudent") + "'");
	    		String customerID = "SELECT account_id FROM account WHERE ";
	    		
	    		String insert = "INSERT INTO advertisement(ad_id, link_url, po, cus_id, content, search_words, num_of_clicks)" +
	    			"VALUES (?, ?, ?, ?, ?, ?, 0)";
	    		ps = conn.prepareStatement(insert);
				ps.setInt(1, adCount);
			    ps.setString(2, link);
				ps.setInt(3, adCount);
				ps.setString(4, );
				ps.setString(5, cont);
				ps.setString(6, searchWords);
			} catch (Exception e){
				out.println("Exception: " + e);
			}
	   	%>
	</body>
</html>