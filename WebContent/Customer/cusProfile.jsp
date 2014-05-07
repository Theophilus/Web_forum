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
		<li class="selected"><a href="cusProfile.jsp">Profile</a></li>
		<li><a href="cusOrders.jsp">Order History</a></li>
		<li><a href="cusPlaceAd.jsp">Place Add</a></li>
		</ul>
		
	</div>
	
	<div id="customerContent">
	
		<br><br><br>
		<% 
	try {
			String accID="";
			//Create a connection string
			String url = "jdbc:mysql://cs336-26.cs.rutgers.edu:3306/webforum";
	    	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
		    Class.forName("com.mysql.jdbc.Driver");
	    
	    	//Create a connection to your DB
		    Connection conn = DriverManager.getConnection(url, "csuser", "csc5cb45");
	
		    String username = (String)session.getAttribute("username");
	    	
	    	//check if usernsme or email exists
		    String getPosts= "SELECT account_id, email,password FROM account WHERE username =?";
		    PreparedStatement ps = conn.prepareStatement(getPosts);
		    ps.setString(1,username);
		   
		  	//Run the query against the DB
		    ResultSet result = ps.executeQuery();
		   
		  	if( result.next() != false){
				do{
					session.setAttribute("regtype", "update");
					session.setAttribute("origin", "../User/userProfile.jsp");
					session.setAttribute("email", result.getString("email"));
					session.setAttribute("pass", result.getString("password"));
					accID=result.getString("account_id");
					out.print("<p> Account # :\t\t"+ accID + "</p>");
					out.print("<p> User Name :\t\t"+ username + "</p>");
					out.print("<p> Email Address :\t"+ result.getString("email")+ "</p>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
			    out.print("There data in the system is inconsistent");
			    return;
		  	}
		  	String getData= "SELECT * FROM customerAccount WHERE customer_id =?";
		    ps = conn.prepareStatement(getData);
		    ps.setString(1,accID);
		    
		    result = ps.executeQuery();
			   
		  	if( result.next() != false){
				do{
					out.print("<p> Name :"+result.getString("Fname") +" "+result.getString("Lname")+ "</p>");
					if(result.getString("tel") == null){
						out.print("<p> Tel : "+"Not Provided" + "</p>");
					}
					else {
						out.print("<p> Tel : "+result.getString("tel") + "</p>");
					}
					if(result.getString("company") == null){
						out.print("<p> Company : "+"Not Provided" + "</p>");
					}
					else {
						out.print("<p> Company : "+result.getString("company") + "</p>");
					}
					out.print("<p> Address : "+result.getString("address") + "</p>");
					out.print("<p> Number of Ads : "+result.getString("num_of_ads") + "</p>");
					//out.print("<br><br><a href="+"\""+"cusProfileEdit.jsp"+"\""+"><button>Edit</button></a>");
		  		}while( result.next() != false);
		  		
		  	}
		  	else{
		  		
		  	//Close the connection.
			    conn.close(); 
		  		out.print("There data in the system is inconsistent");
		  	}
		    
		    
			//Close the connection.
		    conn.close();
			
		} catch (Exception e){
			out.println("Exception: " + e);
		}
	%>
		<!--  <a href="cusProfileEdit.jsp"><button>Edit</button></a>-->
		</div>
	
	<div id="footer">
		<p> &#169; webhackers</p>

	</div>

</body>
</html>