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
		    Statement stmt = conn.createStatement();
		    
		    ResultSet result;
		  //Populate SQL statement with for count of users.
		    String countQuery = "SELECT COUNT(*) as cnt FROM purchaseOrder";
		    
	    	//Run the query against the DB
		    result = stmt.executeQuery(countQuery);
	    	
	    	//Start parsing out the result of the query.
		    result.next();
		  //Create a SQL statement
		    int invoice = result.getInt("cnt");
		    invoice = invoice +1;
		  	
		    //String regType= (String)session.getAttribute("regtype");
		    //String dest= (String) session.getAttribute("origin");
		    int uid= (Integer) session.getAttribute("uid");
		    
		    
		    //Make an insert statement for the Sells table:
		    String insert = "INSERT INTO purchaseOrder(invoice_num, cus_id, amount, duration,purchase_date,purchase_time)" +
	                  "VALUES (?, ?, ?, ?,CURDATE(),CURTIME())";
		    //Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = conn.prepareStatement(insert);
			
		    //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setInt(1, invoice);
		    ps.setInt(2, uid);
			ps.setFloat(3,Float.parseFloat((String)session.getAttribute("newprice")));
			ps.setString(4,(String) session.getAttribute("savednum") +" "+session.getAttribute("savedwm"));
			
			//Run the query against the DB
			ps.executeUpdate();
			
			insert = "INSERT INTO advertisement(link_url,po, cus_id,content,search_words, num_of_clicks)" +
	                  "VALUES (?, ?, ?, ?,?,?)";
			ps = conn.prepareStatement(insert);
			ps.setString(1,(String) session.getAttribute("savedUrl") );
		    ps.setInt(2, invoice);
		    ps.setInt(3, uid);
			ps.setString(4, (String) session.getAttribute("savedContent"));
			ps.setString(5, (String) session.getAttribute("savedSW"));
			ps.setInt(6, 0);
			ps.executeUpdate();
			//Close the connection.
			
		    conn.close();
		    response.sendRedirect("cusPlaceAd.jsp");
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
<p id="test"></p>
</body>
</html>