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
		<% 
		try {
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
		    
	    	//Create a SQL statement
		    Statement stmt = conn.createStatement();
	    	
	    	//check if usernsme or email exists
		    String getPosts= "SELECT * FROM account WHERE NOT (username =?) GROUP BY account_id DESC ";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setString(1,username);
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){%>
		  		<table>
				<tr>
				<td><% out.print("<b>Account ID</b>");%></td>	
				<td> <% out.print("<b>Username</b>");%></td>
				<td> <% out.print("<b>Account Type</b>");%></td>
				<td><% out.print("<b>Creation Date</b>");%> </td>
				<td><% out.print("<b>Creation Time</b>");%></td>
				</tr>
				
		  		<% do{
		  			out.print("<tr>");
		  			out.print("<td>"+ result.getString("account_id") + "\t"+"</td>");
		  			out.print("<td>"+ result.getString("username") + "\t"+"</td>");
		  			out.print( "<td>"+result.getString("Atype") + "\t"+"</td>");	
		  			out.print("<td>"+ result.getString("Adate") + "\t"+"</td>");	
		  			out.print("<td>"+ result.getString("Atime") + "\t"+"</td>");
		  			out.print("</tr>");
		  		}while( result.next() != false);%>
		  		</table>
		  	<% }
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There are no accounts in the system.");
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