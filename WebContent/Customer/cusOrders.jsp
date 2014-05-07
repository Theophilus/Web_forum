<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../Styles/styles.css">
<title>Customer</title>
</head>
<body>
	<div id="header">
		
		<img class="head_img" src="../images/logo.png"/> 
		<a href="../"><button class="logout" type="button">logout</button></a> 
		
	</div>
	<div id="customerMenu">
		<ul>
		<li><a href="cusHome.jsp">Home</a></li>
		<li><a href="cusProfile.jsp">Profile</a></li>
		<li class="selected"><a href="cusOrders.jsp">Order History</a></li>
		<li><a href="cusPlaceAd.jsp">Place Add</a></li>
		</ul>
		
	</div>
	
	<div id="customerContent">
	<h4>Order History</h4>
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
		    String getPosts= "SELECT * FROM purchaseOrder WHERE cus_id=?;";
		    
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setInt(1,uid);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){%>
		  		<table>
				<tr>
				<td><% out.print("<b>Invoice Number</b>");%></td>	
				<td> <% out.print("<b>Duration</b>");%></td>
				<td> <% out.print("<b>Cost</b>");%></td>
				<td><% out.print("<b>Date</b>");%> </td>
				<td><% out.print("<b>Time</b>");%></td>
				</tr>
				<% do{
					out.print("<tr>");
					out.print("<td>"+ result.getString("invoice_num") + "</td>");
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