<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<script type="text/javascript" src="../Scripts/script.js"></script>

<title>Admin</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="adminMenu">
		<ul>
		<li><a href="adminHome.jsp">Home</a></li>
		<li><a href="adminSearch.jsp">Search</a></li>
		<li><a href="createAdmin.jsp">Create Admin</a></li>
		<li><a href="createMod.jsp">Create Moderator</a></li>
		<li><a href="sales.jsp">Sales</a></li>
		
		</ul>
		
	</div>
	
	<div id="adminContent">
		<h4>Sale History</h4>
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
		    String getPosts= "SELECT * FROM purchaseOrder JOIN advertisement;";
		    
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){%>
		  		<table>
				<tr>
				<td><% out.print("<b>Invoice Number</b>");%></td>
				<td> <% out.print("<b>Customer</b>");%></td>	
				<td> <% out.print("<b>Duration</b>");%></td>
				<td> <% out.print("<b>Cost</b>");%></td>
				<td><% out.print("<b>Date</b>");%> </td>
				<td><% out.print("<b>Time</b>");%></td>
				</tr>
				<% do{
					//check if usernsme or email exists
				    String getSender= "SELECT username FROM account WHERE account_id =?";
				    PreparedStatement ps2 = conn.prepareStatement(getSender);
				    //int id = (Integer)session.getAttribute("uid");
				    ps2.setInt(1, result.getInt("cus_id"));
				  	//Run the query against the DB
				    ResultSet result2 = ps2.executeQuery();
				  	result2.next();
					out.print("<tr>");
					out.print("<td>"+ result.getString("invoice_num") + "</td>");
					out.print("<td>"+ result2.getString("username") + "</td>");
					out.print("<td>"+ result.getString("duration") + "</td>");
					out.print("<td>"+ result.getString("amount") + "</td>");
					out.print("<td>"+ result.getString("purchase_date") + "</td>");
					out.print("<td>"+ result.getString("purchase_time") + "</td>");
					out.print("</tr>");
		  		}while( result.next() != false);
		  		%>
		  		</table>
		  		<% 
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("You have not yet placed an order!");
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